import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:google_fonts/google_fonts.dart';
import 'package:temp/social.dart';

Widget title(String text) {
  return Text(text, style: GoogleFonts.robotoMono(color: Colors.black));
}

Widget header(String text) {
  return Text(
    text,
    style: GoogleFonts.robotoMono(fontSize: 25),
  );
}

Widget paragraph(String text) {
  return Container(
      child: Text(
    text,
    style: GoogleFonts.robotoMono(fontSize: 20),
  ));
}

class Post1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: title('AWS Cumulus (EC2 Profiling System)'),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: header('What is this?')),
            Container(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: height > width ? width - 30 : width * .85,
                child: paragraph(
                    'For my senior capstone project at Seattle University, I was given the great opportunity of working with Amazon Web Services. My team built a NodeJS application that benchmarked EC2 instances.'),
              )
            ]),
            Container(height: 40),
            Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: header('Why is it needed?')),
            Container(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: height > width ? width - 30 : width * .85,
                child: paragraph(
                  "AWS is the world's largest cloud computing provider, and in order to have such a high approval rating, they need to make sure all their systems work well for their customers. EC2, or Elastic Cloud Computing, provides users with over a hundred different types of instances. Finding the best one may be a bit of a daunting task. Luckily AWS is working on a good recommendation system to help its customers. In order to help these hardworking engineers, we created AWS Cumulus. This product simply automates the configuring, running, and deploying of test applications across multiple instances. While the application runs, we track the metrics of each instances and store them. The data produced will aid in training machine learning models. ",
                ),
              )
            ]),
            Container(height: 40),
            Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: header('How does it work?')),
            Container(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: height > width ? width - 30 : width * .85,
                child: paragraph(
                  "AWS Cumulus takes an object oriented design while using multiple AWS products. We use three object types: ",
                ),
              )
            ]),
            Container(height: 35),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: height > width ? width - 30 : width * .85,
                child: paragraph(
                  '   > Instances - cloud computers provided by AWS as EC2. We are testing these.',
                ),
              )
            ]),
            Container(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: height > width ? width - 30 : width * .85,
                child: paragraph(
                  '   > Workloads - a user specified application that is designed to test EC2 instances, there are two types, workloads that run on instances and load-generators that generate traffic to instances ',
                ),
              )
            ]),
            Container(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: height > width ? width - 30 : width * .85,
                child: paragraph(
                  '   > Benchmark - refers to one run of the whole Cumulus system, that means running a workloads across multiple instances all while its metrics are tracked.',
                ),
              )
            ]),
            Container(height: 35),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: height > width ? width - 30 : width * .85,
                child: paragraph(
                  'We use AWS Cloudwatch to track utilization data on instances. Cumulus configures CW and the instances using SSM, or Simple Storage Service. This allows us to securely send commands to instances and start/stop workloads. So after the workload stops running, the metrics we tracked are stored in S3, or Simple Storage Service. The data stored as a CSV and is easily accessible. It is also imporant to note that workloads can be stored in S3 for fluid deployment. The objects in this system are stored in DynamoDB. This means state and pass/fail criteria can easily be viewed and tracked by users. All of these products can securely work together thanks to AWS IAM. We have completed automated permissions using the IAM SDK.',
                ),
              )
            ]),
            Container(height: 40),
            Container(
              width: height > width ? width : width * .85,
              child: Image.asset('images/overview.png'),
            ),
            Container(height: 40),
            Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: header('Where is it now?')),
            Container(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: height > width ? width - 30 : width * .85,
                child: paragraph(
                  'AWS Cumulus is now in the hands of AWS Engineers. While this is a powerful tool, it is not practical for non-AWS developers simply because it is expensive to run large scale workloads. However, the future of Cumulus is bright as the cloud becomes an increasing dependency. The recommendation system will definitely need constant improvments. ',
                ),
              )
            ]),
            Container(height: 20),
            Container(
                width: height > width ? width - 30 : width * .85,
                child: Link(
                    text: 'https://aws.amazon.com/compute-optimizer/',
                    onTap: () async {
                      html.window.open(
                          'https://aws.amazon.com/compute-optimizer/',
                          'new tab');
                    })),
            Container(height: 40)
          ],
        ),
      )),
    );
  }
}

