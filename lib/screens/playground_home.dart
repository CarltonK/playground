import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playground/services/auth.dart';

class PlaygroundHome extends StatefulWidget {
  @override
  _PlaygroundHomeState createState() => _PlaygroundHomeState();
}

class _PlaygroundHomeState extends State<PlaygroundHome> {
  int _selectedIndex = 0;
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  AuthService _authService = AuthService();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Current Index is $index');
    });
  }

  Widget _oldNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.greenAccent[700],
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.home,
            size: 22,
          ),
          icon: Icon(
            CupertinoIcons.home,
            size: 28,
          ),
          title: Text('Home',
              style: GoogleFonts.muli(
                textStyle: TextStyle(
                  color: Colors.greenAccent[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: .1,
                ),
              )),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            CupertinoIcons.person_solid,
            size: 22,
          ),
          icon: Icon(
            CupertinoIcons.person,
            size: 28,
          ),
          title: Text('Profile',
              style: GoogleFonts.muli(
                textStyle: TextStyle(
                  color: Colors.greenAccent[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: .1,
                ),
              )),
        ),
      ],
    );
  }

  void _LogOutUser() async {
    dynamic result = await _authService.logoutUser();
    print(result);
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  Future _buildLogOutDialog(BuildContext context) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: Colors.white,
          title: Text(
            'LOGOUT',
            style: GoogleFonts.muli(
                textStyle: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent[700],
              fontSize: 18,
            )),
          ),
          content: Text(
            'Are you sure ? ',
            style: GoogleFonts.muli(
                textStyle: TextStyle(
              color: Colors.greenAccent[700],
              fontSize: 18,
            )),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'NO',
                  style: GoogleFonts.muli(
                      textStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
                )),
            FlatButton(
                onPressed: _LogOutUser,
                child: Text(
                  'YES',
                  style: GoogleFonts.muli(
                      textStyle: TextStyle(
                    color: Colors.greenAccent[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
                ))
          ],
        );
      },
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic _map = ModalRoute.of(context).settings.arguments;
    String _userId = _map['UID'];

    return WillPopScope(
      child: Scaffold(
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
                    child: Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                _buildLogOutDialog(context);
                              },
                              child: Text('Logout'),
                            ),
                            Text('UID: $_userId')
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
            index: 1,
            animationCurve: Curves.bounceInOut,
            backgroundColor: Colors.greenAccent[700],
            height: 50,
            animationDuration: Duration(milliseconds: 200),
            items: <Widget>[
              Icon(
                Icons.home,
              ),
              Icon(
                Icons.add,
              ),
              Icon(
                Icons.person,
              ),
              Icon(
                Icons.settings,
              )
            ],
            onTap: (index) {
              setState(() {
                _page = index;
                print('Current page selected is : $_page');
              });
            }),
      ),
      onWillPop: _onWillPop,
    );
  }

  Future<bool> _onWillPop() {
    return _buildLogOutDialog(context) ?? false;
  }
}
