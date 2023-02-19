import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/main.dart';

class SHRoomDeviceScreen extends StatefulWidget {
  final String? title;
  final List<SHDeviceModel> lists;
  int? index;

  SHRoomDeviceScreen({this.title, required this.lists, required this.index});

  @override
  _SHRoomDeviceScreenState createState() => _SHRoomDeviceScreenState();
}

class _SHRoomDeviceScreenState extends State<SHRoomDeviceScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    setStatusBarColor(SHScaffoldDarkColor);

    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SHScaffoldDarkColor,
        appBar: appBarWidget(
          widget.title.validate(),
          color: SHScaffoldDarkColor,
          center: true,
          actions: [
            Icon(Icons.apps_outlined, color: SHScaffoldDarkColor),
          ],
          textColor: white,
          elevation: 0,
        ),
        body: Column(
          children: [
            HorizontalList(
              itemCount: widget.lists.length,
              itemBuilder: (_, index) {
                SHDeviceModel data = widget.lists[index];
                bool isMyIndex = widget.index == index;

                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isMyIndex ? context.cardColor : SHContainerColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        data.deviceImg.validate(),
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                        color: isMyIndex
                            ? appStore.isDarkModeOn
                                ? white
                                : black
                            : white,
                      ),
                      8.height,
                      Text(
                        data.deviceTitle.validate(),
                        style: boldTextStyle(color: isMyIndex ? null : white),
                      ),
                    ],
                  ),
                ).onTap(() {
                  selectedIndex = index;
                  widget.index = index;

                  setState(() {});
                }, borderRadius: radius(16));
              },
            ),
            16.height,
            Container(
              child: widget.lists[widget.index.validate()].deviceComponent.validate(),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: SHContainerColor,
                borderRadius: radius(),
              ),
            ).expand(),
          ],
        ),
      ),
    );
  }
}
