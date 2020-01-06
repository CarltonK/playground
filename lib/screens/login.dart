import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Checkbox value
  bool _rememberMe = false;

  final focus = FocusNode();
  //String email;
  //String password;

  @override
  void initState() {
    super.initState();
  }

  void _handleSubmittedEmail(String email) {
    print('Email: ' + email);
    FocusScope.of(context).requestFocus(focus);
  }

  void _handleSubmittedPassword(String password) {
    print('Password: ' + password);
  }

  @override
  void dispose() {
    super.dispose();
  }

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

  final _passwordForm = GlobalKey<FormState>();

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
                focusNode: focus,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: _handleSubmittedPassword,
                validator: (password) {
                  if (password.isEmpty) {
                    return 'Password is required';
                  }
                  if (password.length < 8) {
                    return 'Password should be more than 8 characters';
                  }
                  return null;
                },
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontWeight: FontWeight.w600, letterSpacing: .3),
                    helperText:
                        'A secure password is a mixture of atleast 8 characters',
                    helperStyle: TextStyle(color: Colors.white, fontSize: 12),
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

  void _forgotPasswordBtn() {
    String forgot = "We want to reset our password";
    print(forgot);
    Navigator.pushNamed(context, '/forgotpass');
  }

  Widget _passwordForgotPass() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: _forgotPasswordBtn,
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: GoogleFonts.muli(
              textStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
          )),
        ),
      ),
    );
  }

  void _LoginBtnPressed() {
    String login = 'We want to login now';
    print(login);
    if (_emailForm.currentState.validate() &&
        _passwordForm.currentState.validate()) {
      Navigator.pushReplacementNamed(context, '/playhome');
    }
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _LoginBtnPressed,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text('LOGIN',
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

  void _ForgotBtnPressed() {
    String reset = "We have reset your password";
    print(reset);
    Navigator.pushNamed(context, '/forgotpass');
  }

  Widget _cupertinoactionResetPass() {
    return CupertinoActionSheet(
      actions: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          width: double.infinity,
          child: RaisedButton(
            elevation: 5.0,
            onPressed: _ForgotBtnPressed,
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
        )
      ],
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green[600],
              activeColor: Colors.white,
              onChanged: (value) {
                print(value);
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
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
    );
  }

  Widget _buildSignInWithText() {
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
          '*By logging in, you are agreeing to our',
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

  void _SignUpButtonPressed() {
    String signup = 'We want to register now';
    print(signup);
    Navigator.pushNamed(context, '/register');
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: _SignUpButtonPressed,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Don\'t have an Account? ',
                style: GoogleFonts.muli(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: .2,
                  ),
                )),
            TextSpan(
              text: 'Sign Up',
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
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 100.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sign In',
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
                      SizedBox(
                        height: 30.0,
                      ),
                      _passwordwidget(),
                      _passwordForgotPass(),
                      _buildLoginBtn(),
                      _buildRememberMeCheckbox(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildSignInWithText(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildSignupBtn(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _termsandCond()
                    ],
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
