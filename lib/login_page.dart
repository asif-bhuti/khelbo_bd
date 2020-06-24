import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;

  final formKey = GlobalKey<FormState>();

  void validateNsave() {
    final form = formKey.currentState;
    form.save();
    form.validate()
        ? print('Form is valid. email: $_email, password: $_password')
        : print('Form can\'t be invalid. email: $_email, password: $_password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          'WELCOME',
        ),
      )),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                //  labelText: 'User',
                  hintText: 'Username',
                ),
                validator: (value) =>
                    value.isEmpty ? 'Please Enter your Email' : null,
                onSaved: (value) => _email = value,
              ),
              
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  //labelText: 'Password',
                  hintText: 'Password',
                ),
                validator: (value) =>
                    value.isEmpty ? 'Please Enter your Email' : null,
                onSaved: (value) => _email = value,
                obscureText: true,
              ),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: RaisedButton(
                child: Text('Login',),
                onPressed: () {
                  Navigator.pushNamed(context, '/map');
                },
              )),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: RaisedButton(
                child: Text('Sign Up',
                    style: TextStyle(color: Colors.white)),
                color: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, '/map');
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
