import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBAlertDialogComponent.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBCancelBookingComponent.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBDrawerComponent.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBFoundDriverComponent.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBRideTypeComponent.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBRideModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBSuggestedRidesScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

// ignore: must_be_immutable

final GlobalKey<ScaffoldState> jcbRideKey = GlobalKey();

class JCBBookRideScreen extends StatefulWidget {
  @override
  State<JCBBookRideScreen> createState() => _JCBBookRideScreenState();
}

class _JCBBookRideScreenState extends State<JCBBookRideScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<JCBRideModel> rideList = getRideTypes().sublist(0, 2);

  bool showLoader = false;
  bool showBottomSheet = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: jcbRideKey,
      drawer: JCBDrawerComponent(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          Positioned(
            top: context.statusBarHeight + 20,
            left: 16,
            right: 16,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(color: context.scaffoldBackgroundColor, borderRadius: radius(jcbButtonRadius)),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: boldTextStyle(),
                      children: [
                        TextSpan(text: 'Seattle '),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(Icons.arrow_forward, color: jcbGreyColor, size: 18),
                          ),
                        ),
                        TextSpan(text: ' Hemlock Ln'),
                      ],
                    ),
                  ),
                ).expand(),
                16.width,
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: context.scaffoldBackgroundColor, width: 2),
                    borderRadius: radius(100),
                  ),
                  child: jcbCommonCachedNetworkImage(
                    '$BaseUrl/images/juberCarBooking/jcb_face2.jpg',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(100).onTap(() {
                    jcbRideKey.currentState!.openDrawer();
                  }, borderRadius: radius(100)),
                )
              ],
            ),
          ),
          showLoader
              ? Container(
                  width: context.width(),
                  decoration: BoxDecoration(color: context.scaffoldBackgroundColor, borderRadius: radiusOnly(topLeft: jcbBottomSheetRadius, topRight: jcbBottomSheetRadius)),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/juberCarBooking/jcbGifs/jcb_loader.gif',
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'We are processing your booking...'.toUpperCase(),
                        style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor),
                      ),
                      8.height,
                      Text('Your ride will start soon', style: secondaryTextStyle(color: jcbGreyColor)),
                      20.height,
                    ],
                  ),
                )
              : Container(
                  height: 280,
                  width: context.width(),
                  decoration: BoxDecoration(
                    color: context.scaffoldBackgroundColor,
                    borderRadius: radiusOnly(topLeft: jcbBottomSheetRadius, topRight: jcbBottomSheetRadius),
                  ),
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'SUGGESTED RIDES',
                          style: boldTextStyle(
                            size: 20,
                            fontFamily: jcbFont,
                            color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor,
                            weight: FontWeight.w900,
                          ),
                        ),
                        8.height,
                        JCBRideComponent(rideList: rideList),
                        Divider(color: jcbSecBorderColor),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor),
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.monetization_on, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, size: 18),
                                  ),
                                  TextSpan(text: 'Cash payment'),
                                  WidgetSpan(
                                    child: Icon(Icons.arrow_forward_ios, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, size: 18),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Promo', style: secondaryTextStyle(color: context.iconColor)),
                                Container(
                                  height: 20,
                                  width: 1,
                                  color: jcbSecBorderColor,
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                ),
                                Icon(Icons.calendar_today_outlined, color: context.iconColor, size: 16),
                                Container(
                                  height: 20,
                                  width: 1,
                                  color: jcbSecBorderColor,
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                ),
                                Icon(Icons.edit, color: context.iconColor, size: 16)
                              ],
                            ),
                          ],
                        ),
                        16.height,
                      ],
                    ),
                  ),
                ),
          Positioned(
            right: 16,
            bottom: showLoader ? 200 : 300,
            child: Container(
              decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                borderRadius: radius(8),
              ),
              child: IconButton(
                icon: Image.asset('images/juberCarBooking/jcbIcons/ic_navigation.png', height: 20, width: 20, fit: BoxFit.cover),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: showLoader
          ? Dismissible(
              key: Key(''),
              child: Container(
                decoration: BoxDecoration(color: jcbGreyColor.withAlpha(80), borderRadius: radius(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.cancel, size: 40, color: Colors.white),
                    Text('Slide to cancel'.toUpperCase(), style: boldTextStyle(color: Colors.white, size: 18)),
                    16.width,
                  ],
                ),
              ),
              onDismissed: (_) {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    enableDrag: true,
                    isDismissible: false,
                    shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          JCBCancelBookingComponent(),
                          16.height,
                          AppButton(
                            width: context.width() - 32,
                            child: Text('Keep the booking'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
                            onTap: () {
                              finish(context);
                            },
                            color: jcbPrimaryColor,
                            shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
                            elevation: 0,
                          ),
                          8.height,
                          AppButton(
                            width: context.width() - 32,
                            child: Text('cancel ride'.toUpperCase(), style: boldTextStyle(color: jcbPrimaryColor)),
                            onTap: () {
                              showLoader = false;
                              showBottomSheet = false;
                              setState(() {});
                              finish(context);
                            },
                            color: context.scaffoldBackgroundColor,
                            shapeBorder: RoundedRectangleBorder(
                              borderRadius: radius(jcbButtonRadius),
                              side: BorderSide(color: jcbPrimaryColor),
                            ),
                            elevation: 0,
                          ),
                          16.height,
                        ],
                      );
                    });
              },
            ).paddingSymmetric(horizontal: 16, vertical: 16)
          : AppButton(
              child: Text('Book Now'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
              onTap: () {
                JCBSuggestedRidesScreen().launch(context).then((value) async {
                  showLoader = true;
                  setState(() {});

                  await Future.delayed(Duration(seconds: 5)).then((value) async {
                    showLoader = false;
                    setState(() {});

                    if (showBottomSheet) {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          enableDrag: true,
                          isDismissible: false,
                          shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
                          builder: (context) {
                            return JCBFoundDriverComponent();
                          });

                      await Future.delayed(Duration(seconds: 3)).then((value) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: JCBAlertDialogComponent(),
                            );
                          },
                        );
                      });
                    } else {
                      showBottomSheet = true;
                      setState(() {});
                    }
                  });
                });
              },
              color: jcbPrimaryColor,
              elevation: 0,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
            ).paddingOnly(left: 16, right: 16, bottom: 16),
    );
  }
}
