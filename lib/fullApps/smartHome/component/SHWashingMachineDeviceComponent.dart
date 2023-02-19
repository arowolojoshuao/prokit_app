import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHDataProvider.dart';
import 'package:prokit_flutter/main.dart';

import 'SHBubbleCustomPaintWidget.dart';

class SHWashingMachineDeviceComponent extends StatefulWidget {
  const SHWashingMachineDeviceComponent({Key? key}) : super(key: key);

  @override
  _SHWashingMachineDeviceComponentState createState() => _SHWashingMachineDeviceComponentState();
}

class _SHWashingMachineDeviceComponentState extends State<SHWashingMachineDeviceComponent> {
  double width = 200;
  double height = 100;
  List<Circular> circulars = [];
  Timer? drawTimer;
  List deviceModeList = getWashingMachineDeviceList();
  int selectedIndex = 0;
  bool isStart = false;

  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setup();
    loop();
    //
  }

  setup() {
    for (var i = 0; i < 20; i++) {
      double r = random(10, 20).toDouble();
      double x = random(
        (0 + r).toInt(),
        (width - r).toInt(),
      ).toDouble();
      double y = -(10 + r);
      Color color = Color.fromARGB(
        255,
        random(0, 255),
        random(0, 255),
        random(0, 255),
      );
      circulars.add(Circular(x, y, r, color));
    }
  }

  draw() {
    for (var i = circulars.length - 1; i >= 0; i--) {
      Circular c = circulars[i];
      c.update();
      if (c.edge(height)) {
        circulars.remove(c);
      }
    }
  }

  noLoop() {
    drawTimer!.cancel();
  }

  loop() {
    drawTimer = Timer.periodic(
      Duration(milliseconds: 60),
      (_) {
        draw();
        setState(() {});
      },
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: context.height() * 0.25,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: SHScaffoldDarkColor),
                ),
                CustomPaint(
                  foregroundPainter: SHBubbleCustomPaintWidget(circulars),
                  size: Size.fromWidth(context.width() * 0.20),
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(),
                  ),
                ),
              ],
            ),
            16.height,
            Text(
              '20 m 32 s ',
              style: boldTextStyle(color: white, size: 32),
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppButton(
                  width: 130,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  onTap: () {
                    setup();
                    isStart = !isStart;
                    setState(() {});
                  },
                  color: isStart ? context.cardColor : SHScaffoldDarkColor,
                  child: Row(
                    children: [
                      Icon(Icons.pause, color: isStart ? Colors.blue : white),
                      Text('Pause', style: primaryTextStyle(color: isStart ? Colors.blue : white)),
                    ],
                  ),
                ),
                16.width,
                AppButton(
                  width: 130,
                  onTap: () {},
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: SHScaffoldDarkColor,
                  child: Row(
                    children: [
                      Icon(Icons.power_settings_new, color: Colors.red),
                      Text('Turn Off', style: primaryTextStyle(color: Colors.red)),
                    ],
                  ),
                )
              ],
            ),
            16.height,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(
                deviceModeList.length,
                (index) {
                  SHDeviceModel data = deviceModeList[index];
                  bool isMyIndex = selectedIndex == index;

                  return Container(
                    width: context.width() / 4 - 32,
                    height: 100,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: data.mIsCheck! ? context.cardColor : SHScaffoldDarkColor,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              data.deviceImg.validate(),
                              fit: BoxFit.cover,
                              height: 30,
                              width: 30,
                              color: data.mIsCheck!
                                  ? appStore.isDarkModeOn
                                      ? white
                                      : black
                                  : white,
                            ),
                          ),
                          8.height,
                          Text(
                            data.deviceTitle.validate(),
                            style: primaryTextStyle(color: grey),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ).onTap(
                    () {
                      data.mIsCheck = !data.mIsCheck!;
                      setState(() {});
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
