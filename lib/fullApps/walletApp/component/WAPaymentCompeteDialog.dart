import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/screen/WADashboardScreen.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAColors.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAWidgets.dart';

class WAPaymentCompletedDialog extends StatefulWidget {
  static String tag = '/WAPaymentCompletedDialog';

  @override
  WAPaymentCompletedDialogState createState() => WAPaymentCompletedDialogState();
}

class WAPaymentCompletedDialogState extends State<WAPaymentCompletedDialog> {
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        waCommonCachedNetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR9aCWk6ps_ia7PUmhPUZl7eC7uGfxiXdumsuzKUNqZ5NSJDwZATiJyKk0bYrupophpTU&usqp=CAU',
            height: 200, width: 200, fit: BoxFit.fill),
        16.height,
        Text('Done!', style: secondaryTextStyle()),
        16.height,
        Text('Payment Completed', style: boldTextStyle(size: 22)),
        8.height,
        createRichText(list: [
          TextSpan(text: "You have to paid \u00241250 to", style: secondaryTextStyle()),
          TextSpan(text: " Eco Water", style: boldTextStyle()),
        ], textAlign: TextAlign.center),
        8.height,
        Text('Account no endings ***123455', style: secondaryTextStyle()),
        30.height,
        AppButton(
          color: WAPrimaryColor,
          width: 180,
          height: 50,
          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          text: "Back to Home",
          onTap: () {
            WADashboardScreen().launch(context, isNewTask: true);
          },
          textStyle: boldTextStyle(color: Colors.white),
        ),
        16.height,
      ],
    );
  }
}
