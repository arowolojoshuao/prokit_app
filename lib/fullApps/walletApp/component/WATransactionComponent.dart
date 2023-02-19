import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';

import '../../../main.dart';

class WATransactionComponent extends StatefulWidget {
  static String tag = '/WATransactionComponent';

  final WATransactionModel? transactionModel;

  WATransactionComponent({this.transactionModel});

  @override
  WATransactionComponentState createState() => WATransactionComponentState();
}

class WATransactionComponentState extends State<WATransactionComponent> {
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
      padding: EdgeInsets.only(left: 16, right: 16),
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: boxDecorationRoundedWithShadow(16, backgroundColor: context.cardColor),
      child: ListTile(
        tileColor: Colors.red,
        enabled: true,
        contentPadding: EdgeInsets.zero,
        leading: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: boxDecorationWithRoundedCorners(
            boxShape: BoxShape.circle,
            backgroundColor: widget.transactionModel!.color!.withOpacity(0.1),
          ),
          child: ImageIcon(
            AssetImage('${widget.transactionModel!.image!}'),
            size: 24,
            color: widget.transactionModel!.color!,
          ),
        ),
        title: RichTextWidget(
          list: [
            TextSpan(
              text: '${widget.transactionModel!.title!}',
              style: primaryTextStyle(color: appStore.isDarkModeOn ? white : Colors.black54, size: 14),
            ),
            TextSpan(
              text: '\t${widget.transactionModel!.name!}',
              style: boldTextStyle(size: 14, color: appStore.isDarkModeOn ? white : black),
            ),
          ],
          maxLines: 1,
        ),
        subtitle: Text(
          '${widget.transactionModel!.time!}',
          style: primaryTextStyle(color: appStore.isDarkModeOn ? white : Colors.black54, size: 14),
        ),
        trailing: Container(
          width: 80,
          height: 35,
          alignment: Alignment.center,
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: BorderRadius.circular(30),
            backgroundColor: widget.transactionModel!.color!.withOpacity(0.1),
          ),
          child: Text(
            '${widget.transactionModel!.balance!}',
            maxLines: 1,
            style: boldTextStyle(size: 12, color: widget.transactionModel!.color!),
          ),
        ),
      ),
    );
  }
}
