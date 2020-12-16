import 'package:auto_animated/auto_animated.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rohanp/card.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: Theme.of(context).backgroundColor,
      width: width < height ? width : width * .3 - 1,
      height: width < height ? height * .3 : height,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('order', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
          return LiveList(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: width < height ? Axis.horizontal : Axis.vertical,
            itemCount: snapshot.data.documents.length,
            showItemInterval: Duration(milliseconds: 250),
            showItemDuration: Duration(milliseconds: 350),
            itemBuilder: (context, index, Animation<double> animation) {
              var doc = snapshot.data.documents[index];
              return FadeTransition(
                opacity: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(animation),
                child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, -0.1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                        child: ProjectCard(
                          document: doc,
                        ))),
              );
            },
          );
        },
      ),
    );
  }
}
