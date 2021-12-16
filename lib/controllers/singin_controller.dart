import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:order_app/models/user.dart';
import 'package:order_app/routes/routes.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SingInController extends GetxController{
  final FirebaseAuth auth  = FirebaseAuth.instance;
  late String a = "";
  bool checkLoadingSMS = false;

  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController01 = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }


  Future<void> signInWithPhone({required String numberPhone}) async {

    auth.verifyPhoneNumber(
        phoneNumber: "+84$numberPhone",
        verificationCompleted: (phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential).then((value) => null).catchError((e) => throw Exception(e));
        },
        verificationFailed: (error) {

        },
        codeSent: (verificationId, forceResendingToken) {
          a = verificationId;
          update();
        },
        codeAutoRetrievalTimeout: (verificationId) {
          a= verificationId;
          update();
        },);
  }
  void signInPhoneDoneSMS({required String sms}) async {
    checkLoadingSMS = true;
    update(["button"]);
    await auth.signInWithCredential(
      PhoneAuthProvider.credential(verificationId: a, smsCode: sms)).then((value) {
        Get.toNamed(Routes.HOME_SCREEN);
    });
  }
}



