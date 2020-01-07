import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playground/services/auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _email;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  void _handleSubmittedEmail(String email) {
    _email = email;
    print('Email: ' + _email);
  }

  final focus = FocusNode();

  final _emailForm = GlobalKey<FormState>();

  Widget _emailwidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Email',
              style: GoogleFonts.muli(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: .2,
                ),
              )),
          SizedBox(
            height: 10.0,
          ),
          Form(
            key: _emailForm,
            child: TextFormField(
                style: GoogleFonts.muli(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                validator: (email) {
                  if (email.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focus);
                },
                textInputAction: TextInputAction.done,
                onSaved: _handleSubmittedEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontWeight: FontWeight.w600, letterSpacing: .3),
                    fillColor: Colors.green[400],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    labelText: 'Please enter your email',
                    labelStyle: GoogleFonts.muli(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    icon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ))),
          ),
          SizedBox(
            height: 10.0,
          )
        ]);
  }

  void _ResetBtnPressed() {
    print("We are attempting to reset your password");
    if (_emailForm.currentState.validate()) {
      //Save the form to retrieve user input
      _emailForm.currentState.save();

      dynamic result = _authService.resetUserPass(_email);

      if (result == null) {
        print("Error");
      }
      if (result == true) {
        print('Please check your email for password reset instructions');
        Navigator.pop(context);
      } else {
        print(result);
      }
    }
  }

  Widget _buildResetBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _ResetBtnPressed,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text('RESET',
            style: GoogleFonts.muli(
              textStyle: TextStyle(
                color: Colors.green,
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                  child: Center(
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 100.0,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Reset Password',
                                style: GoogleFonts.muli(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    letterSpacing: .2,
                                  ),
                                )),
                            SizedBox(
                              height: 30.0,
                            ),
                            _emailwidget(),
                            //SizedBox(height: 30.0,),
                            _buildResetBtn()
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
