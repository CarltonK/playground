import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaygroundHome extends StatefulWidget {

  @override
  _PlaygroundHomeState createState() => _PlaygroundHomeState();
}


class _PlaygroundHomeState extends State<PlaygroundHome> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Current Index is $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: PageView(
                    children: <Widget>[
                    ],
                  ),
                )
              ],
            ),
          ),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.greenAccent[700],
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, size: 22,),
            icon: Icon(CupertinoIcons.home, size: 28,),
            title: Text(
                'Home',
                style: GoogleFonts.muli(textStyle: TextStyle(
                  color: Colors.greenAccent[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: .1,
                 ),)),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.person_solid, size: 22,),
            icon: Icon(CupertinoIcons.person, size: 28,),
            title: Text(
                'Profile',
                style: GoogleFonts.muli(textStyle: TextStyle(
                  color: Colors.greenAccent[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: .1,
                ),)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          onPressed: () => print('FAB Pressed'),
          backgroundColor: Colors.white,
          child: Icon(Icons.add, color: Colors.greenAccent[700],size: 30,),)
    );
  }
}