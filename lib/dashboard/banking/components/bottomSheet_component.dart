import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/banking/utils/colors.dart';
import 'package:prokit_flutter/dashboard/banking/utils/images.dart';
import 'package:prokit_flutter/main.dart';

import '../utils/constant.dart';

class BottomSheetDetails extends StatefulWidget {
  const BottomSheetDetails({Key? key, this.title, this.subTitle, this.icon, this.amount, this.isNegativeSign}) : super(key: key);

  final String? title;
  final String? subTitle;
  final String? icon;
  final String? amount;
  final bool? isNegativeSign;

  @override
  _BottomSheetDetailsState createState() => _BottomSheetDetailsState();
}

class _BottomSheetDetailsState extends State<BottomSheetDetails> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              title: Text('${widget.title}', style: boldTextStyle(size: 18)),
              subtitle: Text('${widget.subTitle}'),
              horizontalTitleGap: 5,
              contentPadding: EdgeInsets.zero,
              leading: Padding(
                padding: EdgeInsets.only(top: 3),
                child: Image.asset(widget.icon!, height: 35, width: 35),
              ),
              trailing: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(color: dividerBankingColor, borderRadius: radius(20)),
                child: IconButton(
                  onPressed: () => finish(context),
                  icon: Icon(Icons.close, color: Colors.black, size: 22),
                ),
              ),
            ),
          ),
          Divider(thickness: 2, color: appStore.isDarkModeOn ? dividerBankingBlackColor : dividerBankingColor, height: 8),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: Text('Online transaction', style: primaryTextStyle(size: 18)),
                  subtitle: Text('2:48 PM'),
                  horizontalTitleGap: 5,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  trailing: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: widget.isNegativeSign! ? null : bankingLightGreen,
                      borderRadius: radius(6),
                    ),
                    child: Text(
                      '${widget.amount}',
                      style: boldTextStyle(color: widget.isNegativeSign! ? null : primaryBankingColor2),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(ic_attachment, height: 20, width: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    8.width,
                    Text('google.com', style: boldTextStyle()),
                  ],
                ),
                30.height,
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: radius(DEFAULT_RADIUS),
                    border: Border.all(color: appStore.isDarkModeOn ? dividerBankingBlackColor : dividerBankingColor, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Custom Support', style: boldTextStyle(size: 18)),
                      10.height,
                      Text('Are you having a problem with this transaction?', style: secondaryTextStyle()),
                      6.height,
                      Text('We\`ll help you!', style: secondaryTextStyle()),
                      15.height,
                      AppButton(
                        color: primaryBankingColor1,
                        padding: EdgeInsets.all(10),
                        onTap: () {
                          //
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email_outlined, color: Colors.white),
                            8.width,
                            Text('Message Support', style: primaryTextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
