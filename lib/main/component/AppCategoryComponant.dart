import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTWalkThoughScreen.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/component/WebCategoryWidget.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppImages.dart';
import 'package:prokit_flutter/main/utils/AppStrings.dart';

class AppCategoryComponent extends StatefulWidget {
  final bool? isHover;
  AppTheme appTheme = AppTheme();

  AppCategoryComponent({this.isHover, required this.appTheme});

  @override
  _AppCategoryComponentState createState() => _AppCategoryComponentState();
}

class _AppCategoryComponentState extends State<AppCategoryComponent> {
  int selectedIndex = 8;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    afterBuildCreated(() {
      appStore.setWebListing(widget.appTheme.webApps!.sub_kits!);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 16,
      children: [
        WebCategoryWidget(
          1,
          appCat5,
          app_ic_phone,
          widget.appTheme.defaultTheme!.name,
          isHover: widget.isHover,
          type: widget.appTheme.defaultTheme!.type,
          onTap: (id) {
            webSelectedDrawerItem = id;

            push(DTWalkThoughScreen(), pageRouteAnimation: PageRouteAnimation.Slide, duration: 300.milliseconds);
          },
        ),
        WebCategoryWidget(
          2,
          appCat4,
          app_ic_phone,
          widget.appTheme.widgets!.name,
          isHover: widget.isHover,
          type: widget.appTheme.widgets!.type,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.widgets!.sub_kits!);
          },
        ),
        WebCategoryWidget(
          3,
          appCat1,
          app_ic_phone,
          appLblFullApps,
          isHover: widget.isHover,
          type: widget.appTheme.fullApp!.type,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.fullApp!.sub_kits!);
          },
        ),
        WebCategoryWidget(
          4,
          appCat2,
          app_dashboard,
          appLblDashboard,
          isHover: widget.isHover,
          type: widget.appTheme.dashboard!.type,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.dashboard!.sub_kits!);
          },
        ),
        WebCategoryWidget(
          5,
          appCat3,
          app_ic_phone,
          appLblIntegrations,
          isNew: true,
          isHover: widget.isHover,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.integrations!.sub_kits!);
          },
        ),
        WebCategoryWidget(
          6,
          appCat1,
          app_ic_phone,
          appLblThemeList,
          isHover: widget.isHover,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.themes!);
          },
        ),
        WebCategoryWidget(
          7,
          appCat4,
          app_ic_phone,
          appLblScreenList,
          isHover: widget.isHover,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.screenList!);
          },
        ),
        WebCategoryWidget(
          8,
          appCat2,
          app_ic_phone,
          appLblWeb,
          isHover: widget.isHover,
          isNew: true,
          onTap: (id) {
            webSelectedDrawerItem = id;

            appStore.setWebListing(widget.appTheme.webApps!.sub_kits!);
          },
        ),
      ],
    ).paddingTop(16);
  }
}
