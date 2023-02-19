import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHDataProvider.dart';

class SHSpeakerDeviceComponent extends StatefulWidget {
  @override
  _SHSpeakerDeviceComponentState createState() => _SHSpeakerDeviceComponentState();
}

class _SHSpeakerDeviceComponentState extends State<SHSpeakerDeviceComponent> {
  Color containerColor = Color(0xFF5A56E8);
  List<String> category = ['Extreme bass', 'Def', 'Center', 'Space', 'Focus' 'bass'];
  List<SHDeviceModel> speakerModeList = getSpeakerDeviceMode();
  String selectedCategory = 'Extreme bass';
  bool isSwitch = false;

  bool isPlaying = false;
  bool isPlay = false;
  double sliderValue = 0;

  Widget speakerDeviceModeSlider(BuildContext context, double min, double max, int index) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.red[700],
        inactiveTrackColor: SHScaffoldDarkColor,
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 30.0,
        thumbColor: SHContainerColor,
        overlayColor: Colors.red.withAlpha(32),
        thumbShape: SliderComponentShape.noThumb,
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Container(
        width: context.width() / 6 - 16,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: radius(8),
        ),
        child: RotatedBox(
          quarterTurns: 3,
          child: Slider(
            value: sliderValue,
            activeColor: salmon,
            min: min,
            max: max,
            label: sliderValue.round().toString(),
            onChanged: (value) {
              speakerModeList[index].sliderValue = value;

              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double min = 0;
    final double max = 100;

    return Container(
      padding: EdgeInsets.all(2),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: 1000.milliseconds,
                  width: context.width(),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [button1Color, button2Color],
                    ),
                  ),
                  child: Icon(
                    isPlay ? Icons.play_arrow_rounded : Icons.pause,
                    size: 40,
                    color: white,
                  ),
                ).onTap(() {
                  setState(() {
                    isPlay = !isPlay;
                  });
                })
              ],
            ),
            24.height,
            Row(
              children: [
                Text(
                  'Predefined',
                  style: boldTextStyle(color: Colors.white, size: 18),
                ).expand(),
                Container(
                  width: 170,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: grey),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: SHScaffoldDarkColor,
                    value: selectedCategory,
                    style: secondaryTextStyle(color: Colors.grey),
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 28,
                      color: white,
                    ),
                    underline: 0.height,
                    onChanged: (dynamic newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    items: category.map(
                      (String category) {
                        return DropdownMenuItem(
                          child: Text(
                            category,
                            style: primaryTextStyle(color: white),
                          ).paddingLeft(8),
                          value: category,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
            8.height,
            Row(
              children: [
                Text(
                  'Manual',
                  style: boldTextStyle(size: 18, color: white),
                ).expand(),
                Switch(
                  value: isSwitch,
                  activeColor: SHSecondaryColor,
                  onChanged: (bool value) {
                    isSwitch = value;
                    setState(() {});
                  },
                ),
              ],
            ),
            16.height,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                width: context.width(),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '15db',
                          style: secondaryTextStyle(color: grey),
                        ),
                        DottedLine(
                          lineThickness: 8,
                          dashColor: Colors.grey,
                          direction: Axis.vertical,
                          dashGapLength: 8,
                          lineLength: 135,
                        ),
                        Text(
                          '-15db',
                          style: secondaryTextStyle(color: grey),
                        ),
                      ],
                    ).visible(isSwitch),
                    0.width,
                    Wrap(
                      spacing: 16,
                      children: List.generate(
                        speakerModeList.length,
                        (index) {
                          sliderValue = speakerModeList[index].sliderValue.validate();

                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                speakerDeviceModeSlider(context, min, max, index),
                                Text(
                                  speakerModeList[index].deviceTitle.validate(),
                                  style: primaryTextStyle(color: white),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ).visible(isSwitch),
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
