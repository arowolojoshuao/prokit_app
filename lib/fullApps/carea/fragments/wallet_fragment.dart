import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/commons/data_provider.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';
import 'package:prokit_flutter/fullApps/carea/screens/all_transaction_list.dart';
import 'package:prokit_flutter/fullApps/carea/screens/wallet_price_screen.dart';

class WalletFragment extends StatefulWidget {
  @override
  _WalletFragmentState createState() => _WalletFragmentState();
}

class _WalletFragmentState extends State<WalletFragment> {
  List<CallingModel> walletData = walletDataList();

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
      appBar: careaAppBarWidget(
        context,
        titleText: "My E-Wallet",
        actionWidget: IconButton(
          onPressed: () {
            //
          },
          icon: Icon(Icons.search, color: context.iconColor, size: 18),
        ),
        actionWidget2: IconButton(
          onPressed: () {
            //
          },
          icon: Icon(Icons.chat, color: context.iconColor, size: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Stack(
                children: [
                  Image.asset(
                    "images/carea/card2.jpeg",
                    fit: BoxFit.cover,
                    height: 195,
                    width: context.width(),
                  ).cornerRadiusWithClipRRect(24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Laura Smith", style: boldTextStyle(color: white, size: 18)),
                          Image.asset("images/carea/ic_visa.png", fit: BoxFit.cover, height: 20).paddingOnly(right: 24),
                        ],
                      ),
                      Text('1121 *** ** *** 5555', style: boldTextStyle(color: white)),
                      32.height,
                      Text("Your balance", style: boldTextStyle(color: white.withOpacity(0.7))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$" + "12,500", style: boldTextStyle(color: white, size: 28)),
                          AppButton(
                            onTap: () {
                              WalletPriceScreen().launch(context);
                            },
                            elevation: 0.0,
                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                            color: white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.camera, size: 18, color: black),
                                4.width,
                                Text('Top Up', style: primaryTextStyle(color: black)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ).paddingAll(24),
                  10.height,
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transaction History', style: boldTextStyle()),
                if (walletData.length >= 4)
                  TextButton(
                    onPressed: () {
                      AllTransactionList(walletData).launch(context);
                    },
                    child: Text('See All', style: boldTextStyle()),
                  ),
              ],
            ).paddingSymmetric(horizontal: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: walletData.take(7).length,
              padding: EdgeInsets.only(left: 16, bottom: 16, right: 16, top: 8),
              itemBuilder: (context, index) {
                CallingModel data = walletData[index];

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(listOfCarImage[index], height: 40, width: 40, color: context.iconColor, fit: BoxFit.cover),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.userName.validate(), style: boldTextStyle()),
                        8.height,
                        Text(data.subTitle.validate(), style: secondaryTextStyle()),
                      ],
                    ).expand(),
                    Column(
                      children: [
                        Text(data.countNumber.validate(), style: boldTextStyle()),
                        4.height,
                        Row(
                          children: [
                            Text(data.arriveTime.validate(), style: secondaryTextStyle()),
                            4.width,
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: boxDecorationWithRoundedCorners(
                                borderRadius: BorderRadius.all(Radius.circular(2)),
                                backgroundColor: data.colorValue!,
                              ),
                              child: Icon(data.icon, color: white, size: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).paddingSymmetric(vertical: 8);
              },
            ),
          ],
        ),
      ),
    );
  }
}
