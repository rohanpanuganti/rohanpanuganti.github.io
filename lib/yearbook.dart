import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Yearbook extends StatefulWidget {
  @override
  _YearbookState createState() => _YearbookState();
}

class _YearbookState extends State<Yearbook> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: height * .95,
        child: Scaffold(
          body: StreamBuilder<User>(
            stream: auth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data == null) {
                  return Container();
                } else {
                  return Container();
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AddQuote extends StatefulWidget {
  @override
  _AddQuoteState createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TheBook extends StatefulWidget {
  @override
  _TheBookState createState() => _TheBookState();
}

class _TheBookState extends State<TheBook> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
