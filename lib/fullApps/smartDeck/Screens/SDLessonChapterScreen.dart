import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;

class SDLessonsDetailsScreen extends StatefulWidget {
  @override
  _SDLessonsDetailsScreenState createState() => _SDLessonsDetailsScreenState();
}

class _SDLessonsDetailsScreenState extends State<SDLessonsDetailsScreen> {
  late var text;

  @override
  void initState() {
    super.initState();
    text = lipsum.createText(numParagraphs: 10, numSentences: 8);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
          //  leading: Container(),
          actionsIconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.details),
                  SizedBox(width: 15),
                  Icon(Icons.message),
                  SizedBox(width: 15),
                  Icon(Icons.more_vert),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Text(text, style: boldTextStyle(letterSpacing: 1, wordSpacing: 1, weight: FontWeight.normal), textAlign: TextAlign.justify),
          ),
        ),
        persistentFooterButtons: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            height: 100,
            width: MediaQuery.of(context).copyWith().size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Ch 4 - Igneous Rocks', style: boldTextStyle()),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text('25 of 32 pages', style: secondaryTextStyle()),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.arrow_back, color: sdPrimaryColor, size: 30),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: sdPrimaryColor, size: 30),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
