import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAImages.dart';
import 'package:prokit_flutter/main.dart';

import 'EAReviewScreen.dart';
import 'EATicketDetailScreen.dart';

class EAEventDetailScreen extends StatefulWidget {
  final String? name;
  final String? hashTag;
  final String? attending;
  final String? price;
  final String? image;

  EAEventDetailScreen({this.name, this.hashTag, this.attending, this.price, this.image});

  @override
  _EAEventDetailScreenState createState() => _EAEventDetailScreenState();
}

class _EAEventDetailScreenState extends State<EAEventDetailScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  String des = "why this party is for you";
  String des1 = "Let's play silent game.but this time you have to dance under the star white hundreds... ";
  bool fev = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              title: Text(innerBoxIsScrolled ? widget.name! : ""),
              backgroundColor: primaryColor1,
              expandedHeight: 250.0,
              iconTheme: IconThemeData(color: white),
              automaticallyImplyLeading: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: pageController,
                      itemCount: 3,
                      itemBuilder: (context, i) {
                        return Image.network(widget.image!, fit: BoxFit.cover);
                      },
                      onPageChanged: (value) {
                        setState(() => currentIndexPage = value);
                      },
                    ),
                    DotIndicator(
                      pageController: pageController,
                      pages: walkThroughList,
                      indicatorColor: white,
                      unselectedIndicatorColor: grey,
                    ).paddingBottom(8),
                  ],
                ),
              ),
              actions: [
                Icon(AntDesign.sharealt, color: white).paddingRight(12),
                Icon(Icons.favorite_border, color: white).paddingRight(12),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.hashTag!, style: secondaryTextStyle()).paddingOnly(left: 12, top: 8, bottom: 8),
              Text(widget.name!, style: boldTextStyle()).paddingOnly(left: 12, bottom: 8),
              Row(
                children: [
                  Icon(Icons.timelapse_rounded, size: 20),
                  8.width,
                  Text("SUN MAR.25-4:30 PM EST", style: primaryTextStyle()),
                ],
              ).paddingOnly(left: 12, bottom: 8),
              Row(
                children: [
                  Icon(
                    Icons.local_activity_outlined,
                    size: 20,
                  ),
                  8.width,
                  Text(widget.attending!, style: primaryTextStyle()),
                ],
              ).paddingOnly(left: 12, bottom: 8),
              16.height,
              Container(
                color: grey.withOpacity(0.1),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Row(
                  children: [
                    Text('4.3', style: boldTextStyle(size: 30, color: primaryColor1)),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RatingBarWidget(
                              onRatingChanged: (rating) {},
                              rating: 4.3,
                              allowHalfRating: true,
                              itemCount: 5,
                              disable: true,
                              size: 16,
                              activeColor: primaryColor1,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border_outlined,
                            ),
                            8.width,
                            Text('1.3k', style: secondaryTextStyle()),
                          ],
                        ),
                        Text('241K Reviews', style: primaryTextStyle()),
                      ],
                    ).expand(),
                    Row(
                      children: [
                        Icon(Icons.edit, color: primaryColor1),
                        Text('Write Review', style: primaryTextStyle(color: primaryColor1)),
                      ],
                    ).onTap(() {
                      EAReviewScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                    })
                  ],
                ),
              ),
              16.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About'.toUpperCase(), style: boldTextStyle(color: grey)),
                  8.height,
                  Text(des, style: primaryTextStyle()),
                  Text(des1, style: primaryTextStyle()),
                  Row(
                    children: [
                      Text("Detail", style: primaryTextStyle(color: primaryColor1)),
                      4.width,
                      Icon(Icons.arrow_forward_ios_outlined, size: 14, color: primaryColor1),
                    ],
                  ),
                ],
              ).paddingOnly(left: 12, bottom: 8, top: 8),
              16.height,
              Text(
                'Endorsed by'.toUpperCase(),
                style: boldTextStyle(color: grey),
              ).paddingOnly(left: 12, bottom: 8, top: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg",
                    ),
                    backgroundColor: white,
                    maxRadius: 30,
                  ),
                  12.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Clarence Rodgers', style: boldTextStyle()),
                      Text('241 followers', style: secondaryTextStyle()),
                    ],
                  ).expand(),
                  IconButton(
                    onPressed: () {
                      fev = fev;
                      setState(() {});
                    },
                    icon: fev == true
                        ? Icon(Icons.person_remove,
                            color: fev
                                ? primaryColor1
                                : appStore.isDarkModeOn
                                    ? white
                                    : black)
                        : Icon(Icons.person_add_alt_1,
                            color: fev
                                ? primaryColor1
                                : appStore.isDarkModeOn
                                    ? white
                                    : black),
                  ),
                ],
              ).paddingOnly(left: 12, bottom: 16, top: 8, right: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Location'.toUpperCase(), style: boldTextStyle(color: grey)),
                  Row(
                    children: [
                      Text("How to get there", style: primaryTextStyle(color: primaryColor1)),
                      4.width,
                      Icon(Icons.arrow_forward_ios_outlined, size: 14, color: primaryColor1),
                    ],
                  ),
                ],
              ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Stage 48', style: boldTextStyle()),
                  8.height,
                  Text('605 W 48th street, Manhattan, 1008 ', style: secondaryTextStyle()),
                  8.height,
                  Text('3.5 near by', style: primaryTextStyle()),
                ],
              ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
              commonCachedNetworkImage(event_ic_map, fit: BoxFit.cover, height: 200, width: context.width()),
              Text(
                'Contact'.toUpperCase(),
                style: boldTextStyle(color: grey),
              ).paddingOnly(left: 12, bottom: 8, top: 8),
              createRichText(
                list: [
                  TextSpan(text: "Send us an email at", style: primaryTextStyle()),
                  TextSpan(text: " help@Event.com", style: primaryTextStyle(color: primaryColor1)),
                  TextSpan(text: " or call us at", style: primaryTextStyle()),
                  TextSpan(text: " +1 991-681-0200", style: primaryTextStyle(color: primaryColor1)),
                ],
              ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
              Text(
                'Similar Events'.toUpperCase(),
                style: boldTextStyle(color: grey),
              ).paddingOnly(left: 12, bottom: 8, top: 8),
              HorizontalList(
                padding: EdgeInsets.only(left: 12, bottom: 8, top: 8, right: 12),
                itemCount: forYouList.length,
                itemBuilder: (context, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        //overflow: Overflow.visible,
                        alignment: Alignment.bottomCenter,
                        children: [
                          commonCachedNetworkImage(
                            forYouList[i].image!,
                            height: 180,
                            width: context.width() * 0.7,
                            fit: BoxFit.cover,
                          ).cornerRadiusWithClipRRect(8),
                          Positioned(right: 16, top: 16, child: Icon(Icons.favorite_border, color: white, size: 22)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          8.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(forYouList[i].hashtag!, style: secondaryTextStyle()),
                              Row(
                                children: [
                                  RatingBarWidget(
                                    onRatingChanged: (rating) {},
                                    rating: forYouList[i].rating!,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    size: 16,
                                    activeColor: primaryColor1,
                                    filledIconData: Icons.star,
                                    halfFilledIconData: Icons.star_half,
                                    defaultIconData: Icons.star_border_outlined,
                                  ),
                                  8.width,
                                  Text('1.3k', style: secondaryTextStyle()),
                                ],
                              ),
                            ],
                          ),
                          4.height,
                          Text(forYouList[i].name!, style: boldTextStyle()),
                          6.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Entypo.location, size: 16),
                                  8.width,
                                  Text(forYouList[i].add!, style: secondaryTextStyle()),
                                ],
                              ),
                              Text(
                                forYouList[i].distance.toString() + 'km',
                                style: secondaryTextStyle(color: primaryColor1),
                              ),
                            ],
                          ),
                          6.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.local_activity_outlined, size: 16),
                              8.width,
                              Text(forYouList[i].attending!, style: secondaryTextStyle()),
                            ],
                          ),
                        ],
                      )
                    ],
                  ).paddingRight(8);
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        width: context.width(),
        height: 50,
        decoration: boxDecorationWithShadow(
          borderRadius: radius(24),
          gradient: LinearGradient(colors: [primaryColor1, primaryColor2]),
        ),
        child: widget.price == "Free"
            ? Text('Join it free'.toUpperCase(), style: boldTextStyle(color: white))
            : Text(
                'From \$20- get it'.toUpperCase(),
                style: boldTextStyle(color: white),
              ),
      ).onTap(
        () {
          EATicketDetailScreen().launch(context);
        },
      ),
    );
  }
}
