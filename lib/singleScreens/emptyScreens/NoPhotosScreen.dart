import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class NoPhotosScreen extends StatefulWidget {
  const NoPhotosScreen({Key? key}) : super(key: key);

  @override
  _NoPhotosScreenState createState() => _NoPhotosScreenState();
}

class _NoPhotosScreenState extends State<NoPhotosScreen> {
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('images/emptyScreen1/noPhotos1.png'),
            32.height,
            Text('No Photos!', style: boldTextStyle(size: 20)),
            32.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              child: Icon(Icons.add, size: 30),
              onPressed: () {
                toast('Add Photos');
              },
            ),
            70.height,
          ],
        ),
      ),
    );
  }
}
