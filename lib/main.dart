import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temp/social.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      title: "Rohan Panuganti",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;

  List<String> _statements = [
    'my name is Rohan',
    'i am a software engineer',
    'welcome to my website!',
    'i will compile all my projects and experiences here',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0.0,
        title: Image.asset(
          "images/rp.png",
          height: 50,
          alignment: Alignment.topLeft,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/profile.png'),
                    radius: 100,
                  )
                ],
              ),
              Container(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _count = (_count + 1) % _statements.length;
                        });
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Center(
                              child: Text(_statements[_count],
                                  style:
                                      GoogleFonts.robotoMono(fontSize: 30))))),
                ],
              ),
              Container(height: 500)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: Row(
          children: [
            SocialIcon(
                icon: FontAwesomeIcons.github,
                url: "https://github.com/rohanpanuganti/"),
            SocialIcon(
                icon: FontAwesomeIcons.linkedin,
                url: "https://www.linkedin.com/in/rohanpanuganti/"),
            SocialIcon(
                icon: FontAwesomeIcons.filePdf,
                url: "https://rohanpanuganti.com/Resume-New/"),
          ],
        ),
      ),
    );
  }
}
