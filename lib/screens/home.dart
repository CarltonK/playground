import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent[700],
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      tileMode: TileMode.mirror,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.greenAccent[700],
                      ],
                      stops: [0.5],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 100.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'WELCOME',
                                  style: GoogleFonts.muli(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0)),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'to your journal',
                                  style: GoogleFonts.muli(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0)),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Write down your thoughts and feelings about the day that has been.\n'
                                  'This is your personal space.\n'
                                  'Free your mind and express yourself.',
                                  style: GoogleFonts.muli(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          letterSpacing: 1.5)),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                                              letterSpacing: 1.5)),
                                    ),
                                    IconButton(
                                      icon: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.navigate_next,
                                          color: Colors.white,
                                          size: 35.0,
                                        ),
                                      ),
                                      onPressed: ()  {
                                        Navigator.pushNamed(context, '/login');
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
