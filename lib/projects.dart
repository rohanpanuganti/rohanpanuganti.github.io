import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:temp/social.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget contentBox(int i) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          body: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
                  padding: height > width
                      ? EdgeInsets.only(left: 45, right: 45, bottom: 45)
                      : EdgeInsets.only(left: 180, right: 180, bottom: 45),
                  child: FutureBuilder(
                      future: rootBundle.loadString("posts/$i.md"),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return MarkdownBody(
                            selectable: true,
                            data: snapshot.data,
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Color.fromARGB(255, 223, 40, 28),
                          ),
                        );
                      }))));
    }

    return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
            padding: EdgeInsets.all(45),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: width > height
                            ? EdgeInsets.only(left: 45, bottom: 45)
                            : EdgeInsets.only(bottom: 10),
                        child: ProjectSelect(
                          title: "> AWS Capstone Project",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => contentBox(3)),
                            );
                          },
                        )),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: width > height
                            ? EdgeInsets.only(left: 45, bottom: 45)
                            : EdgeInsets.only(bottom: 10),
                        child: ProjectSelect(
                          title: "> SeattleU File System",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => contentBox(2)),
                            );
                          },
                        )),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: width > height
                            ? EdgeInsets.only(left: 45, bottom: 45)
                            : EdgeInsets.only(bottom: 10),
                        child: ProjectSelect(
                          title: "> HackSU 2020",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => contentBox(1)),
                            );
                          },
                        )),
                  ],
                ),
              ],
            )));
  }
}
