import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSCompleteProfileOneScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';

class JSSettingComponent extends StatefulWidget {
  const JSSettingComponent({Key? key}) : super(key: key);

  @override
  _JSSettingComponentState createState() => _JSSettingComponentState();
}

class _JSSettingComponentState extends State<JSSettingComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 24.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        ExpansionTile(
          title: jsGetTitle("Jobseekers"),
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    jsGetSubTitle("CV").onTap(() {
                      JSCompleteProfileOneScreen().launch(context);
                    }),
                    jsGetSubTitle("Help Center"),
                    jsGetSubTitle("Browse Companies"),
                    jsGetSubTitle("career advice"),
                    jsGetSubTitle("Work at Indeed"),
                    jsGetSubTitle("Browse Jobs"),
                  ],
                )),
          ],
        ),
        ExpansionTile(
          title: jsGetTitle("Employers"),
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  jsGetSubTitle("Post a job"),
                  jsGetSubTitle("Help Center"),
                  jsGetSubTitle("Indeed Events"),
                ],
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: jsGetTitle("About"),
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  jsGetSubTitle("About"),
                ],
              ),
            ),
          ],
        ),
        16.height,
        Text("@2022 Indeed", style: primaryTextStyle()).paddingOnly(left: 16),
        8.height,
        Row(
          children: [
            Text("Accessibility at Indeed", style: primaryTextStyle(size: 14)).paddingOnly(left: 16),
            16.width,
            Text("Privacy Center", style: primaryTextStyle(size: 14)),
            16.width,
            Text("Cookies", style: primaryTextStyle(size: 14)),
          ],
        ),
        8.height,
        Row(
          children: [
            Text("Privacy", style: primaryTextStyle()).paddingOnly(left: 16),
            16.width,
            Text("Terms", style: primaryTextStyle()),
          ],
        ),
      ],
    );
  }
}
