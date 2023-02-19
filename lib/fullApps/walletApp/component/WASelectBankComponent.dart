import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WADataGenerator.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class WASelectBankComponent extends StatefulWidget {
  static String tag = '/WASelectBankComponent';

  @override
  WASelectBankComponentState createState() => WASelectBankComponentState();
}

class WASelectBankComponentState extends State<WASelectBankComponent> {
  List<WABillPayModel> selectBankList = waSelectBillList();

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
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 16,
        children: selectBankList.map((cardItem) {
          int index = selectBankList.indexOf(cardItem);
          WABillPayModel mData = selectBankList[index];
          return Container(
            height: 100,
            width: 140,
            padding: EdgeInsets.all(16),
            decoration: boxDecorationRoundedWithShadow(12, backgroundColor: context.cardColor),
            child: Column(
              children: [
                commonCacheImageWidget(mData.image!, 40, width: 40, fit: BoxFit.fill),
                8.height,
                Text(mData.title!, style: boldTextStyle(size: 12)),
              ],
            ),
          );
        }).toList(),
      ).paddingAll(16),
    );
  }
}
