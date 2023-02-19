import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';

class SHFanDeviceComponent extends StatefulWidget {
  @override
  _SHFanDeviceComponentState createState() => _SHFanDeviceComponentState();
}

class _SHFanDeviceComponentState extends State<SHFanDeviceComponent> {
  String img = 'images/shHome/lowSpeedFan.png';

  // List<String> images= [];
  bool isLow = true;
  bool isMedium = false;
  bool isHigh = false;

  Color con = Colors.pink;

  Widget fanButton({String? text, Color? color, Color? textColor, bool? isSelected = false, Function? onTap}) {
    return AppButton(
      text: text,
      color: color,
      shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
      textStyle: primaryTextStyle(color: textColor),
      padding: EdgeInsets.all(12),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: SHContainerColor,
            height: 240,
            alignment: Alignment.center,
            width: context.width(),
            child: Image.asset(img, fit: BoxFit.cover),
          ).center(),
          16.height,
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  fanButton(
                      text: 'Low',
                      color: isLow ? context.cardColor : SHScaffoldDarkColor,
                      textColor: isLow ? null : white,
                      onTap: () {
                        setState(() {
                          isLow = true;
                          isMedium = false;
                          isHigh = false;
                          img = 'images/shHome/lowSpeedFan.png';
                        });
                      }),
                  8.width,
                  fanButton(
                      text: 'Medium',
                      color: isMedium ? context.cardColor : SHScaffoldDarkColor,
                      textColor: isMedium ? null : white,
                      onTap: () {
                        img = 'images/shHome/mediumSpeedFan.png';
                        isMedium = !isMedium;
                        isLow = false;
                        isHigh = false;

                        setState(() {});
                      }),
                  8.width,
                  fanButton(
                      text: 'High',
                      color: isHigh ? context.cardColor : SHScaffoldDarkColor,
                      textColor: isHigh ? null : white,
                      onTap: () {
                        setState(() {
                          isHigh = !isHigh;
                          isLow = false;
                          isMedium = false;
                          img = 'images/shHome/highSpeedFan.png';
                        });
                      })
                ],
              ),
              16.height,
              AppButton(
                width: context.width(),
                color: SHScaffoldDarkColor,
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.power_settings_new, color: Colors.red),
                    8.width,
                    Text("Turn Off", style: primaryTextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ).center(),
    );
  }
}
