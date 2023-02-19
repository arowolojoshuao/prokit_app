import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/commons/data_provider.dart';
import 'package:prokit_flutter/fullApps/carea/commons/images.dart';
import 'package:prokit_flutter/fullApps/carea/components/filter_component.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';
import 'package:prokit_flutter/fullApps/carea/screens/details_screen.dart';
import 'package:prokit_flutter/fullApps/carea/store/logicprovider.dart';
import 'package:prokit_flutter/fullApps/carea/store/search_delagete_ob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

import '../commons/colors.dart';

class CustomSearchDelegate extends SearchDelegate {
  LogicProvider logi = LogicProvider();
  List searchlist = [];

  SearchDelegateOb ob = SearchDelegateOb();
  SearchDelegateOb ob1 = SearchDelegateOb();
  SearchDelegateOb ob2 = SearchDelegateOb();
  SearchDelegateOb ob3 = SearchDelegateOb();

  List<CallingModel> carBrandData = carBrandList();

  String textFromUser = "";

  CustomSearchDelegate.initialize(this.textFromUser) {
    query = textFromUser;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return [
      IconButton(
        icon: Icon(Icons.settings, color: context.iconColor),
        onPressed: () {
          query = '';
          showModalBottomSheet(
            enableDrag: true,
            isDismissible: true,
            isScrollControlled: true,
            constraints: BoxConstraints(maxHeight: height * 0.88, maxWidth: width, minHeight: height * 0.6, minWidth: width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
            ),
            context: context,
            builder: (context) {
              return FilterComponent();
            },
          );
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search, color: context.iconColor, size: 20),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (query != " " && !query.contains(" ")) {
      logi.searclist.add(query);
    }

    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /* ListTile(
            title: Text('Result for "$query"', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
            trailing: Text("0 found", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
          ),*/
          SizedBox(height: width * 0.15),
          Image(height: width * 0.65, width: width * 0.65, fit: BoxFit.fitHeight, image: AssetImage(wrongkeyword)),
          Text('Not Found', style: TextStyle(color: primaryBlackColor, fontSize: 26, fontWeight: FontWeight.bold)),
          SizedBox(height: width * 0.07),
          Text(
            textAlign: TextAlign.center,
            "Sorry, The Keyword you enter cannot be \nfond. please check again or search with \nanother keyword",
            style: TextStyle(fontSize: 14),
          )
        ],
      );
    }
    return SingleChildScrollView(
      child: Container(
        color: context.scaffoldBackgroundColor,
        padding: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 24),
        child: Column(
          children: [
            GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: ListOfCarImg.length,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.78),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8, right: 8, left: 8),
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn ? cardDarkColor : white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(image: ListOfCarImg[index]),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              width: width * 0.6,
                              decoration: BoxDecoration(
                                color: appStore.isDarkModeOn ? scaffoldDarkColor : primaryColor.shade300,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image(image: AssetImage(ListOfCarImg[index])),
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(alignment: Alignment.topLeft, child: Text(style: boldTextStyle(), "Sedan Series")).paddingOnly(left: 16),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star_half_rounded, color: appStore.isDarkModeOn ? white : black),
                              Text(listOfCarRating[index], style: TextStyle(color: appStore.isDarkModeOn ? white : black)),
                              VerticalDivider(color: Colors.red, width: 1),
                              SizedBox(width: 5),
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: appStore.isDarkModeOn ? black : primaryColor.shade300,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text("Used", style: primaryTextStyle(size: 12)),
                              )
                            ],
                          ).paddingOnly(left: 16),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(style: boldTextStyle(), listOfCarPrize[index]),
                          ).paddingOnly(left: 16),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // Creating For Result List Of Items
    List txt = carNames.where((element) => element.startsWith(query.toString())).toList();
    // Nothing Found Screen
    if (txt.isEmpty) {
      return SingleChildScrollView(
        child: Container(
          color: context.scaffoldBackgroundColor,
          child: Column(
            children: [
              ListTile(
                minVerticalPadding: 0,
                title: Text("Recent", style: primaryTextStyle()),
                trailing: GestureDetector(
                  onTap: () {
                    logi.searclist.removeWhere((element) => logi.searclist[0] != null);
                  },
                  child: Text('Clear all', style: primaryTextStyle()),
                ),
              ),
              Divider(height: 0.0),
              Observer(
                builder: (context) => ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  itemCount: logi.searclist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width,
                      margin: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.topLeft,
                      child: Observer(
                        builder: (context) => ListTile(
                          title: Text(style: primaryTextStyle(), "${logi.searclist[index]}"),
                          trailing: IconButton(
                            onPressed: () {
                              logi.removeElementToSearchList(index);
                            },
                            padding: EdgeInsets.all(4),
                            icon: Icon(Icons.cancel, size: 18),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
    // Resent Screen
    if (query.length < 2) {
      return SingleChildScrollView(
        child: Container(
          color: context.scaffoldBackgroundColor,
          height: context.height(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              /* ListTile(
                title: Text('Result for "$query"', style: boldTextStyle(size: 18)),
                trailing: Text("0 found", style: boldTextStyle(size: 18)),
              ),*/
              SizedBox(height: width * 0.15),
              Image(height: width * 0.65, width: width * 0.65, fit: BoxFit.fitHeight, image: AssetImage(wrongkeyword)),
              Center(child: Text('Not Found', style: boldTextStyle(size: 22))),
              SizedBox(height: 16),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Sorry, The Keyword you enter cannot be \nfond. please check again or search with \nanother keyword",
                  style: secondaryTextStyle(),
                ),
              )
            ],
          ),
        ),
      );
    }
    // Result Screen
    return Container(
      color: context.scaffoldBackgroundColor,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
          txt.length,
          (index) => IntrinsicWidth(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen(image: ListOfCarImg[index])),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: primaryColor.shade300,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          Image(height: 130, width: 130, image: AssetImage(ListOfCarImg[index])),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(txt[index], style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.star_half_rounded),
                      SizedBox(width: 5),
                      Text("${listOfCarRating[index]} |"),
                      SizedBox(width: 15),
                      Text(
                        'New',
                        style: TextStyle(
                          fontSize: 10,
                          background: Paint()
                            ..strokeWidth = 16
                            ..color = primaryColor.shade300
                            ..strokeJoin = StrokeJoin.round
                            ..style = PaintingStyle.stroke
                            ..strokeCap = StrokeCap.round,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(listOfCarPrize[index]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
