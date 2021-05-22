import 'package:flutter/material.dart';
import 'package:fungji/services/auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            AuthMethods().signInWithGoogle(context);
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.red,
            child: Center(
                child: Text(
              'login',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
