import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class NoSentMailScreen extends StatefulWidget {
  const NoSentMailScreen({Key? key}) : super(key: key);

  @override
  _NoSentMailScreenState createState() => _NoSentMailScreenState();
}

class _NoSentMailScreenState extends State<NoSentMailScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF25DAE1));
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
        backgroundColor: Color(0xFF25DAE1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              height: 230,
              decoration: BoxDecoration(color: Color(0xFF21CED5), shape: BoxShape.circle),
              child: Image.asset('images/emptyScreen1/mailOut.png', fit: BoxFit.fill),
            ),
            48.height,
            Text('No Sent Mail', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              backgroundColor: white,
              child: Icon(Icons.add, color: Color(0xFF07E0D8), size: 30),
              onPressed: () {
                toast('Add Mail');
              },
            ),
          ],
        ),
      ),
    );
  }
}
