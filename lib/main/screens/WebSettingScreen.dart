import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/model/SettingListModal.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:url_launcher/url_launcher.dart';

class WebSettingScreen extends StatefulWidget {
  const WebSettingScreen({Key? key}) : super(key: key);

  @override
  _WebSettingScreenState createState() => _WebSettingScreenState();
}

class _WebSettingScreenState extends State<WebSettingScreen> {
  List<SettingListModal> settingList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    settingList.add(
      SettingListModal(
        icon: 'images/app/ic_documentation.png',
        title: 'Documentation',
        onTap: () {
          launch(DocumentationUrl, forceWebView: true, enableJavaScript: true);
        },
      ),
    );
    settingList.add(
      SettingListModal(
        icon: 'images/app/ic_change_log.png',
        title: 'Change Logs',
        onTap: () {
          launch(ChangeLogsUrl, forceWebView: true, enableJavaScript: true);
        },
      ),
    );
    settingList.add(
      SettingListModal(
        icon: 'images/app/ic_rate_app.png',
        title: 'Rate us',
        onTap: () async {
          String package = "com.iqonic.prokitflutter";
          launch('$PlayStoreUrl$package', forceWebView: true, enableJavaScript: true);
        },
      ),
    );
    settingList.add(
      SettingListModal(icon: 'images/app/ic_theme.png', title: 'Dark Mode', isSwitch: true),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Settings',
        showBack: true,
        elevation: 0,
        titleTextStyle: boldTextStyle(size: 20),
        color: context.cardColor,
      ),
      body: Responsive(
        mobile: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(settingList.length, (index) {
              SettingListModal data = settingList[index];

              return HoverWidget(
                builder: (context, isHovering) => SettingItemWidget(
                  decoration: BoxDecoration(color: isHovering ? appColorPrimary.withOpacity(0.2) : null, borderRadius: radius(defaultRadius)),
                  onTap: data.onTap,
                  title: data.title.validate(),
                  leading: Image.asset(
                    data.icon.validate(),
                    height: 40,
                    width: 40,
                    color: isHovering ? appColorPrimary : context.iconColor,
                  ),
                  trailing: data.isSwitch.validate()
                      ? Switch(
                          value: appStore.isDarkModeOn,
                          onChanged: (s) {
                            appStore.toggleDarkMode(value: s);
                          },
                        ).withHeight(24)
                      : null,
                ),
              );
            }),
          ),
        ),
        web: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            children: List.generate(settingList.length, (index) {
              SettingListModal data = settingList[index];
              return HoverWidget(
                builder: (context, isHovering) => AnimatedContainer(
                  duration: 200.milliseconds,
                  decoration: boxDecorationDefault(color: isHovering ? appColorPrimary : context.cardColor),
                  width: 265,
                  padding: EdgeInsets.all(8),
                  child: SettingItemWidget(
                    title: data.title.validate(),
                    titleTextStyle: primaryTextStyle(color: isHovering ? Colors.white : context.iconColor),
                    leading: Image.asset(
                      data.icon.validate(),
                      height: 40,
                      width: 40,
                      color: isHovering ? Colors.white : context.iconColor,
                    ),
                    trailing: data.isSwitch.validate()
                        ? Switch(
                            value: appStore.isDarkModeOn,
                            onChanged: (s) {
                              appStore.toggleDarkMode(value: s);
                            },
                          ).withHeight(24)
                        : null,
                    onTap: data.onTap,
                  ),
                ),
              );
            }),
          ),
        ),
        tablet: Container(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            children: List.generate(settingList.length, (index) {
              SettingListModal data = settingList[index];
              return HoverWidget(
                builder: (context, isHovering) => AnimatedContainer(
                  duration: 200.milliseconds,
                  decoration: boxDecorationDefault(color: isHovering ? appColorPrimary.withOpacity(0.2) : context.cardColor),
                  width: 360,
                  padding: EdgeInsets.all(24),
                  child: SettingItemWidget(
                      title: data.title.validate(),
                      titleTextStyle: primaryTextStyle(color: isHovering ? appColorPrimary : context.iconColor),
                      leading: Image.asset(
                        data.icon.validate(),
                        height: 40,
                        width: 40,
                        color: isHovering ? appColorPrimary : context.iconColor,
                      ),
                      trailing: data.isSwitch.validate()
                          ? Switch(
                              value: appStore.isDarkModeOn,
                              onChanged: (s) {
                                appStore.toggleDarkMode(value: s);
                              },
                            ).withHeight(24)
                          : null,
                      onTap: data.onTap),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
