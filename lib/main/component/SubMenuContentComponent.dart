import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/component/ThemeListWeb.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class SubMenuContentComponent extends StatelessWidget {
  ProTheme proTheme;

  SubMenuContentComponent({required this.proTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(proTheme.name.validate(), style: boldTextStyle()),
        iconTheme: IconThemeData(color: context.iconColor),
        actions: [
          Switch(
            activeColor: appColorPrimary,
            value: appStore.isDarkModeOn,
            onChanged: (s) {
              appStore.toggleDarkMode(value: s);
            },
          ).withHeight(24)
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ThemeListWeb(mainList: proTheme.sub_kits!),
      ),
    );
  }
}
