import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class PageNotFoundScreen extends StatefulWidget {
  const PageNotFoundScreen({Key? key}) : super(key: key);

  @override
  _PageNotFoundScreenState createState() => _PageNotFoundScreenState();
}

class _PageNotFoundScreenState extends State<PageNotFoundScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFF4F6FB));
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
            Image.asset('images/errorScreens/2_404 Error.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Page Not Found', style: boldTextStyle(size: 30, color: Colors.black)),
                16.height,
                Text(
                  'The page you are looking for doesn\'t seem to exist...',
                  style: primaryTextStyle(size: 18, color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('GO HOME', style: boldTextStyle(color: white)),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 10,
                  color: Color(0xFF3E76EA),
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    toast('GO HOME');
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
