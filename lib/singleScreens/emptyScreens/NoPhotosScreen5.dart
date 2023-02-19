import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class NoPhotosScreen5 extends StatefulWidget {
  const NoPhotosScreen5({Key? key}) : super(key: key);

  @override
  _NoPhotosScreen5State createState() => _NoPhotosScreen5State();
}

class _NoPhotosScreen5State extends State<NoPhotosScreen5> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF3981EC));
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
        backgroundColor: Color(0xFF3981EC),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(color: Color(0xFF2471E5), shape: BoxShape.circle),
                ),
                Column(
                  children: [
                    32.height,
                    commonCachedNetworkImage('$BaseUrl/images/emptyScreen1/noPhotos5.png', height: 200),
                  ],
                ),
              ],
            ),
            70.height,
            Text('No Photos', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              onPressed: () {
                toast('Add Photos');
              },
              backgroundColor: white,
              child: Icon(Icons.add, size: 30, color: Color(0xFF3981EC)),
            ),
            70.height,
          ],
        ),
      ),
    );
  }
}
