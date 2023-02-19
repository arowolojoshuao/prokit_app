import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class AllTaskDoneScreen2 extends StatefulWidget {
  const AllTaskDoneScreen2({Key? key}) : super(key: key);

  @override
  _AllTaskDoneScreen2State createState() => _AllTaskDoneScreen2State();
}

class _AllTaskDoneScreen2State extends State<AllTaskDoneScreen2> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFB45CFF));
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
        backgroundColor: Color(0xFFB45CFF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 230,
              padding: EdgeInsets.all(32),
              child: Image.asset('images/emptyScreen1/allTaskDone2.png'),
              decoration: BoxDecoration(color: Color(0xFFAE56FA), shape: BoxShape.circle),
            ),
            48.height,
            Text('All Task Done!', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            50.height,
            AppButton(
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
              elevation: 10,
              onTap: () {
                toast('Review');
              },
              child: Text(
                'Review',
                style: boldTextStyle(
                  color: Color(0xFFB45CFF),
                ),
              ).paddingSymmetric(horizontal: 32),
            ),
            100.height,
          ],
        ),
      ),
    );
  }
}
