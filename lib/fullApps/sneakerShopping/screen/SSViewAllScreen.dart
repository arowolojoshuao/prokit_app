import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/component/SSProductItemWidget.dart';

import '../../../main.dart';

class SSViewAllScreen extends StatefulWidget {
  @override
  SSViewAllScreenState createState() => SSViewAllScreenState();
}

class SSViewAllScreenState extends State<SSViewAllScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Image(image: AssetImage('images/sneakerShopping/ic_sneaker_logo.png'), height: 30, width: 30, color: appStore.isDarkModeOn ? Colors.white : Colors.black, fit: BoxFit.cover),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero, side: BorderSide(color: Color(0x00000000), width: 1)),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
      ),
      body: SSProductItemWidget(),
    );
  }
}
