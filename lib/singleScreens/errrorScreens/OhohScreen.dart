import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class OhohScreen extends StatefulWidget {
  const OhohScreen({Key? key}) : super(key: key);

  @override
  _OhohScreenState createState() => _OhohScreenState();
}

class _OhohScreenState extends State<OhohScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFFAFBFD));
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
            Image.asset('images/errorScreens/5_Something Wrong.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Oh oh!', style: boldTextStyle(size: 30)),
                16.height,
                Text(
                  'The file you are looking for is not here...',
                  style: primaryTextStyle(size: 18, color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('GO BACK', style: boldTextStyle(color: white)),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 10,
                  color: Color(0xFF3E76EA),
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    toast('GO BACK');
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
