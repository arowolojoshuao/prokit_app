import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({Key? key}) : super(key: key);

  @override
  _LocationAccessScreenState createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFFFFFFF));
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
            Image.asset('images/errorScreens/9_Location Error.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Location Access', style: boldTextStyle(size: 30)),
                16.height,
                Text(
                  'Please enable location access to use this feature',
                  style: primaryTextStyle(size: 18, color: Colors.black54),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('ENABLE', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 10,
                  color: Color(0xFFE8772A),
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    toast('ENABLE');
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
