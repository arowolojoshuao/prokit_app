import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class CameraAccessScreen extends StatefulWidget {
  const CameraAccessScreen({Key? key}) : super(key: key);

  @override
  _CameraAccessScreenState createState() => _CameraAccessScreenState();
}

class _CameraAccessScreenState extends State<CameraAccessScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFF8F9FB));
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
            Image.asset('images/errorScreens/21_No Camera Access.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Camera Access', style: boldTextStyle(size: 30)),
                16.height,
                Text(
                  'Please allow access to your camera to take photos.',
                  style: primaryTextStyle(size: 18),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('ALLOW', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 20,
                  padding: EdgeInsets.all(16),
                  color: Color(0xFFEA62CC),
                  onTap: () {
                    toast('ALLOW');
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