class Post2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: title('Seattle University File System'),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: height > width ? width - 30 : width * .85,
                  child: Link(
                      text: 'https://github.com/rpanu/SUFS',
                      onTap: () async {
                        html.window
                            .open('https://github.com/rpanu/SUFS', 'new tab');
                      })),
              Container(height: 40),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: header('What is this?')),
              Container(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    width: height > width ? width - 30 : width * .85,
                    child: paragraph(
                      'The Seattle University File System is a distributed file system that is built with NodeJS and is hosted on AWS.',
                    )),
              ]),
              Container(height: 40),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: header('How does it work?')),
              Container(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    width: height > width ? width - 30 : width * .85,
                    child: paragraph(
                      'The client pulls a file from S3 and breaks it down into blocks. Each block is assigned a blockID and has three copies stored across multiple DataNodes. The list of blockIDs that correspond to a single file, is stored in the NameNode. At any point the user can request a specific file and it can be pulled from the DataNodes, block by block, where it will be reassembled in the client. ',
                    )),
              ]),
              Container(height: 40),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: header('What if something goes wrong?')),
              Container(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    width: height > width ? width - 30 : width * .85,
                    child: paragraph(
                      "Since SUFS is akin to a Hadoop Distributed File System, it also has a similar fault-tolerance system. To ensure that none of the DataNodes have failed, each DataNode sends the NameNode a blockReport which contains information about the blocks it contains. The NameNode has a timer in place that resets every time a blockReport is received. If a DataNode fails, that timer runs out and the NameNode is aware of exactly which node has failed. Since there are multiple block copies distributed across the DataNodes, the NameNode uses the failed node's last blockReport to replicate all the blocks that were lost.",
                    )),
              ]),
              Container(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class Post3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: title('Seattle University File System'),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                width: height > width ? width - 30 : width * .85,
                child: Link(
                    text: 'https://github.com/rohanpanuganti/REDACTED',
                    onTap: () async {
                      html.window.open(
                          'https://github.com/rohanpanuganti/REDACTED',
                          'new tab');
                    })),
            Container(height: 40),
            Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: header('What is this?')),
            Container(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: height > width ? width - 30 : width * .85,
                  child: paragraph(
                    'REDACTED was a finalist for HackSU 2020. It was developed in NodeJS and used SocketIO.',
                  )),
            ]),
            Container(height: 40),
            Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: header('What does it do?')),
            Container(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: height > width ? width - 30 : width * .85,
                  child: paragraph(
                    "The theme of the hackathon was 'Technology in Society', so we decided to create a technology that said a lot about society. REDACTED is a single room chat application that allows its users to censor certain words, for everyone. When the chat first starts up, it has no redacted words, SO the users can types whatever they want. If a user deems a word offensive, they can type  ",
                  )),
            ]),
            Container(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: height > width ? width - 30 : width * .85,
                  child: paragraph(
                    '   > REDACT [insert word]',
                  )),
            ]),
            Container(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: height > width ? width - 30 : width * .85,
                  child: paragraph(
                    'After that, if a user tries to use that word, it will be redacted when it pop up in the chat. This forces users to find new ways of communicating without certain words.',
                  )),
            ]),
            Container(height: 40),
            Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: header('What does it look like?')),
            Container(height: 20),
            Container(
              width: height > width ? width : width * .85,
              child: Image.network(
                  'https://github.com/rpanu/REDACTED/blob/master/images/redacted.PNG?raw=true'),
            ),
            Container(height: 40),
          ]),
        ),
      ),
    );
  }
}
