import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  int post = 0;

  List<String> posts = <String>[
    "Hackathon",
  ];

  Widget contentBox(int i) {
    return FutureBuilder(
        future: rootBundle.loadString("posts/$i.md"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return MarkdownBody(
              data: snapshot.data,
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 223, 40, 28),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
                padding: EdgeInsets.only(left: 45, right: 45, bottom: 45),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(child: null),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(
                                left: 45,
                                right: 45,
                              ),
                              child: contentBox(1)),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
