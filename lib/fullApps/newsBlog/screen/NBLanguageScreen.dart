import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class NBLanguageScreen extends StatefulWidget {
  static String tag = '/NBLanguageScreen';

  @override
  NBLanguageScreenState createState() => NBLanguageScreenState();
}

class NBLanguageScreenState extends State<NBLanguageScreen> {
  List<NBLanguageItemModel> mLanguageList = nbGetLanguageItems();

  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    init();
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appStore.isDarkModeOn ? white : black),
          onPressed: () {
            finish(context, mLanguageList[selectedIndex]);
          },
        ),
        title: Text('Select Language', style: boldTextStyle(size: 20)),
        backgroundColor: context.cardColor,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: mLanguageList.length,
        itemBuilder: (_, index) {
          return Row(
            children: [
              Row(
                children: [
                  commonCacheImageWidget('${mLanguageList[index].image}', 30),
                  8.width,
                  Text('${mLanguageList[index].name}', style: primaryTextStyle()),
                ],
              ).expand(),
              index == selectedIndex
                  ? Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: NBPrimaryColor,
                    )
                  : SizedBox(),
            ],
          ).paddingOnly(top: 8, bottom: 8).onTap(
            () {
              setState(
                () {
                  selectedIndex = index;
                },
              );
              finish(context, mLanguageList[selectedIndex]);
            },
          );
        },
      ),
    );
  }
}
