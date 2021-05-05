import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rainbow_color/rainbow_color.dart';
import 'dart:js' as js;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color> _colorAnim;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _colorAnim = RainbowColorTween([
      Colors.red,
      Colors.purple,
      Colors.indigo,
      Colors.purple,
      Colors.red
    ]).animate(controller)
      ..addListener(() {
        setState(() {});
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromRGBO(26, 26, 29, 1),
          body: Stack(
            children: [
              Container(
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsets.all(20),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Rohan Panuganti\n',
                            style: GoogleFonts.nunito(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(text: 'currently working @ '),
                              TextSpan(
                                  text: 'spyn',
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => js.context.callMethod(
                                        'open', ['https://spyn.ai/#/']),
                                  style: GoogleFonts.nunito(
                                      color: _colorAnim.value))
                            ])),
                  )),
            ],
          )),
    );
  }
}
