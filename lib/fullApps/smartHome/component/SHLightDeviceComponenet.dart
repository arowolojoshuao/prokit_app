import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';

class SHLightDeviceComponent extends StatefulWidget {
  const SHLightDeviceComponent({Key? key}) : super(key: key);

  @override
  _SHLightDeviceComponentState createState() => _SHLightDeviceComponentState();
}

class _SHLightDeviceComponentState extends State<SHLightDeviceComponent> {
  double sliderValue = 75;
  List<Color> colorList = [
    Colors.white,
    Colors.yellow,
    Colors.lightBlue,
    Colors.lightBlueAccent,
    Colors.deepOrangeAccent,
  ];
  int selectedIndex = 0;

  Widget buildSideLabel(double value) => Text(
        value.round().toString(),
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );

  @override
  Widget build(BuildContext context) {
    final double min = 0;
    final double max = 100;
    return Container(
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.red[700],
          inactiveTrackColor: SHScaffoldDarkColor,
          trackShape: RectangularSliderTrackShape(),
          trackHeight: 100.0,
          thumbColor: SHContainerColor,
          thumbShape: SliderComponentShape.noOverlay,
          overlayShape: SliderComponentShape.noOverlay,
          overlayColor: Colors.red.withAlpha(32),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  AnimatedContainer(
                    duration: 500.milliseconds,
                    height: context.height() * 0.37,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(borderRadius: radius(16)),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Slider(
                        value: sliderValue,
                        activeColor: colorList[selectedIndex],
                        min: min,
                        max: max,
                        label: sliderValue.round().toString(),
                        onChanged: (value) => setState(() => sliderValue = value),
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 16,
                children: List.generate(
                  colorList.length,
                  (index) {
                    return Container(
                      height: 120,
                      width: 40,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorList[index],
                        border: Border.all(color: selectedIndex == index ? white : SHContainerColor),
                      ),
                    ).onTap(
                      () {
                        selectedIndex = index;
                        setState(() {});
                      },
                    );
                  },
                ),
              ),
              Text('Swipe Vertically to change the brightness.', style: secondaryTextStyle())
            ],
          ),
        ),
      ),
    );
  }
}
