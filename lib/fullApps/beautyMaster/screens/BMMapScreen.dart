import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/components/BMCardComponentTwo.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/models/BMCommonCardModel.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMDataGenerator.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class BMMapScreen extends StatelessWidget {
  List<BMCommonCardModel> recommendedList = getRecommendedList();

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(100)),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: bmPrimaryColor),
                          onPressed: () {
                            finish(context);
                          },
                        ),
                      ),
                      8.width,
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(100)),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: bmPrimaryColor),
                            8.width,
                            Text('New York', style: boldTextStyle()),
                            8.width,
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(100)),
                    child: bmCommonCachedNetworkImage('$BaseUrl/images/beauty_master/adjust.png', height: 26, color: bmPrimaryColor),
                  ),
                ],
              ).paddingOnly(left: 16, top: 30, right: 16),
              HorizontalList(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                spacing: 12,
                itemCount: recommendedList.length,
                itemBuilder: (context, index) {
                  return BMCardComponentTwo(element: recommendedList[index]);
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 110),
        child: FloatingActionButton(
          onPressed: () {
            //
          },
          mini: true,
          backgroundColor: context.cardColor,
          child: Icon(Icons.my_location, color: bmPrimaryColor),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(color: context.cardColor, borderRadius: radiusOnly(topRight: 32, topLeft: 32)),
        child: Text('Show 45+ Places', style: boldTextStyle(), textAlign: TextAlign.center),
      ),
    );
  }
}
