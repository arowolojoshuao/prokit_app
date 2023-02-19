import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WASendViaComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';
import 'package:prokit_flutter/fullApps/walletApp/screen/WADashboardScreen.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAColors.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAMultiplePointedEdgeClipper.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAMySeperator.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class WATopUpReceiptScreen extends StatefulWidget {
  static String tag = '/WATopUpReceiptScreen';

  final WACardModel? card;

  WATopUpReceiptScreen({this.card});

  @override
  WATopUpReceiptScreenState createState() => WATopUpReceiptScreenState();
}

class WATopUpReceiptScreenState extends State<WATopUpReceiptScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Top Up Receipt', style: boldTextStyle(color: appStore.isDarkModeOn ? white : Colors.black, size: 20)),
          centerTitle: true,
          elevation: 0.0,
          brightness: Brightness.dark,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          height: context.height(),
          //color: context.cardColor,
          padding: EdgeInsets.only(top: 60, bottom: 16),
          width: context.width(),
          child: SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                ClipPath(
                  clipper: MultiplePointedEdgeClipper(),
                  child: Container(
                    decoration: boxDecorationRoundedWithShadow(16, backgroundColor: context.cardColor, shadowColor: Colors.grey.withOpacity(0.3)),
                    margin: EdgeInsets.only(left: 16, right: 16, top: 100),
                    padding: EdgeInsets.only(top: 110, left: 16, right: 16, bottom: 50),
                    width: context.width(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Done!', style: secondaryTextStyle()).center(),
                        4.height,
                        Text('Top up Completed', style: boldTextStyle(size: 18)).center(),
                        8.height,
                        Text('Total Top up Amount', style: secondaryTextStyle()).center(),
                        4.height,
                        Text('\$500.00', style: boldTextStyle(size: 18)).center(),
                        16.height,
                        WAMySeparator(color: Colors.grey.withOpacity(0.2), height: 2),
                        16.height,
                        Text('Top Up Destination', style: secondaryTextStyle()),
                        16.height,
                        Container(
                          padding: EdgeInsets.all(10),
                          width: context.width(),
                          decoration: boxDecorationRoundedWithShadow(16, backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                          child: WASendViaComponent(item: widget.card),
                        ),
                        16.height,
                        AppButton(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                          text: "Back to home",
                          color: WAPrimaryColor,
                          textColor: Colors.white,
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          onTap: () {
                            WADashboardScreen().launch(context, isNewTask: true);
                          },
                        ).center(),
                        16.height,
                        Text('Download Receipt', style: boldTextStyle(color: WAPrimaryColor, size: 14)).center(),
                      ],
                    ),
                  ),
                ),
                Image.network('$BaseUrl/images/walletApp/wa_credit_card_bg.png', height: 200, width: 200, fit: BoxFit.cover),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
