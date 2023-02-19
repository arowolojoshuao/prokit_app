import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class NoVideosScreen extends StatefulWidget {
  const NoVideosScreen({Key? key}) : super(key: key);

  @override
  _NoVideosScreenState createState() => _NoVideosScreenState();
}

class _NoVideosScreenState extends State<NoVideosScreen> {
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
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(color: lightGrey.withOpacity(0.5), shape: BoxShape.circle),
                ),
                Image.asset('images/emptyScreen1/noVideo1.png', height: 300),
              ],
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
