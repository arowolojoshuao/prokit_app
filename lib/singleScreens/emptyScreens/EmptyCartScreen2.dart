import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class EmptyCartScreen2 extends StatefulWidget {
  const EmptyCartScreen2({Key? key}) : super(key: key);

  @override
  _EmptyCartScreen2State createState() => _EmptyCartScreen2State();
}

class _EmptyCartScreen2State extends State<EmptyCartScreen2> {
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
              padding: EdgeInsets.all(32),
              child: Image.asset('images/emptyScreen1/emptyCart2.png'),
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
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
              color: Color(0xFF2D3E5E),
              onTap: () {
                toast('Start Shop');
              },
              child: Text('Start Shop', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
            ),
          ],
        ),
      ),
    );
  }
}
