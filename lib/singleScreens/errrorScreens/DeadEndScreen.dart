import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class DeadEndScreen extends StatefulWidget {
  const DeadEndScreen({Key? key}) : super(key: key);

  @override
  _DeadEndScreenState createState() => _DeadEndScreenState();
}

class _DeadEndScreenState extends State<DeadEndScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF3BC3A4));
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
          children: [
            Image.asset(
              'images/errorScreens/8_404 Error.png',
              fit: BoxFit.cover,
              height: context.height(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Dead End', style: primaryTextStyle(size: 40, color: white)),
                32.height,
                Text(
                  'Opps! The page you are looking for doesn\'t exist...',
                  style: primaryTextStyle(color: Colors.white60, size: 18),
                ),
                48.height,
                AppButton(
                  child: Text('HOME', style: boldTextStyle()),
                  color: context.cardColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 10,
                  onTap: () {
                    toast('HOME');
                  },
                ),
              ],
            ).paddingAll(32),
          ],
        ),
      ),
    );
  }
}
