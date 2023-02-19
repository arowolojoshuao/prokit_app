import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/OrderModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Constants.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/DataProvider.dart';

class ProfileComponent extends StatefulWidget {
  @override
  ProfileComponentState createState() => ProfileComponentState();
}

class ProfileComponentState extends State<ProfileComponent> {
  List<OrderModel> orderList = getOrderList();

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
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: white,
        title: Text('User Profile', style: boldTextStyle(color: primaryColor, size: 20)),
      ),
      body: Container(
        height: context.height(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: secondaryColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HoverWidget(
                builder: (context, isHover) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationRoundedWithShadow(cardRadius.toInt(), backgroundColor: isHover ? primaryColor : white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/profile.jpg',
                          fit: BoxFit.cover,
                          height: 60,
                          width: 60,
                        ).cornerRadiusWithClipRRect(4),
                        8.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('John Smith', style: boldTextStyle(color: isHover ? white : primaryColor)),
                            Text('Head of Sales', style: primaryTextStyle(size: 14, color: isHover ? white : primaryColor)),
                            Text('johnsmith@crml.com', style: primaryTextStyle(size: 12, color: isHover ? white : primaryColor)),
                          ],
                        ).expand(),
                        Container(
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: radius(5),
                            backgroundColor: isHover ? white : primaryColor,
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: isHover ? primaryColor : white,
                          ).onTap(
                            () {
                              toasty(context, 'View More');
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              16.height,
              HoverWidget(
                builder: (context, isHover) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationRoundedWithShadow(
                      cardRadius.toInt(),
                      backgroundColor: isHover ? primaryColor : white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Award', style: boldTextStyle(size: 18, color: isHover ? white : primaryColor)),
                        8.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 45,
                              width: 50,
                              padding: EdgeInsets.all(4),
                              decoration: boxDecorationWithRoundedCorners(
                                borderRadius: radius(cardRadius),
                                backgroundColor: isHover ? white : secondaryColor,
                              ),
                              child: Icon(Ionicons.star_outline),
                            ),
                            8.width,
                            Text('Star Seller', style: primaryTextStyle(color: isHover ? white : primaryColor)).expand(),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
