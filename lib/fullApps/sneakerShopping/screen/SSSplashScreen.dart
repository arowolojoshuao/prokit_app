import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/screen/SSBuildScreen.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSWidgets.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../main.dart';

class SSSplashScreen extends StatefulWidget {
  static String tag = '/sneaker_shopping';

  @override
  State<SSSplashScreen> createState() => _SSSplashScreenState();
}

class _SSSplashScreenState extends State<SSSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 2));
    finish(context);
    SSBuildScreen().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage('images/sneakerShopping/ic_sneaker_logo.png'),
                        height: 100,
                        width: 100,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: Text(
                          "Build your own path with every step",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: primaryTextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage('$BaseUrl/images/sneakerShopping/ic_arrivals_2.jpg'),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            width: 200,
            child: sSAppButton(
              context: context,
              title: 'Start Shopping',
              onPressed: () {
                //
              },
            ),
          )
        ],
      ),
    );
  }
}
