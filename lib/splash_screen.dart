import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import for using Google Fonts

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 7.5 seconds
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget.child!),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/splash.jpg', // Replace with your background image asset
            fit: BoxFit.cover,
          ),
          // TweenAnimationBuilder for Zoom-In Effect
          Center(
            child: TweenAnimationBuilder(
              duration: Duration(seconds: 2),  // Duration of the zoom-in animation
              curve: Curves.easeInOut,  // Smooth curve for zooming
              tween: Tween<double>(begin: 0.0, end: 1.2), // Scaling from 0 to 1.5x
              builder: (context, double scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                children: [
                  // First Text: "Welcome"
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pacifico(
                      fontSize: 40, // Slightly smaller font size for better readability
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.7),
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // Second Text: "to"
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pacifico(
                      fontSize: 40, // Slightly smaller font size for better readability
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.7),
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // Third Text: "USA UNI EXPLORER"
                  Text(
                    'USA  UNI  EXPLORER',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pacifico(
                      fontSize: 35, // Larger font size for impact
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.7),
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
