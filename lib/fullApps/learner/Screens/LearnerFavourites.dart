import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerFavourites extends StatefulWidget {
  @override
  _LearnerFavouritesState createState() => _LearnerFavouritesState();
}

class _LearnerFavouritesState extends State<LearnerFavourites> {
  late List<LearnerFeaturedModel> mListings1;

  @override
  void initState() {
    super.initState();
    mListings1 = learnerGetFavourites();
  }

  @override
  Widget build(BuildContext context) {
    final topView = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(learner_lbl_favourites, style: boldTextStyle(color: learner_textColorPrimary)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(learner_ic_fab_back, width: 40, height: 40),
              Icon(Icons.search, color: learner_colorPrimary),
            ],
          ),
        ),
      ],
    );

    final cardList = ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: mListings1.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: boxDecoration(showShadow: true, bgColor: context.cardColor, radius: 10.0),
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                child: CachedNetworkImage(
                  placeholder: (_, s) => placeholderWidget(),
                  imageUrl: mListings1[index].img,
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(mListings1[index].name, style: boldTextStyle(color: learner_textColorPrimary)),
                          4.height,
                          Text(mListings1[index].type, style: primaryTextStyle(color: learner_textColorPrimary)),
                        ],
                      ).expand(),
                      Icon(Icons.favorite, color: Colors.red, size: 30),
                    ],
                  ),
                  Divider(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("20", style: boldTextStyle(color: learner_textColorPrimary)),
                          4.height,
                          Text("Students", style: secondaryTextStyle(color: learner_textColorSecondary)),
                        ],
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("51", style: boldTextStyle(color: learner_textColorPrimary)),
                            4.height,
                            Text("Lectures", style: secondaryTextStyle(color: learner_textColorSecondary)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(mListings1[index].price, style: boldTextStyle(color: white)),
                      )
                    ],
                  )
                ],
              ).expand(),
            ],
          ).paddingAll(16),
        );
      },
    );

    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              width: context.width(),
              height: 50,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: learner_colorPrimary),
                onPressed: () {
                  finish(context);
                },
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  topView,
                  cardList,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
