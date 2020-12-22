import 'package:auto_animated/auto_animated.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
          return CarouselSlider.builder(
            itemCount: snapshot.data.documents.length,
            options: CarouselOptions(
                viewportFraction: width < height ? .6 : .3,
                scrollDirection:
                    width < height ? Axis.horizontal : Axis.vertical,
                height: width < height ? width * .37 : width * .3 * .6,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 900)),
            itemBuilder: (context, index) {
              var doc = snapshot.data.documents[index];
              return Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ProjectCard(
                    document: doc,
                  ));
            },
          );
        },
      ),
    );
  }
}
