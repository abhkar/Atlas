import 'package:Atlas/shared/constants.dart';
import 'package:Atlas/shared/loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {

  final Function toggleView;
  RegisterPage({this.toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _fullNameEditingController = new TextEditingController();
  TextEditingController _emailEditingController = new TextEditingController();
  TextEditingController _passwordEditingController = new TextEditingController();
  TextEditingController _confirmPasswordEditingController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Loading() : Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("ATLAS", style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold)),
                    
                  SizedBox(height: 30.0),
                    
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    
                  SizedBox(height: 20.0),
                    
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _fullNameEditingController,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.person, color: Colors.white)
                    ),
                    validator: (val) => val.isEmpty ? 'This field cannot be blank' : null
                  ),
                    
                  SizedBox(height: 15.0),
                    
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _emailEditingController,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.alternate_email, color: Colors.white)
                    ),
                    validator: (val) {
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ? null : "Please enter a valid email";
                    },
                  ),
                    
                  SizedBox(height: 15.0),
                    
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _passwordEditingController,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.lock, color: Colors.white)
                    ),
                    validator: (val) => val.length < 6 ? 'Password not strong enough' : null,
                    obscureText: true,
                  ),

                  SizedBox(height: 15.0),
                    
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _confirmPasswordEditingController,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'Confirm password',
                      hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                    ),
                    validator: (val) => val == _passwordEditingController.text ? null : 'Does not macth the password',
                    obscureText: true,
                  ),

                  SizedBox(height: 20.0),
                    
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: RaisedButton(
                      elevation: 0.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      child: Text('Sign Up', style: TextStyle(color: Colors.blue, fontSize: 16.0)),
                      onPressed: () {
                        
                      }
                    ),
                  ),

                  SizedBox(height: 20.0),
                    
                  Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(color: Colors.black87),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            widget.toggleView();
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.0),
                    
                  Text(_error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}