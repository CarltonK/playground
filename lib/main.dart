import 'package:flutter/material.dart';
import 'package:playground/screens/home.dart';
import 'package:playground/screens/landingpage.dart';
import 'package:playground/screens/playground_home.dart';

import 'file:///E:/Android/playground/lib/screens/authenticate/forgot_password.dart';
import 'file:///E:/Android/playground/lib/screens/authenticate/login.dart';
import 'file:///E:/Android/playground/lib/screens/authenticate/register.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    // This is the base page/route
    '/': (context) => LandingPage(),
    '/home': (context) => Home(),
    '/login': (context) => Login(),
    '/forgotpass': (context) => ForgotPassword(),
    '/register': (context) => Register(),
    '/playhome': (context) => PlaygroundHome(),
  },
));
