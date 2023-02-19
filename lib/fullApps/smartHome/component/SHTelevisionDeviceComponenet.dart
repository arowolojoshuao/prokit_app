import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/main.dart';

class SHTelevisionDeviceComponent extends StatefulWidget {
  const SHTelevisionDeviceComponent({Key? key}) : super(key: key);

  @override
  _SHTelevisionDeviceComponentState createState() => _SHTelevisionDeviceComponentState();
}

class _SHTelevisionDeviceComponentState extends State<SHTelevisionDeviceComponent> {
  int selectedIndex = 0;
  bool isVolume = false;
  int volumeCount = 1;
  int channelCount = 0;

  bool isSource = false;
  bool isApp = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Smart Tv 1234', style: boldTextStyle(color: white, size: 20)).expand(),
              CircleAvatar(child: Icon(Icons.power_settings_new, color: Colors.red), radius: 24, backgroundColor: SHScaffoldDarkColor).onTap(() {}, borderRadius: radius(24))
            ],
          ),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                height: context.height() * 0.30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: SHScaffoldDarkColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      elevation: 0,
                      height: 0,
                      color: SHScaffoldDarkColor,
                      child: Icon(Icons.add, color: white),
                      onTap: () {
                        setState(() {
                          if (volumeCount <= 98) {
                            volumeCount += 5;
                          }
                        });
                      },
                    ),
                    Text(
                      'Vol',
                      style: primaryTextStyle(color: white, size: 20),
                    ),
                    Text(
                      '$volumeCount',
                      style: boldTextStyle(color: white),
                    ),
                    AppButton(
                      elevation: 0,
                      color: SHScaffoldDarkColor,
                      child: Icon(Icons.minimize, color: white),
                      onTap: () {
                        setState(
                          () {
                            if (volumeCount > 1) {
                              volumeCount -= 5;
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
              16.width,
              Container(
                padding: EdgeInsets.all(8),
                height: context.height() * 0.30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: SHScaffoldDarkColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      elevation: 0,
                      height: 0,
                      color: SHScaffoldDarkColor,
                      child: Icon(Icons.arrow_drop_up, color: white),
                      onTap: () {
                        setState(
                          () {
                            channelCount++;
                          },
                        );
                      },
                    ),
                    Text('Ch', style: primaryTextStyle(color: white, size: 20)),
                    Text('$channelCount', style: boldTextStyle(color: white)),
                    AppButton(
                      elevation: 0,
                      color: SHScaffoldDarkColor,
                      child: Icon(Icons.arrow_drop_down, color: white),
                      onTap: () {
                        setState(
                          () {
                            if (channelCount > 0) channelCount--;
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ).center(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AppButton(
                    child: Icon(
                      isVolume ? Icons.volume_up : Icons.volume_off,
                      color: isVolume
                          ? appStore.isDarkModeOn
                              ? white
                              : black
                          : white,
                    ),
                    onTap: () {
                      setState(() {
                        isVolume = !isVolume;
                      });
                    },
                    color: isVolume ? context.cardColor : SHScaffoldDarkColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  8.height,
                  Text('Mute', style: primaryTextStyle(color: white))
                ],
              ),
              Column(
                children: [
                  AppButton(
                    child: Icon(
                      isSource ? Icons.source : Icons.source_outlined,
                      color: isSource
                          ? appStore.isDarkModeOn
                              ? white
                              : black
                          : white,
                    ),
                    onTap: () {
                      setState(
                        () {
                          isSource = !isSource;
                        },
                      );
                    },
                    color: isSource ? context.cardColor : SHScaffoldDarkColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  8.height,
                  Text(
                    'Source',
                    style: primaryTextStyle(color: white),
                  )
                ],
              ),
              Column(
                children: [
                  AppButton(
                    child: Icon(
                      isApp ? Icons.apps_sharp : Icons.apps,
                      color: isApp
                          ? appStore.isDarkModeOn
                              ? white
                              : black
                          : white,
                    ),
                    onTap: () {
                      setState(
                        () {
                          isApp = !isApp;
                        },
                      );
                    },
                    color: isApp ? context.cardColor : SHScaffoldDarkColor,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  8.height,
                  Text(
                    '123',
                    style: primaryTextStyle(color: white),
                  )
                ],
              )
            ],
          )
        ],
      ).center(),
    );
  }
}
