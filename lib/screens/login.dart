import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  FocusScopeNode _focusScopeNode = FocusScopeNode();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  @override
  void initState() {
    _controllerEmail.addListener(() {
    });

    _controllerPassword.addListener(() {
    });
    super.initState();

  }

  void _handleSubmittedEmail(String email) {
    print('Email: '+ email);
    _focusScopeNode.nextFocus();
  }

  void _handleSubmittedPassword(String password) {
    print('Password: ' + password);
    _focusScopeNode.dispose();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[700],
      appBar: AppBar(
        title: Text(
          'Login',
          style: GoogleFonts.muli(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  letterSpacing: .1
              )
          ),),
        backgroundColor: Colors.greenAccent[700],
        elevation: 0.0,
      ),
      body: FocusScope(
        node: _focusScopeNode,
        child: Center(
          child: Container(
            height: 400,
            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Center(
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: Icon(
                          CupertinoIcons.book_solid,
                          color: Colors.white,
                          size: 100.0,
                      )),
                ),
                SizedBox(height: 5.0,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: _handleSubmittedEmail,
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                      ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                    ),
                    icon: Icon(Icons.email,color: Colors.white,)
                  ),
                ),
                SizedBox(height: 15.0,),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: _handleSubmittedPassword,
                  controller: _controllerPassword,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                      icon: Icon(Icons.vpn_key,color:Colors.white,)
                  ),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgotpass');
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Not a member ? REGISTER ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(onPressed: () {

                    },
                      color: Colors.greenAccent[700],
                      elevation: 5.0,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          letterSpacing: 2.0,
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),),),
                  ),
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}
