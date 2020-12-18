import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rainbow_color/rainbow_color.dart';
import 'package:rohanp/project.dart';

import 'package:rohanp/yearbook.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseFirestore.instance.enablePersistence();
  Firebase.initializeApp().then((value) => runApp(MyApp()));
}

String id;

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    id = window.location.search;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      color: Color.fromRGBO(246, 238, 227, 1),
      theme: ThemeData(
          accentColor: Color.fromRGBO(225, 33, 32, 1),
          backgroundColor: Color.fromRGBO(249, 247, 241, 1),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Color.fromRGBO(225, 33, 32, 1),
            cursorColor: Colors.white,
            selectionHandleColor: Colors.white,
          )),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: width < height
            ? Column(
                children: [MainBody(), Projects()],
              )
            : Row(children: [MainBody(), Projects()]));
  }
}

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> drawerKey = new GlobalKey<ScaffoldState>();
  Animation<double> animation;
  AnimationController controller;

  final Rainbow _rb = Rainbow(spectrum: const [
    Color.fromRGBO(126, 167, 242, 1),
    Color.fromRGBO(242, 126, 126, 1),
    Color.fromRGBO(67, 129, 229, 1),
    Color.fromRGBO(106, 241, 241, 1),
    Color.fromRGBO(241, 125, 179, 1),
    Color.fromRGBO(84, 180, 232, 1),
    Color.fromRGBO(188, 255, 166, 1),
    Color.fromRGBO(250, 153, 114, 1),
    Color.fromRGBO(204, 138, 242, 1),
    Color.fromRGBO(126, 167, 242, 1),
  ], rangeStart: 0.0, rangeEnd: 300.0);

  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);

    animation = Tween<double>(begin: _rb.rangeStart, end: _rb.rangeEnd)
        .animate(controller)
          ..addListener(() {
            setState(() {
              // The state that has changed here is the animation object’s value.
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reset();
              controller.forward();
            } else if (status == AnimationStatus.dismissed) {
              controller.forward();
            }
          });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        width: width < height ? width : width * .7 - 1,
        height: width < height ? height * .7 : height,
        decoration: BoxDecoration(
          border: width < height
              ? Border(
                  bottom: BorderSide(
                      color: Theme.of(context).accentColor, width: 2))
              : Border(
                  right: BorderSide(
                      color: Theme.of(context).accentColor, width: 3),
                ),
        ),
        child: Scaffold(
          key: drawerKey,
          drawer: Container(
              width: width < height ? width : width * .6,
              decoration: BoxDecoration(
                border: width < height
                    ? Border(
                        right: BorderSide(
                            color: Theme.of(context).accentColor, width: 2))
                    : Border(
                        top: BorderSide(
                            color: Theme.of(context).accentColor, width: 3),
                      ),
              ),
              child: Drawer(
                elevation: 0,
                child: Scaffold(
                  backgroundColor: Theme.of(context).backgroundColor,
                  appBar: AppBar(
                    leadingWidth: 0,
                    backgroundColor: Colors.transparent,
                    leading: Container(),
                    centerTitle: false,
                    title: RichText(
                      text: TextSpan(
                        text: '>roh',
                        style: GoogleFonts.robotoMono(
                            fontSize: 25, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: '@',
                              style: GoogleFonts.robotoMono(
                                  fontSize: 26, color: _rb[animation.value])),
                          TextSpan(
                              text: 'n',
                              style: GoogleFonts.robotoMono(
                                  fontSize: 25, color: Colors.black))
                        ],
                      ),
                    ),
                    elevation: 0,
                  ),
                  body: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: width < height
                                    ? width * .5
                                    : width * .6 * .6,
                                child: Text(
                                  'Hi, my name is Rohan Panuganti, I am a software engineer who recently graduated from Seattle University. I like building Flutter apps and NodeJS apps. I also make music occasionally. Check out my socials!',
                                  style: GoogleFonts.ptMono(
                                      fontSize: 16, color: Colors.black),
                                )),
                            Spacer(),
                            CircleAvatar(
                                backgroundColor: Theme.of(context).accentColor,
                                radius: width < height
                                    ? ((width / 2) * .41)
                                    : ((width / 2) * .6 * .31),
                                child: CircleAvatar(
                                  radius: width < height
                                      ? ((width / 2) * .4)
                                      : ((width / 2) * .6 * .3),
                                  backgroundImage:
                                      AssetImage('images/profile.png'),
                                  backgroundColor:
                                      Theme.of(context).accentColor,
                                ))
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            SocialIcon(
                                icon: LineAwesomeIcons.linkedin,
                                color: Color.fromRGBO(14, 18, 168, 1),
                                url:
                                    "https://www.linkedin.com/in/rohanpanuganti/"),
                            SocialIcon(
                              icon: LineAwesomeIcons.github,
                              color: Color.fromRGBO(125, 187, 230, 1),
                              url: "https://github.com/rohanpanuganti",
                            ),
                            SocialIcon(
                                icon: LineAwesomeIcons.soundcloud,
                                color: Color.fromRGBO(255, 119, 0, 1),
                                url: "https://soundcloud.com/rohanxo")
                          ],
                        )
                      ],
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.miniEndTop,
                  floatingActionButton: FloatingActionButton(
                    mini: true,
                    elevation: 0,
                    onPressed: () => Navigator.pop(context),
                    child: GestureDetector(
                        child: Icon(
                      LineAwesomeIcons.times,
                      size: 28,
                    )),
                  ),
                ),
              )),
          extendBodyBehindAppBar: true,
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            toolbarHeight: kToolbarHeight + 10,
            centerTitle: false,
            title: Image.asset(
              "images/rp.png",
              height: 50,
            ),
            leading: Text(''),
            leadingWidth: 0.0,
            actions: [
              HoverText(
                text: "whoami",
                onTap: () => drawerKey.currentState.openDrawer(),
              ),
              Text('    '),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 50),
                Spacer(),
                /*
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HoverText(
                      text: ">sign my yearbook<",
                      onTap: () {
                        showModalBottomSheet<dynamic>(
                            isScrollControlled: true,
                            enableDrag: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Yearbook();
                            });
                      },
                    )
                  ],
                ),*/
                Spacer(),
                RichText(
                  text: TextSpan(
                    text: 'currently working ',
                    style:
                        GoogleFonts.ptMono(fontSize: 22, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: '@ ',
                          style: GoogleFonts.ptMono(
                              fontSize: 24, color: _rb[animation.value])),
                      TextSpan(
                          text: 'aws',
                          style: GoogleFonts.ptMono(
                              fontSize: 24,
                              color: Color.fromRGBO(255, 153, 0, 1))),
                    ],
                  ),
                ),
                Container(height: 20)
              ],
            ),
          ),
        ));
  }
}

class HoverText extends StatefulWidget {
  final String text;
  final Function onTap;
  HoverText({this.text, this.onTap});
  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onHover: (h) {
          setState(() {
            this.hover = h;
          });
        },
        onTap: widget.onTap,
        child: Center(
          child: Text(widget.text,
              textAlign: TextAlign.center,
              style: !hover
                  ? GoogleFonts.robotoMono(fontSize: 24, color: Colors.black)
                  : GoogleFonts.robotoMono(
                      fontSize: 25, color: Theme.of(context).accentColor)),
        ));
  }
}

class SocialIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String url;
  SocialIcon({this.icon, this.color, this.url});
  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onHover: (h) {
          setState(() {
            this.hover = h;
          });
        },
        onTap: () async => await launch(widget.url),
        child: Icon(
          widget.icon,
          color: hover ? widget.color : Colors.black,
          size: 70,
        ));
  }
}
