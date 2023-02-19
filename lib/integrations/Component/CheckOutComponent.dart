import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/models/TestCardModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class CheckOutComponent extends StatefulWidget {
  final String? currency;
  final String? cardNetwork;
  final String? cartNumber;
  final String? cardCVV;
  final String? expiryDate;

  final String? pin;
  final String? otp;
  final String? warning;

  CheckOutComponent({this.currency, this.cardNetwork, this.cartNumber, this.cardCVV, this.expiryDate, this.warning, this.pin, this.otp});

  @override
  CheckOutComponentState createState() => CheckOutComponentState();
}

class CheckOutComponentState extends State<CheckOutComponent> {
  PageController controller = PageController(initialPage: 0);
  String? payCurrency;

  List<String> cardList = ['images/integrations/img/card1.jpg', 'images/integrations/img/card2.png'];
  List<TestCard> testCard = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    payCurrency = widget.currency != null ? widget.currency : "\$";

    testCard = [
      TestCard(cardTitle: 'Card Network : ', cardValue: widget.cardNetwork.validate()),
      TestCard(cardTitle: 'Card Number : ', cardValue: widget.cartNumber.validate()),
      TestCard(cardTitle: 'CVV : ', cardValue: widget.cardCVV.validate()),
      TestCard(cardTitle: 'Expiry Date : ', cardValue: widget.expiryDate.validate()),
      TestCard(cardTitle: 'OTP : ', cardValue: widget.pin.validate()),
      TestCard(cardTitle: 'Pin : ', cardValue: widget.otp.validate()),
    ];
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('images/integrations/img/credit_card.png', width: context.width(), height: 200, fit: BoxFit.fill).cornerRadiusWithClipRRect(12),
        16.height,
        Divider(thickness: 1.5, color: appDividerColor),
        8.height,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Floral Dress', style: boldTextStyle()),
                4.height,
                Text('Size:M Color:"Red"', style: secondaryTextStyle(size: 12)),
              ],
            ),
            Text(payCurrency.validate() + ' 200.00', style: boldTextStyle()),
          ],
        ),
        12.height,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mom Jeans', style: boldTextStyle()),
                4.height,
                Text('Size:M Color:"Blue"', style: secondaryTextStyle(size: 12)),
              ],
            ),
            Text(payCurrency.validate() + ' 250.00', style: boldTextStyle()),
          ],
        ),
        8.height,
        Divider(thickness: 1.5, color: appDividerColor),
        8.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub-total', style: primaryTextStyle(size: 14)),
            Text('450.00', style: primaryTextStyle(size: 14)),
          ],
        ),
        8.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax', style: primaryTextStyle(size: 14)),
            Text('50.00', style: primaryTextStyle(size: 14)),
          ],
        ),
        16.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: boldTextStyle()),
            Text(payCurrency.validate() + ' 500.00', style: boldTextStyle()),
          ],
        ),
        24.height,
        Container(
          width: context.width(),
          padding: EdgeInsets.all(16),
          decoration: boxDecorationWithShadow(borderRadius: radius(8), backgroundColor: context.scaffoldBackgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.cartNumber.validate().isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.height,
                    Text('Test Card for Domestic Payment', style: primaryTextStyle(size: 14)),
                    Divider(thickness: 1.5, color: appDividerColor),
                    Column(
                      children: testCard.map((e) {
                        return e.cardValue.validate().isNotEmpty
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e.cardTitle.validate(), style: primaryTextStyle(size: 14)).expand(),
                                  Text(e.cardValue.validate(), style: boldTextStyle(), textAlign: TextAlign.end).expand(),
                                ],
                              ).paddingBottom(4)
                            : SizedBox();
                      }).toList(),
                    ),
                    8.height,
                  ],
                ),
              if (widget.warning.validate().isNotEmpty) Text('Note : ' + widget.warning.validate(), style: primaryTextStyle(color: Colors.red, size: 12))
            ],
          ),
        ),
        16.height,
      ],
    ).paddingAll(16);
  }
}
