import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';

class SHAirConditionerDeviceComponent extends StatefulWidget {
  const SHAirConditionerDeviceComponent({Key? key}) : super(key: key);

  @override
  _SHAirConditionerDeviceComponentState createState() => _SHAirConditionerDeviceComponentState();
}

class _SHAirConditionerDeviceComponentState extends State<SHAirConditionerDeviceComponent> {
  List<String> deviceTemprature = ['16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30'];
  final FixedExtentScrollController _controller = FixedExtentScrollController();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isSelected = false;
  bool isacUnitIcon = false;
  bool isWindIcon = false;
  Color containerGradiant = Color(0xFF4C375E);

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
      confirmText: "CONFIRM",
      cancelText: "NOT NOW",
      helpText: "Set Timer",
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(
        () {
          selectedTime = timeOfDay;
        },
      );
    }
  }

  Widget deviceModeButton({String? text, Color? color, Color? textColor, bool? isSelected = false, Function? onTap, IconData? icon, Color? iconColor, Widget? child}) {
    return AppButton(
      text: text,
      child: child,
      color: color,
      shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
      textStyle: primaryTextStyle(color: textColor),
      textColor: textColor,
      padding: EdgeInsets.all(12),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.width(),
          height: context.height() * 0.45,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xFF554EAE),
                Color(0xFF554EAE),
                Color(0xFF554EAE),
                containerGradiant,
                containerGradiant,
                containerGradiant,
                SHContainerColor,
                SHContainerColor,
              ],
            ),
          ),
          child: Center(
            child: ListWheelScrollView(
              controller: _controller,
              itemExtent: 80,
              magnification: 1.2,
              useMagnifier: true,
              physics: FixedExtentScrollPhysics(),
              children: List.generate(
                deviceTemprature.length,
                (index) {
                  return Text(
                    deviceTemprature[index],
                    style: boldTextStyle(size: 45, color: white),
                  );
                },
              ), //List of widgets
            ),
          ),
        ),
        16.height,
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                deviceModeButton(
                  color: isSelected ? white : SHScaffoldDarkColor,
                  child: Icon(Icons.watch_later, color: isSelected ? black : white),
                  onTap: () async {
                    if (isSelected == false) {
                      _selectTime(context);
                    }

                    isSelected = !isSelected;

                    setState(() {});
                  },
                ),
                deviceModeButton(
                  child: Icon(Icons.ac_unit, color: isacUnitIcon ? black : white),
                  onTap: () {
                    isacUnitIcon = !isacUnitIcon;

                    setState(() {});
                  },
                  color: isacUnitIcon ? white : SHScaffoldDarkColor,
                ),
                deviceModeButton(
                  child: Image.asset(
                    'images/shHome/windFan.png',
                    height: 24,
                    width: 24,
                    color: isWindIcon ? black : white,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    isWindIcon = !isWindIcon;

                    setState(() {});
                  },
                  color: isWindIcon ? white : SHScaffoldDarkColor,
                  iconColor: white,
                ),
              ],
            ),
            16.height,
            AppButton(
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
            ).paddingSymmetric(horizontal: 8, vertical: 8),
          ],
        )
      ],
    );
  }
}
