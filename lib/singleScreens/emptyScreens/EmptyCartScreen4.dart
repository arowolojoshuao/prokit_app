import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class EmptyCartScreen4 extends StatefulWidget {
  const EmptyCartScreen4({Key? key}) : super(key: key);

  @override
  _EmptyCartScreen4State createState() => _EmptyCartScreen4State();
}

class _EmptyCartScreen4State extends State<EmptyCartScreen4> {
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
            Text('Empty Cart', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            50.height,
            AppButton(
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
              color: Color(0xFF2D3E5E),
              onTap: () {},
              child: Text('Start Shop', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
            ),
            60.height,
            Image.asset('images/emptyScreen1/emptyCart4.png'),
          ],
        ),
      ),
    );
  }
}
