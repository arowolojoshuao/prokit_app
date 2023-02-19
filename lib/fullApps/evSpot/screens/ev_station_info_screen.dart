import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/evSpot/models/ev_station_places_model.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/add_check_in_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/home_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/constant.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class EVStationInfoScreen extends StatefulWidget {
  const EVStationInfoScreen({Key? key, this.modelObj}) : super(key: key);

  final EVStationPlacesModel? modelObj;

  @override
  State<EVStationInfoScreen> createState() => _EVStationInfoScreenState();
}

class _EVStationInfoScreenState extends State<EVStationInfoScreen> {
  final connectionTypeImg = [conn_type_img_first, conn_type_img_second, conn_type_img_first, conn_type_img_second];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: appStore.isDarkModeOn ? Colors.black : Colors.transparent,
        statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.modelObj!.image != null ? widget.modelObj!.image! : " ",
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(height: 120, color: Colors.grey);
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 16),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: appStore.isDarkModeOn ? Colors.black : Colors.white, blurRadius: 35, blurStyle: BlurStyle.normal, offset: Offset(0, 1), spreadRadius: 50),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.modelObj!.stTitle != null ? widget.modelObj!.stTitle : " "}', style: boldTextStyle(size: 22)),
                        SizedBox(height: 6),
                        Text(
                          '${widget.modelObj!.stAddress != null ? widget.modelObj!.stAddress : " "}',
                          style: secondaryTextStyle(color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Open', style: secondaryTextStyle(color: ev_primary_color)),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Icon(Icons.circle, size: 3, color: ev_primary_color),
                              ),
                            ),
                            Expanded(
                              flex: 15,
                              child: Text(
                                '08:00 am - 20:00 pm',
                                style: secondaryTextStyle(color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.modelObj!.wishList = !widget.modelObj!.wishList!;
                                setState(() {});
                              },
                              child: widget.modelObj!.wishList! ? Icon(Icons.favorite, color: Colors.red, size: 22) : Icon(Icons.favorite_outline, size: 22, color: ev_primary_color),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Connection Available', style: boldTextStyle()),
                            GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 1.2,
                              ),
                              padding: EdgeInsets.only(top: 20),
                              shrinkWrap: true,
                              itemCount: 4,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(DEFAULT_RADIUS)),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : filterConnColor,
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('J-1772', style: boldTextStyle()),
                                                Text(
                                                  '55 kw (\$0.05/kw)',
                                                  style: secondaryTextStyle(color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor),
                                                ),
                                              ],
                                            ),
                                            Text('2 points', style: primaryTextStyle()),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -10,
                                        right: -30,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: appStore.isDarkModeOn ? Colors.white : Colors.black26,
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
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 30),
                            Text('Amenities', style: boldTextStyle()),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 70,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: List.generate(widget.modelObj!.amenitiesIconList!.length, (index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          widget.modelObj!.amenitiesIconList![index],
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.contain,
                                          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          '${widget.modelObj!.amenitiesIconText![index]}',
                                          style: secondaryTextStyle(color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('Recent check-ins', style: boldTextStyle()),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 32),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                padding: EdgeInsets.only(top: 20),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(DEFAULT_RADIUS)),
                                            child: Image.asset(person_image, height: 50, width: 50, fit: BoxFit.cover),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Jay Rana', style: boldTextStyle()),
                                                SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Tesla Model',
                                                      style: secondaryTextStyle(color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor),
                                                    ),
                                                    Text(
                                                      '14 Jun',
                                                      style: secondaryTextStyle(color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                                      SizedBox(height: 15),
                                      Wrap(
                                        spacing: 16,
                                        children: List.generate(3, (index) {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(DEFAULT_RADIUS)),
                                            child: Image.asset(
                                              widget.modelObj!.image != null ? widget.modelObj!.image! : " ",
                                              height: 60,
                                              width: 60,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Container();
                                              },
                                            ),
                                          );
                                        }),
                                      ),
                                      Divider(thickness: 1, height: 32)
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: SafeArea(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: Container(decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)), height: 45, width: 45),
                    ),
                    Positioned(
                      left: -2,
                      top: -2,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 30,
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : backgroundColor),
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddCheckInScreen()));
                          },
                          icon: Icon(Icons.check_circle_rounded, color: ev_primary_color, size: 20),
                          label: Text('Add Check-in', style: boldTextStyle()),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(color: ev_primary_color),
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                          },
                          icon: Icon(Icons.navigation, color: Colors.white, size: 20),
                          label: Text('Get Direction', style: boldTextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
