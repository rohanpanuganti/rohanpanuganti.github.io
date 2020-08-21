import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcon extends StatefulWidget {
  final String url;
  final IconData icon;
  SocialIcon({Key key, @required this.icon, @required this.url});

  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        child: InkWell(
          hoverColor: Colors.black,
          splashColor: Color.fromARGB(255, 223, 40, 28),
          onTap: () async {
            html.window.open(widget.url, 'new tab');
          },
          child: Container(
              height: 40,
              width: 40,
              child: Center(
                  child: FaIcon(
                widget.icon,
                size: 35,
                color: this.hover ? Colors.white : Colors.black,
              ))),
          onHover: (h) async {
            setState(() {
              this.hover = h;
            });
          },
        ));
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                maxRadius: 100,
                backgroundImage: AssetImage('images/profile.png'),
              )
            ]),
            Container(
              padding: EdgeInsets.all(45),
              child: Text(
                "Hi! I am Rohan Panuganti and this is my website. Now that I have graduated, this website will act as a portfolio. Whether it be a simple application, a full-stack project, or even a musical composition, it will all by compiled here. I have provided my social media and resume at the bottom of the page.",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(left: 45, bottom: 45),
                child: Text(
                  "Feel free to contact me!",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class NavOption extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  NavOption({Key key, @required this.title, @required this.onTap});
  @override
  _NavOptionState createState() => _NavOptionState();
}

class _NavOptionState extends State<NavOption> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onHover: (h) {
          setState(() {
            this.hover = h;
          });
        },
        onTap: widget.onTap,
        hoverColor: Colors.black,
        splashColor: Color.fromARGB(255, 223, 40, 28),
        child: Container(
          margin: EdgeInsets.all(0),
          child: Center(
              child: Text(
            widget.title,
            style: TextStyle(
                color: this.hover ? Colors.white : Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w300),
          )),
        ));
  }
}

class ProjectSelect extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  ProjectSelect({Key key, @required this.title, @required this.onTap});
  @override
  _ProjectSelectState createState() => _ProjectSelectState();
}

class _ProjectSelectState extends State<ProjectSelect> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (h) {
        setState(() {
          this.hover = h;
        });
      },
      onTap: widget.onTap,
      hoverColor: Colors.black,
      splashColor: Color.fromARGB(255, 223, 40, 28),
      child: Center(
          child: AutoSizeText(
        widget.title,
        maxLines: 2,
        style: TextStyle(
          color: this.hover ? Colors.white : Colors.black,
          fontSize: 25,
        ),
      )),
    );
  }
}
