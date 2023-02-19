import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBBookRideScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

// ignore: must_be_immutable
class JCBChooseDestinationScreen extends StatelessWidget {
  String? destination;

  JCBChooseDestinationScreen({this.destination});

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    log('destination : $destination');

    return Scaffold(
      appBar: AppBar(
        leading: jcbBackWidget(context),
        centerTitle: true,
        title: Text(destination != null ? destination.validate() : 'Choose Your destination', style: boldTextStyle()),
        actions: [
          Image.asset(
            'images/juberCarBooking/jcbIcons/ic_search.png',
            height: 24,
            width: 24,
            fit: BoxFit.cover,
            color: jcbSecBorderColor,
          ).paddingAll(16),
        ],
      ),
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
                  'Choose a Destination',
                  style: boldTextStyle(size: 26, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900),
                ),
                16.height,
                Text('Please select a valid destination location on the map', style: secondaryTextStyle(color: context.iconColor)),
                16.height,
                AppButton(
                  width: context.width() - 32,
                  child: Text('Set destination'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
                  onTap: () {
                    JCBBookRideScreen().launch(context);
                  },
                  color: jcbPrimaryColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
                  elevation: 0,
                ),
                16.height,
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 210,
            child: Container(
              decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                borderRadius: radius(8),
              ),
              child: IconButton(
                icon: Image.asset('images/juberCarBooking/jcbIcons/ic_navigation.png', height: 20, width: 20, fit: BoxFit.cover),
                onPressed: () {
                  JCBBookRideScreen().launch(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
