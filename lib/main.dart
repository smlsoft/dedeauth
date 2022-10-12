import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:dedeauth/Screens/login.dart';

import 'package:dedeauth/firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:dedeauth/app_observer.dart';

import 'package:dedeauth/bloc/login_bloc/login_bloc.dart';
import 'package:dedeauth/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

bool shouldUseFirebaseEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  // await SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  LineSDK.instance.setup("1657550806").then((_) {
    print("LineSDK Prepared");
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(userRepository: UserRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoaderOverlay(
          overlayColor: Colors.black,
          overlayOpacity: 0.8,
          child: Login(),
        ),
      ),
    );
  }
}
