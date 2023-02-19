import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class NoVideosScreen3 extends StatefulWidget {
  const NoVideosScreen3({Key? key}) : super(key: key);

  @override
  _NoVideosScreen3State createState() => _NoVideosScreen3State();
}

class _NoVideosScreen3State extends State<NoVideosScreen3> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 230,
              child: Image.asset('images/emptyScreen1/noVideo3.png'),
              decoration: BoxDecoration(color: Color(0xFFF8F8F8), shape: BoxShape.circle),
            ),
            80.height,
            Text('No Videos!', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
          ],
        ),
      ),
    );
  }
}
