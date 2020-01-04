import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[700],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        elevation: 0.0,
        centerTitle: true,

      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0,0.0,0.0),
              child: Text(
                'WELCOME',
                style: GoogleFonts.muli(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0
                  )
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,0.0),
              child: Text(
                'to your journal',
                style: GoogleFonts.muli(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0
                    )
                ),),
            ),
            SizedBox(height: 50.0,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  'Write down your thoughts and feelings about the day that has been.\n'
                      'This is your personal space.\n'
                      'Free your mind and express yourself.',
                  style: GoogleFonts.muli(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          letterSpacing: 1.5
                      )
                  ),),
            ),
            SizedBox(height: 80.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Let\'s begin',
                      style: GoogleFonts.muli(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              letterSpacing: 1.5
                          )
                      ),),
                  IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 35.0,),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                      )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
