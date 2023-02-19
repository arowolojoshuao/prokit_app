import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWToastScreen extends StatefulWidget {
  static String tag = '/MWToastScreen';

  @override
  MWToastScreenState createState() => MWToastScreenState();
}

class MWToastScreenState extends State<MWToastScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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

  List<ListModel> example = [
    ListModel(name: 'Simple Toast'),
    ListModel(name: 'Error Toast'),
    ListModel(name: 'Top Gravity'),
    ListModel(name: 'Center Gravity'),
    ListModel(name: 'Long Toast'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: appBar(context, 'Toast'),
      key: scaffoldKey,
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (BuildContext context, index) {
          return ExampleItemWidget(example[index], onTap: () {
            if (index == 0) {
              toasty(context, 'This is simple Toast');
            } else if (index == 1) {
              toasty(context, "This is error Toast", bgColor: Colors.redAccent, textColor: whiteColor, gravity: ToastGravity.BOTTOM);
            } else if (index == 2) {
              toasty(context, 'This is in top Toast', gravity: ToastGravity.TOP);
            } else if (index == 3) {
              toasty(context, 'Hello ,I\'m in center', gravity: ToastGravity.CENTER);
            } else if (index == 4) {
              toasty(context, 'This toast will display for long time', length: Toast.LENGTH_LONG);
            }
          });
        },
      ),
    );
  }
}
