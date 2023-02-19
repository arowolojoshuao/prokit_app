import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/smart_home/models/smart_home_info_model.dart';
import 'package:prokit_flutter/dashboard/smart_home/utils/colors.dart';
import 'package:prokit_flutter/main.dart';
import "package:prokit_flutter/dashboard/smart_home/utils/constant.dart";

class DevicesComponent extends StatefulWidget {
  const DevicesComponent({
    Key? key,
    required this.deviceData,
  }) : super(key: key);

  final SmartHomeInfoModel deviceData;

  @override
  _DevicesComponentState createState() => _DevicesComponentState();
}

class _DevicesComponentState extends State<DevicesComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appStore.isDarkModeOn ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.5),
        borderRadius: radius(DEFAULT_RADIUS),
      ),
      child: ListTile(
        horizontalTitleGap: 8,
        title: Text('${widget.deviceData.deviceTitle}', style: primaryTextStyle(size: 18)),
        subtitle: RichText(
          text: TextSpan(
            text: 'Status ',
            style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white70 : Colors.black),
            children: [
              TextSpan(text: '${widget.deviceData.deviceStatus}', style: primaryTextStyle()),
            ],
          ),
        ),
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: widget.deviceData.deviceIconColor!.withOpacity(0.3), shape: BoxShape.circle),
          child: Image.asset(widget.deviceData.deviceIcon!, height: 22, width: 22, color: widget.deviceData.deviceIconColor),
        ),
        trailing: CupertinoSwitch(
          value: widget.deviceData.deviceToggle == true ? true : false,
          thumbColor: primaryHomeColor1,
          activeColor: primaryHomeColor1.withOpacity(0.4),
          trackColor: primaryHomeColor1.withOpacity(0.4),
          onChanged: (value) {
            widget.deviceData.deviceToggle = !widget.deviceData.deviceToggle!;
            setState(() {});
          },
        ),
      ),
    );
  }
}
