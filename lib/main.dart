// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

// ignore: undefined_prefixed_name
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temp/posts.dart';
import 'package:temp/social.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
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
  int n = 0;
  String iframe = 'https://editor.p5js.org/rohanpanuganti/embed/1uvMsrJlu';
  ScrollController _ctrl;
  List<String> _statements = [
    'my name is Rohan',
    'i am a software engineer',
    'welcome to my website',
    'this site contains all my projects and experiences',
    'i also make music!'
  ];
  Widget _iframeWidget;

  @override
  void initState() {
    _ctrl = new ScrollController();
    final IFrameElement _iframeElement = IFrameElement();
    _iframeElement.src = iframe;
    _iframeElement.style.border = 'none';

    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
    super.initState();
  }

  Widget projectCards(String image, String title, String info) {
    return Container(
      height: 250,
      width: 200,
      padding: EdgeInsets.all(13),
      child: Column(children: [
        Container(
            height: 85,
            child: Image(
              image: AssetImage(image),
            )),
        Container(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoMono(fontWeight: FontWeight.bold),
        ),
        Text(info, style: GoogleFonts.robotoMono(fontSize: 12))
      ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(width: 3, color: Colors.black),
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    _ctrl.addListener(() {
      setState(() {
        n = (n + 1) % 5000;
        if (n == 0) _count = (_count + 1) % _statements.length;
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
          controller: _ctrl,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavOption(
                    title: _statements[_count],
                    onTap: () {
                      setState(() {
                        _count = (_count + 1) % _statements.length;
                      });
                    },
                  ),
                ],
              ),
              Container(height: 50),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    setState(() {
                      _count = 4;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: width > height ? 420 : width * 0.95,
                          height: 420,
                          child: _iframeWidget),
                    ],
                  )),
              Text(
                '^^ Click Me! ^^',
                style: GoogleFonts.robotoMono(fontSize: 25),
              ),
              Container(height: 50),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text('Projects',
                      style: GoogleFonts.robotoMono(
                        fontSize: 30,
                      ))),
              Container(height: 25),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                direction: Axis.horizontal,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Post1();
                          })),
                      child: projectCards('images/awslogo.png', 'AWS Cumulus',
                          'An EC2 Profiling System built in NodeJS.')),
                  GestureDetector(
                      onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Post2();
                          })),
                      child: projectCards(
                          'images/emr.png',
                          'Seattle University File System',
                          'A file system built in NodeJS that utilizes a Hadoop Architechture.')),
                  GestureDetector(
                      onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Post3();
                          })),
                      child: projectCards('images/SU.png', 'HACK SU 2020',
                          'A `Orwellian` take on a chat application that was a runner up at Hack Seattle University.')),
                ],
              ),
              Container(height: 40),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text('vvv Check out my socials!',
                      style: GoogleFonts.robotoMono(
                        fontSize: 25,
                      ))),
              Container(height: 40),
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
