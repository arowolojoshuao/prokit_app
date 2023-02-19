import 'package:flutter/services.dart';
import 'package:prokit_flutter/fullApps/evSpot/models/filter_amenities_cb.dart';
import 'package:prokit_flutter/fullApps/evSpot/models/filter_connection_type.dart';
import 'package:prokit_flutter/fullApps/evSpot/models/filter_speed_cb.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/data_provider.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/home_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ApplyFilterScreen extends StatefulWidget {
  const ApplyFilterScreen({Key? key}) : super(key: key);

  @override
  State<ApplyFilterScreen> createState() => _ApplyFilterScreenState();
}

class _ApplyFilterScreenState extends State<ApplyFilterScreen> {
  bool? amenitiesCheck;

  int selectedConnectionItemIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: appStore.isDarkModeOn ? Colors.black : Colors.white),
        title: Text('Filters', style: boldTextStyle(size: 18)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                Fluttertoast.showToast(
                  msg: 'Changes applied successfully',
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_SHORT,
                  fontSize: 16,
                  backgroundColor: appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : Colors.black,
                );
              },
              child: Text('APPLY', style: boldTextStyle(color: ev_primary_color, size: 18)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Connection types', style: secondaryTextStyle(size: 18, color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor)),
                  SizedBox(height: 16),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: connectionItem.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      ConnectionType connectionData = connectionItem[index];
                      return GestureDetector(
                        onTap: () {
                          selectedConnectionItemIndex = index;
                          setState(() {});
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(DEFAULT_RADIUS)),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: selectedConnectionItemIndex == index
                                      ? ev_primary_color
                                      : appStore.isDarkModeOn
                                          ? Theme.of(context).colorScheme.surfaceVariant
                                          : filterConnColor,
                                ),
                                child: Text('${connectionData.connectionItemTitle}', style: boldTextStyle()),
                              ),
                              Positioned(
                                bottom: -10,
                                right: -30,
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(DEFAULT_RADIUS)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: selectedConnectionItemIndex == index
                                              ? ev_primary_color
                                              : appStore.isDarkModeOn
                                                  ? Colors.white
                                                  : Colors.black26,
                                          blurRadius: 30,
                                          blurStyle: BlurStyle.normal,
                                          offset: Offset(15, 15),
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(connectionTypeImg[index], height: 70, width: 100, fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  Text('Speeds', style: secondaryTextStyle(size: 18, color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor)),
                ],
              ),
            ),
            ListView.builder(
              itemCount: speedCB.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                SpeedCB speedsData = speedCB[index];
                return CheckboxListTile(
                  value: speedsData.isSpeedChecked,
                  title: Text('${speedsData.speedCBTitle}', style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : textPrimaryLightColor)),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.only(left: 8),
                  dense: true,
                  activeColor: ev_primary_color,
                  onChanged: (value) {
                    speedsData.isSpeedChecked = !speedsData.isSpeedChecked;
                    setState(() {});
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amenities', style: secondaryTextStyle(size: 18, color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor)),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 25,
                    children: List.generate(
                      icons.length,
                      (index) {
                        AmenitiesCB amenitiesData = amenitiesCB[index];
                        return GestureDetector(
                          onTap: () {
                            amenitiesData.isAmenitiesChecked = !amenitiesData.isAmenitiesChecked;
                            setState(() {});
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4 - 20,
                            padding: EdgeInsets.only(top: 10),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        icons[index],
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.contain,
                                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "${amenitiesData.amenitiesCBTitle}",
                                        style: secondaryTextStyle(color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor),
                                      ),
                                    ],
                                  ),
                                ),
                                if (amenitiesData.isAmenitiesChecked)
                                  Positioned(
                                    top: -30,
                                    right: -20,
                                    child: Checkbox(
                                      value: amenitiesData.isAmenitiesChecked,
                                      activeColor: ev_primary_color,
                                      onChanged: (value) {
                                        amenitiesCheck = value!;
                                        setState(() {});
                                      },
                                    ),
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
