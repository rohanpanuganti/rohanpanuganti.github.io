import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          body: Container(
              padding: height > width
                  ? EdgeInsets.all(45)
                  : EdgeInsets.only(left: 180, right: 180, top: 45, bottom: 45),
              child: FutureBuilder(
                  future: rootBundle.loadString("posts/$i.md"),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
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
                  })));
    }

    return SafeArea(
        child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
                padding: EdgeInsets.all(45),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: GestureDetector(
                                child: Text(
                                  "> AWS Capstone Project",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => contentBox(1)),
                                  );
                                },
                              )),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
