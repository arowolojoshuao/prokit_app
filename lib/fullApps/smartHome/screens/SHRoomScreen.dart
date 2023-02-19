import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHRoomDeviceScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/main.dart';

class SHRoomScreen extends StatefulWidget {
  final String? title;
  final List<SHDeviceModel>? list;

  SHRoomScreen({this.title, this.list});

  @override
  _SHRoomScreenState createState() => _SHRoomScreenState();
}

class _SHRoomScreenState extends State<SHRoomScreen> {
  // List<SHModel> livingRoomList = getLivingRoomList();
  int selectedIndex = 0;

  @override
  void initState() {
    init();

    super.initState();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              commonSHCachedNetworkImage(
                'https://media.architecturaldigest.com/photos/571e97c5741fcddb16b559c9/master/w_1600%2Cc_limit/modernist-decor-inspiration-01.jpg',
                fit: BoxFit.cover,
                height: context.height(),
                width: context.width(),
              ),
              Container(color: Colors.black38),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BackButton(
                          color: white,
                          onPressed: () {
                            finish(context);
                          },
                        ),
                        Text(widget.title.validate(), style: boldTextStyle(color: white, size: 24)),
                      ],
                    ),
                    16.height,
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: widget.list!.map(
                        (e) {
                          SHDeviceModel data = widget.list![widget.list!.indexOf(e)];
                          bool isDeviceStatus = data.mIsCheck.validate();

                          return Container(
                            decoration: boxDecorationDefault(
                              color: isDeviceStatus ? context.cardColor : SHScaffoldDarkColor,
                              borderRadius: radius(16),
                            ),
                            padding: EdgeInsets.all(12),
                            width: context.width() / 2 - 24,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      data.status.validate(),
                                      style: boldTextStyle(color: isDeviceStatus ? null : Colors.grey),
                                    ).expand(),
                                    Transform.scale(
                                      scale: 1,
                                      child: CupertinoSwitch(
                                        value: data.mIsCheck.validate(),
                                        activeColor: isDeviceStatus ? SHSecondaryColor : SHContainerColor,
                                        onChanged: (bool val) {
                                          data.mIsCheck = val;
                                          if (data.mIsCheck!) {
                                            data.status = "ON";
                                          } else {
                                            data.status = "OFF";
                                          }
                                          setState(() {});
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                16.height,
                                Image.asset(
                                  data.deviceImg.validate(),
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                  color: isDeviceStatus
                                      ? appStore.isDarkModeOn
                                          ? white
                                          : black
                                      : white,
                                ),
                                8.height,
                                Text(
                                  data.deviceTitle.validate(),
                                  style: boldTextStyle(color: isDeviceStatus ? null : white),
                                ),
                                4.height,
                              ],
                            ),
                          ).onTap(
                            () {
                              log(data.sublist!.length);
                              data.mIsCheck.validate()
                                  ? SHRoomDeviceScreen(
                                      lists: data.sublist.validate(),
                                      title: data.deviceTitle.validate(),
                                      index: widget.list!.indexOf(e),
                                    ).launch(context)
                                  : toast('Please turn on the ${data.deviceTitle}');
                            },
                          );
                        },
                      ).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
