import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class NoEventScreen2 extends StatefulWidget {
  const NoEventScreen2({Key? key}) : super(key: key);

  @override
  _NoEventScreen2State createState() => _NoEventScreen2State();
}

class _NoEventScreen2State extends State<NoEventScreen2> {
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
              child: Image.asset('images/emptyScreen1/noEvent2.png'),
              decoration: BoxDecoration(color: grey.withOpacity(0.1), shape: BoxShape.circle),
            ),
            70.height,
            Text('No Event', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              child: Icon(Icons.add, size: 30),
              onPressed: () {
                toast('Add Event');
              },
            ),
          ],
        ),
      ),
    );
  }
}
