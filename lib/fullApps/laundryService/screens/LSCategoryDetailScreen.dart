import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';

class LSCategoryDetailScreen extends StatefulWidget {
  static String tag = '/LSCategoryDetailScreen';
  final String? title;

  LSCategoryDetailScreen({this.title});

  @override
  LSCategoryDetailScreenState createState() => LSCategoryDetailScreenState();
}

class LSCategoryDetailScreenState extends State<LSCategoryDetailScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        widget.title.validate(),
        center: true,
        color: context.cardColor,
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.arrow_drop_down, color: context.iconColor),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(context.width(), 110),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
                    padding: EdgeInsets.all(12),
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: LSColorPrimary, borderRadius: BorderRadius.circular(24)),
                    child: Icon(Icons.pin_drop, color: white),
                  ),
                  Text('Location', style: primaryTextStyle(color: LSColorPrimary)),
                ],
              ).expand(),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
                    padding: EdgeInsets.all(12),
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: LSColorPrimary, borderRadius: BorderRadius.circular(24)),
                    child: Icon(Icons.pin_drop, color: white),
                  ),
                  Text('Location', style: primaryTextStyle(color: LSColorPrimary)),
                ],
              ).expand(),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
                    padding: EdgeInsets.all(12),
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: LSColorPrimary, borderRadius: BorderRadius.circular(24)),
                    child: Icon(Icons.pin_drop, color: white),
                  ),
                  Text('Location', style: primaryTextStyle(color: LSColorPrimary)),
                ],
              ).expand(),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
                    padding: EdgeInsets.all(12),
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: LSColorPrimary, borderRadius: BorderRadius.circular(24)),
                    child: Icon(Icons.pin_drop, color: white),
                  ),
                  Text('Location', style: primaryTextStyle(color: LSColorPrimary)),
                ],
              ).expand()
            ],
          ).paddingBottom(8),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
          ],
        ),
      ),
    );
  }
}
