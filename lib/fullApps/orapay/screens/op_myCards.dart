import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/orapay/model/OPModel.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/OPDataProvider.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/OPWidgets.dart';

class op_myCards extends StatefulWidget {
  @override
  op_myCardsState createState() => op_myCardsState();
}

class op_myCardsState extends State<op_myCards> {
  List<OPPickVerifyModel> allCardList = getAllCardListItems();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: allCardList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          OPPickVerifyModel data = allCardList[index];

          return Container(
            width: context.width() - 32,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
            decoration: boxDecoration(radius: 20, backGroundColor: data.cardColor, spreadRadius: 4.0, blurRadius: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset('images/orapay/opchip.png', height: 40, width: 40),
                        Text(data.cardTitle!, style: boldTextStyle(size: 20, color: Colors.white)),
                      ],
                    ),
                    8.height,
                    FittedBox(
                      child: Text(
                        "**** **** **** " + data.cardNumber!,
                        style: boldTextStyle(size: 20, color: Colors.white, letterSpacing: 3, wordSpacing: 2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    16.height,
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            'CARDHOLDER',
                            style: secondaryTextStyle(color: Colors.white60),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        8.height,
                        FittedBox(
                          child: Text(
                            data.cardSubTitle!,
                            style: primaryTextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            'EXPIRES',
                            style: secondaryTextStyle(color: Colors.white60),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        FittedBox(
                          child: Text(
                            data.cardExpireDate!,
                            style: primaryTextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
