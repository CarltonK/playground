import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final focus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  void _handleSubmittedFirstName(String fname) {
    print('First Name: ' + fname);
    FocusScope.of(context).nextFocus();
  }

  void _handleSubmittedLastName(String lname) {
    print('Last Name: ' + lname);
    FocusScope.of(context).nextFocus();
  }

  void _handleSubmittedEmail(String email) {
    print('Email: ' + email);
    FocusScope.of(context).nextFocus();
  }

  void _handleSubmittedPassword(String password) {
    print('Password: ' + password);
    FocusScope.of(context).unfocus();
  }

  final _emailForm = GlobalKey<FormState>();
  final _lnameForm = GlobalKey<FormState>();
  final _fnameForm = GlobalKey<FormState>();
  final _passwordForm = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  Widget _firstNamewidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('First Name',
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
            key: _fnameForm,
            child: TextFormField(
                style: GoogleFonts.muli(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                validator: (fname) {
                  if (fname.isEmpty) {
                    return 'First Name is required';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: _handleSubmittedFirstName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontWeight: FontWeight.w600, letterSpacing: .3),
                    fillColor: Colors.green[400],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    labelText: 'What is your first name ? ',
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

  Widget _lastNamewidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Last Name',
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
            key: _lnameForm,
            child: TextFormField(
                style: GoogleFonts.muli(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                validator: (lname) {
                  if (lname.isEmpty) {
                    return 'Last Name is required';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: _handleSubmittedLastName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontWeight: FontWeight.w600, letterSpacing: .3),
                    fillColor: Colors.green[400],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    labelText: 'What is your last name ?',
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

  Widget _passwordwidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Password',
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
            key: _passwordForm,
            child: TextFormField(
                style: GoogleFonts.muli(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                validator: (password) {
                  if (password.isEmpty) {
                    return 'Password is required';
                  }
                  if (password.length < 8) {
                    return 'Password should be more than 8 characters';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                onFieldSubmitted: _handleSubmittedPassword,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontWeight: FontWeight.w600, letterSpacing: .3),
                    focusColor: Colors.white,
                    fillColor: Colors.green[400],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    labelText: 'Enter your password here',
                    labelStyle: GoogleFonts.muli(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    icon: Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                    ))),
          ),
          SizedBox(
            height: 10.0,
          )
        ]);
  }

  Widget _emailWidget() {
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
                textInputAction: TextInputAction.next,
                onFieldSubmitted: _handleSubmittedEmail,
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

  void _SignInButtonPressed() {
    String signup = 'We are rerouting you to sign in';
    print(signup);
    Navigator.pushReplacementNamed(context, '/login');
  }

  Widget _buildSignInBtn() {
    return GestureDetector(
      onTap: _SignInButtonPressed,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Already have an Account? ',
                style: GoogleFonts.muli(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: .2,
                  ),
                )),
            TextSpan(
              text: 'Sign In',
              style: GoogleFonts.muli(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: .2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpWithText() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(
          '- OR -',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              letterSpacing: .2),
        ),
      ],
    );
  }

  void _termsPrivacy() {
    String terms = 'We want to read terms';
    print(terms);
  }

  Widget _termsandCond() {
    return Column(
      children: <Widget>[
        Text(
          '*By signing up, you are agreeing to our',
          style: GoogleFonts.muli(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: .2,
            ),
          ),
        ),
        SizedBox(
          height: 3.0,
        ),
        GestureDetector(
          onTap: _termsPrivacy,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Terms & Conditions',
                    style: GoogleFonts.muli(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: .2,
                      ),
                    )),
                TextSpan(text: ' and ', style: TextStyle(fontSize: 11)),
                TextSpan(
                  text: 'Privacy Policy',
                  style: GoogleFonts.muli(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      letterSpacing: .2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _RegisterBtnPressed() {
    print('We will register you now');
    if (_fnameForm.currentState.validate() &&
        _lnameForm.currentState.validate() &&
        _emailForm.currentState.validate() &&
        _passwordForm.currentState.validate()) {
      Navigator.pushNamed(context, '/login');
    }
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _RegisterBtnPressed,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text('REGISTER',
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
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 100.0,
                  ),
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sign Up',
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
                      _firstNamewidget(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _lastNamewidget(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _emailWidget(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _passwordwidget(),
                      _buildRegisterBtn(),
                      _buildSignUpWithText(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildSignInBtn(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _termsandCond()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
