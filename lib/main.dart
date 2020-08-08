import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Monospace', backgroundColor: Colors.white),
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
  List<bool> hover = [false, false, false];

  Widget boop(IconData icon, int i, String url) {
    return Padding(
        padding: EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        child: InkWell(
          hoverColor: Colors.black,
          onTap: () async {
            html.window.open(url, 'new tab');
          },
          child: Container(
              height: 40,
              width: 40,
              child: Center(
                  child: FaIcon(
                icon,
                size: 35,
                color: hover[i] ? Colors.white : Colors.black,
              ))),
          onHover: (h) async {
            setState(() {
              hover[i] = h;
            });
          },
        ));
  }

  Widget text() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0.0,
        title: Image.asset(
          "images/rp.png",
          height: 50,
          alignment: Alignment.topLeft,
        ),
      ),
      body: null,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0.0,
        child: Row(
          children: [
            boop(FontAwesomeIcons.github, 0,
                "https://github.com/rohanpanuganti/"),
            boop(FontAwesomeIcons.linkedin, 1,
                "https://www.linkedin.com/in/rohanpanuganti/"),
            boop(FontAwesomeIcons.filePdf, 2,
                "https://nbviewer.jupyter.org/github/rohanpanuganti/Resume-New/blob/master/Resume.pdf"),
          ],
        ),
      ),
    );
  }
}
