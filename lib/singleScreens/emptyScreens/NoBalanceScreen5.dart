import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class NoBalanceScreen5 extends StatefulWidget {
  const NoBalanceScreen5({Key? key}) : super(key: key);

  @override
  _NoBalanceScreen5State createState() => _NoBalanceScreen5State();
}

class _NoBalanceScreen5State extends State<NoBalanceScreen5> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFF58968));
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
        backgroundColor: Color(0xFFF58968),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 230,
              padding: EdgeInsets.all(40),
              child: Image.asset('images/emptyScreen1/noBalance5.png'),
              decoration: BoxDecoration(color: Color(0xFFF17650), shape: BoxShape.circle),
            ),
            40.height,
            Text('No Balance!', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              onPressed: () {
                toast('Add Balance');
              },
              backgroundColor: white,
              child: Icon(Icons.add, size: 30, color: Colors.lightBlue),
            ),
          ],
        ),
      ),
    );
  }
}
