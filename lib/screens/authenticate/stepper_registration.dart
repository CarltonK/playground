import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playground/services/auth.dart';

class StepperRegistration extends StatefulWidget {
  @override
  _StepperRegistrationState createState() => _StepperRegistrationState();
}

class _StepperRegistrationState extends State<StepperRegistration> {
  static String _email, _password;
  static String _fname, _lname;

  static final _emailForm = GlobalKey<FormState>();
  static final _passwordForm = GlobalKey<FormState>();
  static final _lnameForm = GlobalKey<FormState>();
  static final _fnameForm = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  static final focusPassword = FocusNode();
  static final focusEmail = FocusNode();

  int currentStep = 0;
  bool complete = false;


  next() {
    currentStep == 0
        ? _RegisterBtnPressed()
        : _NamesBtnPressed();

    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);

  }

  cancel() {
    if (currentStep > 0){
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  List<Step> steps = [
    Step(
        isActive: true,
        state: StepState.editing,
        title: Text('Let\'s get started',
            style: GoogleFonts.muli(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: .2,
              ),
            )),
        content: Column(
          children: <Widget>[
            _emailWidget(),
            SizedBox(
              height: 30.0,
            ),
            _passwordwidget(),
          ],
        )),
    Step(
        isActive: false,
        title: Text('Almost Done',
            style: GoogleFonts.muli(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: .2,
              ),
            )),
        content: Column(
          children: <Widget>[
            _firstNamewidget(),
            SizedBox(
              height: 30.0,
            ),
            _lastNamewidget(),
          ],
        ))
  ];

  static void _handleSubmittedFirstName(String fname) {
    _fname = fname;
    print('First Name: ' + _fname);
  }

  static void _handleSubmittedLastName(String lname) {
    _lname = lname;
    print('Last Name: ' + _lname);
  }

  static void _handleSubmittedEmail(String email) {
    _email = email;
    print('Email: ' + _email);
  }

  static void _handleSubmittedPassword(String password) {
    _password = password;
    print('Password: ' + _password);
  }

  static Widget _firstNamewidget() {
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
                onSaved: _handleSubmittedFirstName,
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
                      Icons.person,
                      color: Colors.white,
                    ))),
          ),
          SizedBox(
            height: 10.0,
          )
        ]);
  }

  static Widget _lastNamewidget() {
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
                onSaved: _handleSubmittedLastName,
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
                      Icons.person,
                      color: Colors.white,
                    ))),
          ),
          SizedBox(
            height: 10.0,
          )
        ]);
  }

  static Widget _emailWidget() {
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

  static Widget _passwordwidget() {
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
                onSaved: _handleSubmittedPassword,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    helperStyle: TextStyle(color: Colors.white, fontSize: 12),
                    helperText:
                        'A secure password is a mixture of atleast 8 characters',
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

  void _RegisterBtnPressed() async {
    print('Attempting registration');
    if (_emailForm.currentState.validate() &&
        _passwordForm.currentState.validate()) {

      _emailForm.currentState.save();
      _passwordForm.currentState.save();

      dynamic result =
          await _authService.createUserEmailPass(_email, _password);

      if (result == null) {
        print('error registering');
        setState(() {

        });
      } else {
        print('registered');
        print(result);
        //Navigator.pop(context);
        setState(() => goTo(1));
      }
    }
  }

  void _NamesBtnPressed() async {
    print('Attempting names registration');
    if (_fnameForm.currentState.validate() &&
        _lnameForm.currentState.validate()) {
      _fnameForm.currentState.save();
      _lnameForm.currentState.save();

      print('Alles gut');

      /*
      dynamic result =
      await _authService.createUserEmailPass(_email, _password);

      if (result == null) {
        print('error registering');
      } else {
        print('registered');
        print(result);
        //Navigator.pop(context);
        goTo(1);
      }
    }

       */
    }
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
                      vertical: 50.0,
                    ),
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        complete
                            ? AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15.0))),
                          backgroundColor: Colors.white,
                          title: Text(
                            'PROCEED',
                            style: GoogleFonts.muli(
                                textStyle: TextStyle(
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent[700],
                                  fontSize: 18,
                                )),
                          ),
                          actions: <Widget>[
                            new FlatButton(
                              child: Text(
                                'YES',
                                style: GoogleFonts.muli(
                                    textStyle: TextStyle(
                                      color: Colors.greenAccent[700],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (complete) {
                                    Navigator.pop(context);
                                  }
                                  else {
                                    currentStep = 0;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                            : Stepper(
                          steps: steps,
                          currentStep: currentStep,
                          onStepContinue: next,
                          onStepCancel: cancel,
                          onStepTapped: (step) => goTo(step),)
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
