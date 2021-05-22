import 'package:flutter/material.dart';
import 'package:fungji/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Here you can set what ever background color you need.
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/background.jpg?alt=media&token=6614f0f8-6d3e-45a1-8e39-aa52eb8f29a8"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 10),
                child: Text('WELCOME TO FUNGJI',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ))),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 220, left: 60),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/logo.png",
                        width: 80,
                        height: 80,
                      ),
                      new Text(' fungji',
                          style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 45,
                            fontWeight: FontWeight.w500,
                          ))),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 180, bottom: 10),
                child: Text('Login with',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.kanit(
                      fontSize: 20,
                      color: Colors.grey[600],
                    ))),
            Divider(
              height: 30,
              thickness: 1.5,
              indent: 60,
              endIndent: 60,
              color: Colors.grey[450],
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  AuthMethods().signInWithGoogle(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 100),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/google-logo.png",
                        width: 60,
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/facebook-icon.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset(
                          "assets/images/twitter-icon.png",
                          width: 53,
                          height: 53,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
