import 'package:flutter/material.dart';
import 'package:playground/screens/authenticate/login.dart';
import 'package:playground/screens/authenticate/stepper_registration.dart';
import 'package:playground/screens/home.dart';
import 'package:playground/screens/landingpage.dart';
import 'package:playground/screens/playground_home.dart';
import 'package:playground/services/auth.dart';
import 'package:provider/provider.dart';

import 'screens/authenticate/forgot_password.dart';
import 'screens/authenticate/register.dart';

void main() => runApp(ChangeNotifierProvider<AuthService>(
      child: MyHome(),
      create: (BuildContext context) {
        return AuthService();
      },
    ));

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        // This is the base page/route
        '/home': (context) => Home(),

        '/login': (context) => Login(),

        '/forgotpass': (context) => ForgotPassword(),

        '/register': (context) => Register(),

        '/playhome': (context) => PlaygroundHome(),

        '/stepper': (context) => StepperRegistration(),
      },
    );
  }
}
