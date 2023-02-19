import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/model/BankingModel.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingDataGenerator.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';
import 'package:prokit_flutter/main.dart';

class BankingRateInfo extends StatefulWidget {
  static var tag = "/BankingRateInfo";

  @override
  _BankingRateInfoState createState() => _BankingRateInfoState();
}

class _BankingRateInfoState extends State<BankingRateInfo> {
  late List<BankingRateInfoModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = bankingRateInformationList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: appStore.isDarkModeOn ? white : Banking_blackColor,
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  30.height,
                  Text(Banking_lbl_Rate_Info, style: boldTextStyle(size: 32)),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 4, right: 4, bottom: 16),
                child: Row(
                  children: <Widget>[
                    Text('Currency', style: primaryTextStyle(size: 18)).expand(flex: 4),
                    Text('Buy', style: primaryTextStyle(size: 18)).expand(),
                    Text('Sell', style: primaryTextStyle(size: 18)).expand(),
                  ],
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList1.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              mList1[index].flag!,
                              height: 30,
                              width: 30,
                              fit: BoxFit.fill,
                            ).cornerRadiusWithClipRRect(15.0),
                            10.width,
                            Text(mList1[index].currency!, style: primaryTextStyle()),
                          ],
                        ).expand(flex: 4),
                        Text(mList1[index].buy!, style: secondaryTextStyle(size: 16)).expand(),
                        Text(mList1[index].sell!, style: boldTextStyle()).expand(),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
