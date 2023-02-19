import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class BrokenLinkScreen extends StatefulWidget {
  const BrokenLinkScreen({Key? key}) : super(key: key);

  @override
  _BrokenLinkScreenState createState() => _BrokenLinkScreenState();
}

class _BrokenLinkScreenState extends State<BrokenLinkScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFA0B1C0));
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
            Image.asset('images/errorScreens/11_Broken Link.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Broken Link!', style: boldTextStyle(size: 30, color: white)),
                16.height,
                Text(
                  'Something went wrong, Please try again later.',
                  style: primaryTextStyle(size: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('RETRY', style: boldTextStyle()).paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 10,
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    toast('RETRY');
                  },
                ),
                100.height,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
