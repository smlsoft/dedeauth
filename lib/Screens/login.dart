import 'package:dedeauth/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dedeauth/Screens/registration.dart';
import 'package:dedeauth/Screens/telephone_screen.dart';
import 'package:dedeauth/components/singin_button.dart';

import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:dedeauth/global.dart' as global;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  AuthService appAuth = new AuthService();

  String error = '';
  String verificationId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "DEDE Auth",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            inherit: true,
                            fontSize: 48.0,
                            color: Colors.blue,
                            shadows: [
                              Shadow(
                                  // bottomLeft
                                  offset: Offset(-1.5, -1.5),
                                  color: Colors.white),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(1.5, -1.5),
                                  color: Colors.white),
                              Shadow(
                                  // topRight
                                  offset: Offset(1.5, 1.5),
                                  color: Colors.white),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-1.5, 1.5),
                                  color: Colors.white),
                            ]),
                      ),
                    ))),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value != null && value.isNotEmpty ? null : 'Required',
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value != null && value.isNotEmpty ? null : 'Required',
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 10),
              child: SingInButton(
                labelText: 'เข้าสู่ระบบ',
                press: () {},
                img: const AssetImage("assets/img/avatar.png"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 5, bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: SingInButton(
                labelText: 'Sing in with Line',
                press: () async {
                  bool _result = await appAuth.signInWithGoogle();
                  print(_result);
                },
                img: const AssetImage("assets/img/line_logo.png"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: SingInButton(
                labelText: 'Sing in with Google',
                press: () async {
                  bool _result = await appAuth.signInWithLine();
                  print(_result);
                },
                img: const AssetImage("assets/img/google_logo.png"),
              ),
            ),
            // Container(
            //   margin:
            //       const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            //   child: SingInButton(
            //     labelText: 'Sing in with Facebook',
            //     press: () {},
            //     img: const AssetImage("assets/img/facebook_logo.png"),
            //   ),
            // ),
            // Container(
            //   margin:
            //       const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            //   child: SingInButton(
            //     labelText: 'Sing in with Apple ID',
            //     press: () {},
            //     img: const AssetImage("assets/img/apple_logo.png"),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: SingInButton(
                labelText: 'Sing in with Phone Number',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelephoneScreen(),
                    ),
                  );
                },
                img: const AssetImage("assets/img/apple_logo.png"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 10),
              child: SingInButton(
                labelText: 'ลงทะเบียนใหม่',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ),
                  );
                },
                img: const AssetImage("assets/img/email.png"),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
