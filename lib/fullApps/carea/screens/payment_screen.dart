import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/colors.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/main.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<String> paymentList = ['My Wallet', 'Paypal', 'Google Pay', 'Apple Pay', '.... .... .... ....4656'];
  final List<String> paymentImageList = [
    'images/carea/ic_wallet.png',
    'images/carea/ic_paypal.png',
    'images/carea/google.png',
    'images/carea/apple.png',
    'images/carea/ic_master_card.png',
  ];

  var payment = '';

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
      backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : editTextBgColor,
      appBar: careaAppBarWidget(context, titleText: "Payment Method"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Text('Select the payment method you want to use', style: secondaryTextStyle()).paddingOnly(left: 16),
          Expanded(
            child: ListView.separated(
              controller: ScrollController(),
              itemCount: paymentList.length,
              padding: EdgeInsets.all(16),
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(bottom: 8),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                  backgroundColor: context.cardColor,
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
                child: RadioListTile(
                  visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                  title: Row(
                    children: [
                      Image.asset(paymentImageList[index], height: 30, width: 30, fit: BoxFit.cover),
                      SizedBox(width: 16),
                      Text(paymentList[index], style: boldTextStyle()),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: paymentList[index],
                  groupValue: payment,
                  activeColor: context.iconColor,
                  onChanged: (value) {
                    setState(() {
                      payment = value.toString();
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
