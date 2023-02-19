import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class NoNotificationScreen5 extends StatefulWidget {
  const NoNotificationScreen5({Key? key}) : super(key: key);

  @override
  _NoNotificationScreen5State createState() => _NoNotificationScreen5State();
}

class _NoNotificationScreen5State extends State<NoNotificationScreen5> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF3FAC85));
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
        backgroundColor: Color(0xFF3FAC85),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            70.height,
            Column(
              children: [
                Text('No Notification', style: boldTextStyle(size: 20, color: white)),
                16.height,
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: primaryTextStyle(size: 15, color: white),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 60),
              ],
            ),
            100.height,
            Container(
              padding: EdgeInsets.all(32),
              child: Image.asset('images/emptyScreen1/mobileChat.png'),
              height: 230,
              decoration: BoxDecoration(color: lightGray.withOpacity(0.2), shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
