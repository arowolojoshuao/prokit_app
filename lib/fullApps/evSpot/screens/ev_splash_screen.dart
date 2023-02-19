import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prokit_flutter/fullApps/evSpot/components/app_logo_image_component.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/sign_in_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';
import 'package:prokit_flutter/main.dart';

class EVSplashScreen extends StatefulWidget {
  static String tag = '/evspot';

  const EVSplashScreen({Key? key}) : super(key: key);

  @override
  State<EVSplashScreen> createState() => _EVSplashScreenState();
}

class _EVSplashScreenState extends State<EVSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: appStore.isDarkModeOn ? Colors.black : Colors.transparent,
        statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            AppLogoImageComponent(isCenter: true),
            Positioned(
              bottom: 0,
              child: Container(width: MediaQuery.of(context).size.width, child: Image.asset(splash_image2, fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
