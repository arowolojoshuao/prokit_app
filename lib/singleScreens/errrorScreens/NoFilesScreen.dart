import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class NoFilesScreen extends StatefulWidget {
  const NoFilesScreen({Key? key}) : super(key: key);

  @override
  _NoFilesScreenState createState() => _NoFilesScreenState();
}

class _NoFilesScreenState extends State<NoFilesScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF66279E));
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
            Image.asset('images/errorScreens/20_File Not Found.png', fit: BoxFit.cover, height: context.height()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('No Files', style: primaryTextStyle(size: 40, color: white)),
                32.height,
                Text(
                  'Opps! The file you are looking for cannot be found...',
                  style: primaryTextStyle(color: Colors.white54, size: 18),
                ).paddingSymmetric(horizontal: 8),
                48.height,
                AppButton(
                  color: context.cardColor,
                  child: Text('HOME', style: boldTextStyle()),
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
