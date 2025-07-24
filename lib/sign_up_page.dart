
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firebase_auth_services.dart';
import 'login_page.dart';
import 'form_container_widget.dart';
import 'toast.dart';
import 'user_profile_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final _formData = _SignUpFormData(); // Form data object

  bool _isSigningUp = false;

  @override
  void dispose() {
    _formData.dispose(); // Dispose form controllers from class
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/blur.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Sign up to continue",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 40),

                    _buildTextField(_formData.usernameController, "Username", false),
                    SizedBox(height: 15),
                    _buildTextField(_formData.emailController, "Email Address", false),
                    SizedBox(height: 15),
                    _buildTextField(_formData.passwordController, "Password", true),
                    SizedBox(height: 30),

                    GestureDetector(
                      onTap: _signUp,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade400,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Center(
                          child: _isSigningUp
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                              (route) => false,
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.greenAccent.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, bool isPassword) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  bool isPasswordStrong(String password) {
    if (password.length < 8) return false;

    final letterReg = RegExp(r'[A-Za-z]');
    final numReg = RegExp(r'[0-9]');
    final charReg = RegExp(r'[!@#$%^&*()_]');

    return letterReg.hasMatch(password) && numReg.hasMatch(password) && charReg.hasMatch(password);
  }

  void _signUp() async {
    String username = _formData.username;
    String email = _formData.email;
    String password = _formData.password;

    if (!isPasswordStrong(password)) {
      showToast(message: "Password must be at least 8 characters long");
      return;
    }

    setState(() => _isSigningUp = true);

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() => _isSigningUp = false);

    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
        showToast(message: "Verification email sent to $email");
      }

      await saveUserProfile(user.uid, username, null);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Verify your email"),
          content: Text("Please check your inbox and click the link to verify your account."),
          actions: [
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      showToast(message: "Some error happened");
    }
  }
}

// New helper class inside this same file to fix data clump

class _SignUpFormData {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  String get username => usernameController.text.trim();
  String get email => emailController.text.trim();
  String get password => passwordController.text;
}
