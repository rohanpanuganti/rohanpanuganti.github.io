import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProjectCard extends StatefulWidget {
  final document;
  ProjectCard({@required this.document});
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hover = false;
  String src = """<link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Roboto Mono', monospace;
    }
    ::selection {
      color: white;
      background: #e12120;
    }
    </style> 
  """;

  @override
  void initState() {
    http.read(widget.document['content']).then((value) {
      setState(() {
        src += value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (widget.document == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Material(
        child: InkWell(
      onTap: () {
        showModalBottomSheet<dynamic>(
            isScrollControlled: true,
            enableDrag: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: height * .94,
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Scaffold(
                    extendBodyBehindAppBar: true,
                    appBar: AppBar(
                      leading: Text("  "),
                      title: Text("  "),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      toolbarHeight: kToolbarHeight,
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerTop,
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
                    body: Container(
                        padding: width < height
                            ? EdgeInsets.fromLTRB(30, 30, 30, 0)
                            : EdgeInsets.fromLTRB(120, 30, 120, 0),
                        child: Center(
                          child: EasyWebView(
                            onLoaded: () {},
                            webAllowFullScreen: false,
                            convertToWidgets: false,
                            widgetsTextSelectable: true,
                            isMarkdown: true,
                            src: src,
                          ),
                        ))),
              );
            });
      },
      onHover: (h) {
        setState(() {
          this.hover = h;
        });
      },
      child: Container(
          height: width < height ? height * .3 * .7 : width * .3 * .7,
          width: width < height ? height * .3 * .9 : width * .3 * .9,
          color: Theme.of(context).backgroundColor,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Opacity(
                opacity: !hover ? 0.3 : 1,
                child: FractionallySizedBox(
                  heightFactor: .7,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10, right: 10),
                      child: Image.network(
                        widget.document['image'],
                        fit: BoxFit.contain,
                      )),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.document["title"],
                      style: !hover
                          ? GoogleFonts.robotoMono(
                              fontSize: 27, color: Colors.black)
                          : GoogleFonts.robotoMono(
                              fontSize: 27,
                              color: Color.fromRGBO(225, 33, 32, 1))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Text(widget.document["summary"],
                              overflow: TextOverflow.fade,
                              style: !hover
                                  ? GoogleFonts.ptMono(
                                      fontSize: 16, color: Colors.black)
                                  : GoogleFonts.ptMono(
                                      fontSize: 16,
                                      color: Color.fromRGBO(225, 33, 32, 1)))),
                    ],
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
