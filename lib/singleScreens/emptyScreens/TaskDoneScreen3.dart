import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class TaskDoneScreen3 extends StatefulWidget {
  const TaskDoneScreen3({Key? key}) : super(key: key);

  @override
  _TaskDoneScreen3State createState() => _TaskDoneScreen3State();
}

class _TaskDoneScreen3State extends State<TaskDoneScreen3> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF25AAE2));
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
        backgroundColor: Color(0xFF25AAE2),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 230,
              child: Image.asset('images/emptyScreen1/taskDone3.png'),
              decoration: BoxDecoration(color: Color(0xFF23A4DB), shape: BoxShape.circle),
            ),
            80.height,
            Text('Task Done!', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
          ],
        ),
      ),
    );
  }
}
