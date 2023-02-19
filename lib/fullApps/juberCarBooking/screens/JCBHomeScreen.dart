import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBDrawerComponent.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBSearchDestinationScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

final GlobalKey<ScaffoldState> jcbHomeKey = GlobalKey();

// ignore: must_be_immutable
class JCBHomeScreen extends StatelessWidget {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: jcbHomeKey,
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
          Container(
            decoration: BoxDecoration(color: context.scaffoldBackgroundColor, borderRadius: radiusOnly(topLeft: jcbBottomSheetRadius, topRight: jcbBottomSheetRadius)),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Where are you going?',
                  style: boldTextStyle(size: 26, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900),
                ),
                16.height,
                Text('Book on demand or pre-schedule rides', style: secondaryTextStyle(color: context.iconColor)),
                16.height,
                Container(
                  padding: EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    borderRadius: radius(jcbButtonRadius),
                    border: Border.all(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
                  ),
                  child: AppTextField(
                    autoFocus: false,
                    textFieldType: TextFieldType.NAME,
                    textStyle: boldTextStyle(),
                    onChanged: (val) {
                      hideKeyboard(context);
                      JCBSearchDestinationScreen().launch(context);
                    },
                    onTap: () {
                      hideKeyboard(context);
                      JCBSearchDestinationScreen().launch(context);
                    },
                    decoration: InputDecoration(
                      suffixIcon: Image.asset(
                        'images/juberCarBooking/jcbIcons/ic_search.png',
                        height: 14,
                        width: 14,
                        fit: BoxFit.cover,
                        color: jcbPrimaryColor,
                      ).paddingAll(12),
                      border: InputBorder.none,
                      hintText: 'Enter Destination',
                      hintStyle: boldTextStyle(color: jcbGreyColor),
                    ),
                  ),
                ),
                16.height,
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 200,
            child: Container(
              decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                borderRadius: radius(8),
              ),
              child: IconButton(
                icon: Image.asset('images/juberCarBooking/jcbIcons/ic_navigation.png', height: 20, width: 20, fit: BoxFit.cover),
                onPressed: () {
                  JCBSearchDestinationScreen().launch(context);
                },
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: context.statusBarHeight + 16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: radius(100),
                border: Border.all(color: context.scaffoldBackgroundColor, width: 2),
              ),
              child: jcbCommonCachedNetworkImage(
                '$BaseUrl/images/juberCarBooking/jcb_face2.jpg',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(100).onTap(() {
                jcbHomeKey.currentState!.openDrawer();
              }, borderRadius: radius(100)),
            ),
          )
        ],
      ),
    );
  }
}
