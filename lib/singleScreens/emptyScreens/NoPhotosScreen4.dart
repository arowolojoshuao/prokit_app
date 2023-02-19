import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/utils/SemiCircleClipper.dart';

class NoPhotosScreen4 extends StatefulWidget {
  const NoPhotosScreen4({Key? key}) : super(key: key);

  @override
  _NoPhotosScreen4State createState() => _NoPhotosScreen4State();
}

class _NoPhotosScreen4State extends State<NoPhotosScreen4> {
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
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: SemiCircleClipper(),
                  child: Stack(
                    children: [
                      Container(
                        height: context.height() * 0.5,
                        decoration: BoxDecoration(color: Color(0xFF3981EC)),
                      ),
                      commonCachedNetworkImage('$BaseUrl/images/emptyScreen1/noPhotos4.png'),
                    ],
                  ),
                ),
                70.height,
                Text('No Photos!', style: boldTextStyle(size: 20)),
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
                    toast('Add Photos');
                  },
                ),
                70.height,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
