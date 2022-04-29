import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

class AuthClass {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // final storage = new FlutterSecureStorage();

  //Create Account
  createAccount({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Account created";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return "Error occurred";
    }
  }

  //Sign in user
  signIN({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

  //Reset Password
  Future<String> resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      return "Email sent";
    } catch (e) {
      return "Error occurred";
    }
  }

  //SignOut
  void signOut() {
    auth.signOut();
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

  //   final GoogleSignInAuthentication googleAuth =
  //       await googleuser!.authentication;

  //   final OAuthCredential credential = GoogleAuthProvider.credential(
  //       idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  // phone auth

  // Future<void> verifyPhoneNumber(
  //     String phoneNumber, BuildContext context, Function setData) async {
  //   PhoneVerificationCompleted verificationCompleted =
  //       (PhoneAuthCredential phoneAuthCredential) async {
  //     //showSnackBar(context, "Verification Completed");
  //   };
  //   PhoneVerificationFailed verificationFailed =
  //       (FirebaseAuthException exception) {
  //     showSnackBar(context, exception.toString());
  //   };
  //   PhoneCodeSent codeSent =
  //       (String verificationID, [int? forceResnedingtoken]) {
  //     showSnackBar(context, " Code sent on the number");
  //     setData(verificationID);
  //   };

  //   PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
  //       (String verificationID) {
  //     // showSnackBar(context, "Time out");
  //   };
  //   try {
  //     await auth.verifyPhoneNumber(
  //         timeout: Duration(seconds: 45),
  //         phoneNumber: phoneNumber,
  //         verificationCompleted: verificationCompleted,
  //         verificationFailed: verificationFailed,
  //         codeSent: codeSent,
  //         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  // Future<void> signInwithPhoneNumber(
  //     String verificationId, String smsCode, BuildContext context) async {
  //   try {
  //     AuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId, smsCode: smsCode);

  //     UserCredential userCredential =
  //         await auth.signInWithCredential(credential);
  //     storeTokenAndData(userCredential);
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (builder) => Homepage()),
  //         (route) => false);

  //     showSnackBar(context, "logged In");
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  // void showSnackBar(BuildContext context, String text) {
  //   final snackBar = SnackBar(content: Text(text));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  // void storeTokenAndData(UserCredential userCredential) async {
  //   print("storing token and data");
  //   await storage.write(
  //       key: "token", value: userCredential.credential!.token.toString());
  //   await storage.write(
  //       key: "usercredential", value: userCredential.toString());
  // }

  // Future getToken() async {
  //   return await storage.read(key: "token");
  // }
}
