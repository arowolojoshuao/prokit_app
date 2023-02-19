import 'dart:ui';

import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/screens/top_up_payment.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class WalletPriceScreen extends StatefulWidget {
  @override
  _WalletPriceScreenState createState() => _WalletPriceScreenState();
}

class _WalletPriceScreenState extends State<WalletPriceScreen> {
  TextEditingController? priceController = TextEditingController();

  List<String> priceList = ["\$10.000", "\$50.0000", "\$100.000", "\$150.000", "\$200.000", "\$250.000", "\$500.000", "\$700.000", "\$100.000"];

  int? selectedIndex;

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
      appBar: careaAppBarWidget(context, titleText: "Top Up E-Wallet"),
      body: Column(
        children: [
          8.height,
          Text('Enter the amount of top up', style: primaryTextStyle()),
          8.height,
          TextFormField(
            controller: priceController,
            style: boldTextStyle(size: 42),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 40),
              focusedBorder: OutlineInputBorder(
                borderRadius: radius(20),
                borderSide: BorderSide(color: appStore.isDarkModeOn ? white : black, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: radius(20),
                borderSide: BorderSide(color: appStore.isDarkModeOn ? white : black, width: 1.0),
              ),
            ),
          ).paddingAll(16),
          24.height,
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              priceList.length,
              (index) => GestureDetector(
                onTap: () {
                  selectedIndex = index;
                  priceController!.text = priceList[index];
                  hideKeyboard(context);
                  setState(() {});
                },
                child: Container(
                  width: context.width() * 0.33 - 18,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: appStore.isDarkModeOn
                        ? cardDarkColor
                        : selectedIndex == index
                            ? appStore.isDarkModeOn
                                ? white
                                : black
                            : white,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    border: Border.all(color: context.iconColor),
                  ),
                  child: Text(
                    priceList[index],
                    style: primaryTextStyle(
                        color: selectedIndex == index
                            ? white
                            : appStore.isDarkModeOn
                                ? white
                                : black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          16.height,
          AppButton(
            onTap: () {
              TopUpWallet().launch(context);
            },
            width: context.width(),
            elevation: 0.0,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
            color: appStore.isDarkModeOn ? cardDarkColor : black,
            child: Text('Continue', style: boldTextStyle(color: white), textAlign: TextAlign.center),
          ).paddingAll(16)
        ],
      ),
    );
  }
}
