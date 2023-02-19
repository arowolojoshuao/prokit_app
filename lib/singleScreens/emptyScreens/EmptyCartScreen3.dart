import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class EmptyCartScreen3 extends StatefulWidget {
  const EmptyCartScreen3({Key? key}) : super(key: key);

  @override
  _EmptyCartScreen3State createState() => _EmptyCartScreen3State();
}

class _EmptyCartScreen3State extends State<EmptyCartScreen3> {
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
              child: commonCachedNetworkImage('$BaseUrl/images/emptyScreen1/emptyCart3.png'),
              decoration: BoxDecoration(color: grey.withOpacity(0.2), shape: BoxShape.circle),
            ),
            70.height,
            Text('Empty Cart', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            50.height,
            AppButton(
              child: Text('Start Shop', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
              color: Color(0xFF2D3E5E),
              onTap: () {
                toast('Start Shop');
              },
            ),
          ],
        ),
      ),
    );
  }
}
