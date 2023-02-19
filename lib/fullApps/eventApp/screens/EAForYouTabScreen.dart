import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';
import 'package:prokit_flutter/main.dart';

import 'EAEventDetailScreen.dart';

class EAForYouTabScreen extends StatefulWidget {
  @override
  EAForYouTabScreenState createState() => EAForYouTabScreenState();
}

class EAForYouTabScreenState extends State<EAForYouTabScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: boxDecorationRoundedWithShadow(
                8,
                backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesome.street_view, color: primaryColor1),
                  Text(
                    "See All Event Around You - 10km",
                    style: primaryTextStyle(color: primaryColor1, size: 18),
                    textAlign: TextAlign.center,
                  ).expand(),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 40),
              physics: NeverScrollableScrollPhysics(),
              itemCount: forYouList.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Stack(
                      //overflow: Overflow.visible,
                      alignment: Alignment.bottomCenter,
                      children: [
                        commonCachedNetworkImage(forYouList[i].image!, height: 230, width: context.width(), fit: BoxFit.cover),
                        Positioned(
                            right: 16,
                            top: 16,
                            child: Icon(
                              forYouList[i].fev! ? Icons.favorite : Icons.favorite_border,
                              color: forYouList[i].fev! ? redColor : white,
                              size: 22,
                            ).onTap(() {
                              forYouList[i].fev = !forYouList[i].fev!;
                              setState(() {});
                            })),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: primaryColor1,
                            borderRadius: radius(0),
                          ),
                          child: forYouList[i].time == null
                              ? SizedBox()
                              : Row(
                                  children: [
                                    Icon(MaterialCommunityIcons.timer_sand, color: white),
                                    10.width,
                                    Text(forYouList[i].time.toString(), style: primaryTextStyle(color: white)),
                                  ],
                                ),
                        ).visible(forYouList[i].time != null),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(forYouList[i].hashtag!, style: secondaryTextStyle()),
                            Text('\$' + forYouList[i].price.toString(), style: boldTextStyle(color: primaryColor1)),
                          ],
                        ),
                        4.height,
                        Text(forYouList[i].name!, style: boldTextStyle()),
                        4.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBarWidget(
                              onRatingChanged: (rating) {},
                              rating: forYouList[i].rating!,
                              allowHalfRating: true,
                              itemCount: 5,
                              size: 16,
                              disable: true,
                              activeColor: primaryColor1,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border_outlined,
                            ),
                            8.width,
                            Text('1.3k', style: secondaryTextStyle()),
                          ],
                        ),
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
                    ).paddingAll(16)
                  ],
                ).onTap(
                  () {
                    EAEventDetailScreen(
                      name: forYouList[i].name!,
                      hashTag: forYouList[i].hashtag!,
                      attending: forYouList[i].attending!,
                      price: forYouList[i].price,
                      image: forYouList[i].image!,
                    ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
