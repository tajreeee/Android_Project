// import 'package:firebase_auth/firebase_auth.dart';

// import 'toast.dart';


// class FirebaseAuthService {

//   FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<User?> signUpWithEmailAndPassword(String email, String password) async {

//     // try {
//     //   UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
//     //   return credential.user;
//     // } on FirebaseAuthException catch (e) {

//     //   if (e.code == 'email-already-in-use') {
//     //     showToast(message: 'The email address is already in use.');
//     //   } else {
//     //     showToast(message: 'An error occurred: ${e.code}');
//     //   }
//     // }

//     on FirebaseAuthException catch (e) {
//   handleAuthException(e, isSignUp: true);
//     return null;

//   }

//   Future<User?> signInWithEmailAndPassword(String email, String password) async {

//     on FirebaseAuthException catch (e) {
//   handleAuthException(e, isSignUp: true); // or false in sign-in
// }


//     // try {
//     //   UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
//     //   return credential.user;
//     // } on FirebaseAuthException catch (e) {
//     //   if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//     //     showToast(message: 'Invalid email or password.');
//     //   } else {
//     //     showToast(message: 'An error occurred: ${e.code}');
//     //   }

//     // }
//     return null;

//   }


//   void handleAuthException(FirebaseAuthException e, {bool isSignUp = false}) {
//   if (isSignUp && e.code == 'email-already-in-use') {
//     showToast(message: 'The email address is already in use.');
//   } else if (!isSignUp && (e.code == 'user-not-found' || e.code == 'wrong-password')) {
//     showToast(message: 'Invalid email or password.');
//   } else {
//     showToast(message: 'An error occurred: ${e.code}');
//   }
// }

// }

import 'package:firebase_auth/firebase_auth.dart';
import 'toast.dart';


class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      handleAuthException(e, isSignUp: true);
      return null;
    }
  }


  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      handleAuthException(e, isSignUp: false);
      return null;
    }
  }


  void handleAuthException(FirebaseAuthException e, {bool isSignUp = false}) {
    if (isSignUp && e.code == 'email-already-in-use') {
      showToast(message: 'The email address is already in use.');
    } else if (!isSignUp && (e.code == 'user-not-found' || e.code == 'wrong-password')) {
      showToast(message: 'Invalid email or password.');
    } else {
      showToast(message: 'An error occurred: ${e.code}');
    }
  }
}
// s


// import 'package:firebase_auth/firebase_auth.dart';

// class AuthResult {
//   final User? user;
//   final String? errorMessage;

//   AuthResult({this.user, this.errorMessage});
// }

// class FirebaseAuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<AuthResult> signUpWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential credential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return AuthResult(user: credential.user);
//     } on FirebaseAuthException catch (e) {
//       return AuthResult(errorMessage: _getErrorMessage(e, isSignUp: true));
//     }
//   }

//   Future<AuthResult> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential credential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return AuthResult(user: credential.user);
//     } on FirebaseAuthException catch (e) {
//       return AuthResult(errorMessage: _getErrorMessage(e, isSignUp: false));
//     }
//   }

//   String _getErrorMessage(FirebaseAuthException e, {required bool isSignUp}) {
//     if (isSignUp && e.code == 'email-already-in-use') {
//       return 'The email address is already in use.';
//     } else if (!isSignUp && (e.code == 'user-not-found' || e.code == 'wrong-password')) {
//       return 'Invalid email or password.';
//     } else {
//       return 'An error occurred: ${e.code}';
//     }
//   }
// }
