import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class NoEventScreen4 extends StatefulWidget {
  const NoEventScreen4({Key? key}) : super(key: key);

  @override
  _NoEventScreen4State createState() => _NoEventScreen4State();
}

class _NoEventScreen4State extends State<NoEventScreen4> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF13C7E7));
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
        backgroundColor: Color(0xFF13C7E7),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            commonCachedNetworkImage('$BaseUrl/images/emptyScreen1/noEvent5.png', height: 250),
            48.height,
            Text('No Event', style: boldTextStyle(size: 20, color: white)),
            32.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              backgroundColor: white,
              child: Icon(Icons.add, size: 30, color: Color(0xFF13C7E7)),
              onPressed: () {
                toast('Add Event');
              },
            ),
            70.height,
          ],
        ),
      ),
    );
  }
}
