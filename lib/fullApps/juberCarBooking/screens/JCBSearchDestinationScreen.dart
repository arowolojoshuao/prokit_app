import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBDestinationWidget.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBSearchDestinationModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBChooseDestinationScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBFavouriteScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

// ignore: must_be_immutable
class JCBSearchDestinationScreen extends StatefulWidget {
  @override
  State<JCBSearchDestinationScreen> createState() => _JCBSearchDestinationScreenState();
}

class _JCBSearchDestinationScreenState extends State<JCBSearchDestinationScreen> {
  List<JCBSearchDestinationModel> destinationList = jcbDestinationsList();

  TextEditingController destination = TextEditingController();
  List<String> addedDestinations = [];

  bool showAdd = false;

  Widget getDesWidget() {
    if (addedDestinations.isEmpty) {
      return Offstage();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: addedDestinations.map((e) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(e, style: boldTextStyle()),
                  Icon(Icons.cancel, color: jcbSecBorderColor, size: 20).onTap(() {
                    addedDestinations.remove(e);
                    setState(() {});
                  }),
                ],
              ),
              Divider(color: jcbSecBorderColor),
            ],
          );
        }).toList(),
      );
    }
  }

  Widget getDottedLine() {
    if (addedDestinations.isEmpty) {
      return Offstage();
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: addedDestinations.map((e) {
          return Column(
            children: [
              Icon(Icons.square, color: jcbPrimaryColor, size: 16),
              jcbDottedLineComponent(height: 22),
            ],
          );
        }).toList(),
      );
    }
  }

  @override
  void dispose() {
    addedDestinations.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'images/juberCarBooking/jcbIcons/ic_close.png',
            height: 20,
            width: 20,
            fit: BoxFit.cover,
            color: context.iconColor,
          ),
          onPressed: () {
            finish(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              JCBChooseDestinationScreen().launch(context);
            },
            icon: Icon(Icons.map_outlined, color: context.iconColor, size: 26),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                borderRadius: radiusOnly(bottomLeft: jcbBottomSheetRadius, bottomRight: jcbBottomSheetRadius),
                boxShadow: [
                  BoxShadow(
                    color: appStore.isDarkModeOn ? context.cardColor : Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.circle, color: context.iconColor, size: 14),
                      jcbDottedLineComponent(height: 22),
                      getDottedLine(),
                      Icon(Icons.square, color: jcbPrimaryColor, size: 16),
                    ],
                  ),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('199 Brown Estate Apt.866', style: boldTextStyle()),
                      Divider(color: jcbSecBorderColor),
                      getDesWidget(),
                      AppTextField(
                        controller: destination,
                        textFieldType: TextFieldType.NAME,
                        textStyle: boldTextStyle(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Destination',
                          hintStyle: boldTextStyle(color: jcbGreyColor),
                          contentPadding: EdgeInsets.all(0),
                          isDense: true,
                          suffixIcon: Icon(Icons.add, color: context.iconColor, size: 24).onTap(() {
                            if (destination.text != '') {
                              addedDestinations.add(destination.text);
                            } else {
                              toast('Please Enter Destination');
                            }
                            setState(() {});
                            destination.clear();
                          }),
                          suffixIconConstraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                        ),
                        onChanged: (val) {
                          showAdd = true;
                          setState(() {});
                        },
                      ),
                    ],
                  ).expand(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor)),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: radius(100),
                          color: jcbGreyColor.withOpacity(0.2),
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            'images/juberCarBooking/jcbIcons/ic_home.png',
                            color: jcbGreyColor,
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      16.width,
                      Text('Home', style: primaryTextStyle())
                    ],
                  ),
                  Divider(indent: 60, thickness: 1),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: radius(100),
                          color: jcbGreyColor.withOpacity(0.2),
                        ),
                        child: IconButton(
                            icon: Image.asset(
                              'images/juberCarBooking/jcbIcons/ic_suitcase.png',
                              color: jcbGreyColor,
                              height: 22,
                              width: 22,
                            ),
                            onPressed: () {
                              JCBFavouriteScreen().launch(context);
                            }),
                      ),
                      16.width,
                      Text('Work', style: primaryTextStyle())
                    ],
                  ),
                ],
              ),
            ).onTap(() {
              JCBFavouriteScreen().launch(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
            Divider(thickness: 10, height: 10, color: appStore.isDarkModeOn ? context.cardColor : jcbBackGroundColor),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: destinationList.length,
              itemBuilder: (context, index) {
                return JCBDestinationWidget(destination: destinationList[index]).onTap(
                  () {
                    JCBChooseDestinationScreen(destination: destinationList[index].name).launch(context);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
