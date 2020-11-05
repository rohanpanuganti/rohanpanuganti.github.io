import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(
        padding: EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        child: InkWell(
          hoverColor: Colors.black,
          onTap: () async {
            html.window.open(widget.url, 'new tab');
          },
          child: Container(
              height: 40,
              width: 40,
              child: Center(
                  child: FaIcon(
                widget.icon,
                size: 30,
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onHover: (h) {
        setState(() {
          this.hover = h;
        });
      },
      onTap: widget.onTap,
      hoverColor: Colors.black,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
          width: height > width ? width : null,
          height: height > width ? 100 : null,
          child: Center(
              child: Text(
            widget.title,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(
              color: this.hover ? Colors.white : Colors.black,
              fontSize: 25,
            ),
          ))),
    );
  }
}

class Link extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  Link({this.onTap, this.text});
  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link> {
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
      child: Container(
          margin: EdgeInsets.zero,
          child: Text(
            widget.text,
            style: GoogleFonts.robotoMono(
              color: this.hover ? Colors.white : Colors.black,
              fontSize: 20,
            ),
          )),
    );
  }
}
