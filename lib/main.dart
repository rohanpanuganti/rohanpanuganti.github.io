import 'package:flutter/material.dart';
import 'package:temp/projects.dart';
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
  int nav = 0;
  Widget current() {
    switch (nav) {
      case 0:
        {
          return Profile();
        }
      case 1:
        {
          return Projects();
        }
    }
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
        actions: [
          Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20, right: 20),
              child: NavOption(
                title: "Projects",
                onTap: () {
                  setState(() {
                    nav = 1;
                  });
                },
              )),
          Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20, right: 20),
              child: NavOption(
                title: "Profile",
                onTap: () {
                  setState(() {
                    nav = 0;
                  });
                },
              )),
        ],
      ),
      body: current(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
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
                url:
                    "https://nbviewer.jupyter.org/github/rohanpanuganti/Resume-New/blob/master/Resume.pdf"),
          ],
        ),
      ),
    );
  }
}
