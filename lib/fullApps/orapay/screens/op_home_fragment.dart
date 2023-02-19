import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/orapay/model/OPModel.dart';
import 'package:prokit_flutter/fullApps/orapay/screens/op_transaction_screen.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Colors.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/OPDataProvider.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/OPWidgets.dart';

class OPDasboardScreen extends StatefulWidget {
  @override
  OPDasboardScreenState createState() => OPDasboardScreenState();
}

class OPDasboardScreenState extends State<OPDasboardScreen> {
  List<OPPickVerifyModel> allCardList = getAllCardListItems();

  List<OPPickVerifyModel> transactionList = getTransactionListItems();

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 260,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: allCardList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  OPPickVerifyModel data = allCardList[index];

                  return Container(
                    width: context.width() - 32,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 16),
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
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Transaction', style: secondaryTextStyle(size: 18, fontFamily: fontMedium)),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 5),
                    height: 34,
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.withAlpha(50)),
                    ),
                    child: DropdownButton(
                      value: 'Weekly',
                      underline: SizedBox(),
                      items: <String>['Daily', 'Weekly', 'Monthly', 'Yearly'].map(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: primaryTextStyle(size: 14)),
                          );
                        },
                      ).toList(),
                      onChanged: (dynamic value) {},
                    ),
                  )
                ],
              ),
            ),
            ListView.separated(
              separatorBuilder: (_, index) => Divider(),
              padding: EdgeInsets.all(8),
              itemCount: transactionList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                OPPickVerifyModel data = transactionList[index];

                return Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.green.withOpacity(0.2),
                                radius: 20,
                                child: Icon(data.icon, color: Colors.green, size: 20),
                              ),
                              SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(data.cardTitle!, style: primaryTextStyle(fontFamily: fontMedium, size: 18)),
                                  SizedBox(height: 4),
                                  Text(data.cardSubTitle!, style: secondaryTextStyle(size: 12)),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(height: 10),
                                Text(data.cardNumber!, style: boldTextStyle(color: data.cardColor, size: 14)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ).onTap(() {
                  OPTransactionDetailsScreen().launch(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
