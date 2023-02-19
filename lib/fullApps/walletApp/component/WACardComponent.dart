import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';
import 'package:prokit_flutter/fullApps/walletApp/screen/WASendMoneyViaLoopScreen.dart';

class WACardComponent extends StatefulWidget {
  static String tag = '/WACardComponent';
  final WACardModel? cardModel;

  WACardComponent({this.cardModel});

  @override
  WACardComponentState createState() => WACardComponentState();
}

class WACardComponentState extends State<WACardComponent> {
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
    return Container(
      width: 300,
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 8),
      decoration: boxDecorationRoundedWithShadow(
        30,
        backgroundColor: widget.cardModel!.color!,
        blurRadius: 10.0,
        spreadRadius: 4.0,
        shadowColor: widget.cardModel!.color!.withAlpha(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ImageIcon(
              AssetImage('images/walletApp/wa_visa.png'),
              size: 50,
              color: Colors.white,
            ),
          ),
          Text('Balance', style: secondaryTextStyle(color: Colors.white60)),
          8.height,
          Text('${widget.cardModel!.balance!}', style: boldTextStyle(color: Colors.white, size: 18)),
          30.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.cardModel!.cardNumber!}', style: primaryTextStyle(color: Colors.white70)),
              Text('${widget.cardModel!.date!}', style: primaryTextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    ).onTap(() {
      WASendMoneyViaLoopScreen().launch(context);
    });
  }
}
