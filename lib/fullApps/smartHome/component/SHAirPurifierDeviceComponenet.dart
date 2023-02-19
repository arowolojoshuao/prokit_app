import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/main/utils/dashed_circle.dart';

import 'SHPurifierCustomPaintWidget.dart';

class SHAirPurifierDeviceComponent extends StatefulWidget {
  // const ({Key? key}) : super(key: key);

  @override
  _SHAirPurifierDeviceComponentState createState() => _SHAirPurifierDeviceComponentState();
}

class _SHAirPurifierDeviceComponentState extends State<SHAirPurifierDeviceComponent> with SingleTickerProviderStateMixin {
  double percentValue = 0.0;
  double newPercentage = 0.0;
  AnimationController? _percentValueAnimationController;
  double? _height;
  double? _width;
  bool isModerate = true;
  bool isComfort = false;
  bool isDensity = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    setState(() {
      percentValue = 0.0;
    });
    _percentValueAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {
          percentValue = lerpDouble(percentValue, newPercentage, _percentValueAnimationController!.value)!;
        });
      });
  }

  Widget purifierButton({String? text, Color? color, Color? textColor, bool? isSelected = false, Function? onTap}) {
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
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            DashedCircle(
              color: grey,
              strokeWidth: 20.0,
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                ),
              ),
            ),
            Container(
              child: CustomPainterExampleWidgets.buildButtonAnimation(
                height: _height! / 2 - 50,
                width: _width! / 2,
                percentValue: percentValue,
                onPress: () {
                  //
                },
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            purifierButton(
                text: 'Moderate',
                color: isModerate ? context.cardColor : SHScaffoldDarkColor,
                textColor: isModerate ? null : white,
                onTap: () {
                  setState(
                    () {
                      isModerate = true;

                      isComfort = false;
                      isDensity = false;
                      percentValue = newPercentage;
                      newPercentage = 30;
                      if (newPercentage > 100.0) {
                        percentValue = 0.0;
                        newPercentage = 0.0;
                      }
                      _percentValueAnimationController!.forward(from: 0.0);
                    },
                  );
                }),
            8.width,
            purifierButton(
                text: 'Comfort',
                color: isComfort ? context.cardColor : SHScaffoldDarkColor,
                textColor: isComfort ? null : white,
                onTap: () {
                  setState(
                    () {
                      isModerate = false;
                      isComfort = !isComfort;
                      isDensity = false;
                      percentValue = newPercentage;
                      newPercentage = 50;
                      if (newPercentage > 100.0) {
                        percentValue = 0.0;
                        newPercentage = 0.0;
                      }
                      _percentValueAnimationController!.forward(from: 0.0);
                    },
                  );
                }),
            8.width,
            purifierButton(
                text: 'Density',
                color: isDensity ? context.cardColor : SHScaffoldDarkColor,
                textColor: isDensity ? null : white,
                onTap: () {
                  setState(
                    () {
                      isModerate = false;
                      isComfort = false;
                      isDensity = !isDensity;
                      percentValue = newPercentage;
                      newPercentage = 70;
                      if (newPercentage > 100.0) {
                        percentValue = 0.0;
                        newPercentage = 0.0;
                      }
                      _percentValueAnimationController!.forward(from: 0.0);
                    },
                  );
                })
          ],
        ),
        16.height,
        appButton()
      ],
    );
  }
}

class CustomPainterExampleWidgets {
  static Widget buildButtonAnimation({
    required double height,
    required double width,
    required double percentValue,
    required Function onPress,
  }) {
    return Container(
      height: height,
      width: width,
      child: CustomPaint(
        foregroundPainter: SHPurifierCustomPaintWidget(
          buttonBorderColor: Colors.grey[300],
          progressColor: Colors.blue,
          color: [Colors.blue, Colors.red],
          percentage: percentValue,
          width: 8.0,
        ),
        child: AppButton(
          color: SHScaffoldDarkColor,
          splashColor: SHScaffoldDarkColor,
          shapeBorder: CircleBorder(),
          onTap: onPress,
          child: Text(
            "${percentValue.toInt()}",
            style: boldTextStyle(size: 40, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ).paddingAll(8.0),
      ),
    );
  }
}
