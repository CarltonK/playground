import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {

  void launchHomeScreen() {
    //Launch home screen after spinner
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Playground',
          style: GoogleFonts.muli(
            textStyle: TextStyle(
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            letterSpacing: .5),
        ),),
        actions: <Widget>[
          IconButton(
              tooltip: 'Home',
              icon: Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.white,
                  ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              }),
        ],
      ),
      backgroundColor: Colors.greenAccent[700],
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Center(
              child: SpinKitWave(
                color: Colors.white,
                size: 150.0,
                duration: Duration(seconds: 2),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'This app is designed and maintained by Mark Carlton\n'
                  'Email: \t  mcarlton33@gmail.com\n'
                  'Phone: \t 0727286123',
              style: GoogleFonts.muli(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5),
              ) ,),
          )
        ],
      ),
    );
  }
}
