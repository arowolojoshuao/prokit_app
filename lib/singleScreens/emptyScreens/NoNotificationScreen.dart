import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/utils/SemiCircleClipper.dart';

class NoNotificationScreen extends StatefulWidget {
  const NoNotificationScreen({Key? key}) : super(key: key);

  @override
  _NoNotificationScreenState createState() => _NoNotificationScreenState();
}

class _NoNotificationScreenState extends State<NoNotificationScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFFFC655));
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: SemiCircleClipper(),
                  child: Container(
                    height: context.height() * 0.5,
                    decoration: BoxDecoration(color: Color(0xFFFFC655)),
                  ),
                ),
                150.height,
                Text('No Notification', style: boldTextStyle(size: 20)),
                16.height,
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: secondaryTextStyle(size: 15),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 60),
              ],
            ),
            Image.asset('images/emptyScreen1/bell.png', height: 180),
          ],
        ),
      ),
    );
  }
}
