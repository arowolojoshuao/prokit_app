import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/utils/SemiCircleClipper.dart';

class NoMailScreen extends StatefulWidget {
  const NoMailScreen({Key? key}) : super(key: key);

  @override
  _NoMailScreenState createState() => _NoMailScreenState();
}

class _NoMailScreenState extends State<NoMailScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFFDF3EA));
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
              clipper: SemiCircleClipper(),
              child: Container(
                child: Image.asset('images/emptyScreen1/noMail.png'),
                height: context.height() / 2,
                decoration: BoxDecoration(color: Color(0xFFFDF3EA)),
              ),
            ),
            50.height,
            Text('No Mail in Inbox', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lets Start Send some Mail',
              style: primaryTextStyle(size: 15, color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            50.height,
            AppButton(
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
              color: Color(0xFFEC9152),
              elevation: 10,
              onTap: () {
                toast('Start Compose');
              },
              child: Text('Start Compose', style: boldTextStyle(color: white)),
            ),
          ],
        ),
      ),
    );
  }
}
