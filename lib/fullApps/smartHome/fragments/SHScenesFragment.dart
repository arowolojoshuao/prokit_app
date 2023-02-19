import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHNewSceneScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHDataProvider.dart';
import 'package:prokit_flutter/main.dart';

class SHScenesFragment extends StatefulWidget {
  static String tag = '/SHScenesFragment';

  @override
  SHScenesFragmentState createState() => SHScenesFragmentState();
}

class SHScenesFragmentState extends State<SHScenesFragment> {
  List<SHModel> list = getScenesList();

  int count = 0;

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
      backgroundColor: SHScaffoldDarkColor,
      appBar: appBarWidget(
        '',
        elevation: 0,
        showBack: false,
        color: SHScaffoldDarkColor,
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(''),
            16.width,
            Text('Scenes  ', style: boldTextStyle(color: white)),
            IconButton(
              onPressed: () async {
                SHModel result = await SHNewSceneScreen().launch(context);

                list.add(result);

                setState(() {});
              },
              icon: Icon(Icons.add, color: white),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: list.map(
            (e) {
              int data = list.indexOf(e);

              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(16),
                width: context.width(),
                decoration: BoxDecoration(
                  color: count == data ? context.cardColor : SHContainerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonSHCachedNetworkImage(e.img.validate(), fit: BoxFit.cover, height: 40, width: 40),
                    16.width,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.name.validate(),
                          style: boldTextStyle(
                              color: count == data
                                  ? appStore.isDarkModeOn
                                      ? white
                                      : black
                                  : white),
                        ),
                        8.height,
                        Text(e.subtitle.validate(), style: secondaryTextStyle(color: grey)),
                      ],
                    )
                  ],
                ),
              ).onTap(
                () {
                  count = data;
                  setState(() {});
                },
                splashColor: SHScaffoldDarkColor,
                highlightColor: SHScaffoldDarkColor,
                borderRadius: radius(10),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
