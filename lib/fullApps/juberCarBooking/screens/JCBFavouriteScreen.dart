import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBDestinationWidget.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBSearchDestinationModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBUpdateFavouriteScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

// ignore: must_be_immutable
class JCBFavouriteScreen extends StatefulWidget {
  @override
  State<JCBFavouriteScreen> createState() => _JCBFavouriteScreenState();
}

class _JCBFavouriteScreenState extends State<JCBFavouriteScreen> {
  List<JCBSearchDestinationModel> favList = jcbFavList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: jcbBackWidget(context),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: jcbPrimaryColor, size: 30),
              Text('Add', style: boldTextStyle(color: jcbPrimaryColor)),
            ],
          ).paddingRight(16).onTap(() {
            JCBUpdateFavouriteScreen().launch(context).then((value) {
              if (value != null) {
                favList.add(value);
                setState(() {});
              }
            });
          }, splashColor: Colors.transparent, highlightColor: Colors.transparent)
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Favourites',
              style: boldTextStyle(size: 40, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900),
            ).paddingAll(16),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
                    top: BorderSide(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor)),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Image.asset(
                            'images/juberCarBooking/jcbIcons/ic_home.png',
                            color: jcbGreyColor,
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {}),
                      16.width,
                      Text('Home', style: primaryTextStyle())
                    ],
                  ),
                  Divider(indent: 60, thickness: 1, color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
                  Row(
                    children: [
                      IconButton(
                          icon: Image.asset(
                            'images/juberCarBooking/jcbIcons/ic_suitcase.png',
                            color: jcbGreyColor,
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {}),
                      16.width,
                      Text('Work', style: primaryTextStyle())
                    ],
                  ),
                ],
              ),
            ),
            16.height,
            Text('OTHER PLACES', style: boldTextStyle(color: jcbSecBorderColor)).paddingSymmetric(horizontal: 16),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: favList.length,
              itemBuilder: (context, index) {
                return JCBDestinationWidget(destination: favList[index]).onTap(() {
                  JCBUpdateFavouriteScreen(destination: favList[index]).launch(context).then((value) {
                    if (value != null) {
                      favList.remove(favList[index]);
                      favList.add(value);
                      setState(() {});
                    }
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
