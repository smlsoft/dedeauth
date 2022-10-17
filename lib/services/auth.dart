import 'package:dedeauth/global.dart' as global;
import 'package:dedeauth/repositories/user_repository.dart';
import 'package:dedeauth/struct/userlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepository = new UserRepository();
  Future<bool> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        await _auth.signInWithCredential(credential);
        global.loginType = global.LoginType.google;
        global.loginName = _auth.currentUser?.displayName ?? '';
        global.loginPhotoUrl = _auth.currentUser?.photoURL ?? '';
        print(_auth.currentUser?.displayName);
        return true;
      } on FirebaseAuthException catch (e) {
        print(e);
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> signInWithLine() async {
    try {
      final result =
          await LineSDK.instance.login(scopes: ["profile", "openid", "email"]);
      global.loginType = global.LoginType.line;
      global.loginName = result.userProfile?.displayName ?? '';

      global.loginEmail = result.accessToken?.email ?? '';
      global.loginPhotoUrl = result.userProfile?.pictureUrl ?? '';
      return true;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    appleProvider.addScope('email');

    await _auth.signInWithProvider(appleProvider);
  }

  Future<void> signInWithEmail(String userName, String passWord) async {
    final _result = await _userRepository.authenUser(userName, passWord);
    if (_result.success) {
      final appConfig = GetStorage("AppConfig");

      appConfig.write("token", _result.data["token"]);
    }
  }
}
