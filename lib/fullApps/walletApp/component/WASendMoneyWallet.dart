import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAColors.dart';

class WASendMoneyWallet extends StatefulWidget {
  static String tag = '/WASendMoneyWallet';

  @override
  WASendMoneyWalletState createState() => WASendMoneyWalletState();
}

class WASendMoneyWalletState extends State<WASendMoneyWallet> {
  final List<int> items = [1, 2, 3, 4, 5, 6];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          DottedBorderWidget(
            radius: 30,
            color: WAPrimaryColor,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(shape: BoxShape.circle, color: WAPrimaryColor.withOpacity(0.5)),
              child: Icon(Icons.add, color: WAPrimaryColor, size: 24),
            ),
          ),
          ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Text("daa");
              }).expand()
        ],
      ),
    );
  }
}
