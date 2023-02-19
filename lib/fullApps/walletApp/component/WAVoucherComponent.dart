import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAColors.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAWidgets.dart';
import 'package:prokit_flutter/main.dart';

class WAVoucherComponent extends StatefulWidget {
  static String tag = '/WAVoucherComponent';

  final WAVoucherModel? voucherModel;

  WAVoucherComponent({this.voucherModel});

  @override
  WAVoucherComponentState createState() => WAVoucherComponentState();
}

class WAVoucherComponentState extends State<WAVoucherComponent> {
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
      padding: EdgeInsets.all(16),
      decoration: boxDecorationRoundedWithShadow(16, backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white),
      alignment: AlignmentDirectional.center,
      width: context.width() * 0.40,
      child: Column(
        children: [
          waCommonCachedNetworkImage(
            widget.voucherModel!.image!,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(12),
          8.height,
          Text('${widget.voucherModel!.discountText!}', style: boldTextStyle(), maxLines: 1),
          Text('${widget.voucherModel!.title!}', style: secondaryTextStyle(), maxLines: 1),
          8.height,
          Text('${widget.voucherModel!.expireTime!}', style: boldTextStyle(size: 14, color: WAPrimaryColor), maxLines: 1),
        ],
      ),
    );
  }
}
