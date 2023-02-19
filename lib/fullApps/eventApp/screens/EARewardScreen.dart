import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';

class EARewardScreen extends StatefulWidget {
  const EARewardScreen({Key? key}) : super(key: key);

  @override
  _EARewardScreenState createState() => _EARewardScreenState();
}

class _EARewardScreenState extends State<EARewardScreen> {
  TextEditingController applyController = TextEditingController();
  String dec = "Share your Discount code with your friends get \$1.00 for every new user who introduce your code in their profile.";
  String des2 = "They will get the \$4.00 to spend in Evens. whet their First \$ in events. without  discount coupon. you will get \$4.0 up to a maximum \$35.00.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: context.height() * 0.40,
              floating: false,
              pinned: true,
              centerTitle: true,
              title: Text("Reward", style: boldTextStyle(color: white)),
              backgroundColor: innerBoxIsScrolled ? primaryColor1 : transparentColor,
              forceElevated: innerBoxIsScrolled,
              iconTheme: IconThemeData(color: white),
              automaticallyImplyLeading: true,
              flexibleSpace: FlexibleSpaceBar(
                background: RewardText(),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              8.height,
              Text('Share your Discount code?', style: primaryTextStyle()),
              12.height,
              commonButton(width: context.width() * 0.5, btnText: "AMCDSE"),
              30.height,
              Text('Tap here to copy and share ', style: secondaryTextStyle()),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('how does it work?', style: boldTextStyle()),
                    10.height,
                    Text(dec, style: secondaryTextStyle()),
                    18.height,
                    Text(des2, style: secondaryTextStyle()),
                  ],
                ),
              ).paddingOnly(top: 40)
            ],
          ),
        ),
      ),
    );
  }
}

class RewardText extends StatefulWidget {
  const RewardText({Key? key}) : super(key: key);

  @override
  _RewardTextState createState() => _RewardTextState();
}

class _RewardTextState extends State<RewardText> {
  TextEditingController applyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      //overflow: Overflow.visible,
      children: [
        Container(
          height: context.height() * 0.37,
          decoration: boxDecorationWithShadow(
            gradient: LinearGradient(
              colors: [
                primaryColor2,
                primaryColor1,
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Your Credit balance is', style: secondaryTextStyle(color: white, size: 16)),
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$', style: boldTextStyle(color: white)),
                Text('15', style: boldTextStyle(size: 60, color: white)),
              ],
            ),
          ],
        ).paddingTop(100),
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
            child: TextFormField(
              controller: applyController,
              style: primaryTextStyle(),
              decoration: InputDecoration(
                hintText: "Enter Discount code",
                hintStyle: primaryTextStyle(),
                contentPadding: EdgeInsets.only(left: 16, top: 8),
                border: InputBorder.none,
                suffixIcon: Text('Apply', style: primaryTextStyle(color: primaryColor1)).onTap(
                  () {
                    applyController.clear();
                  },
                ).paddingOnly(top: 12, right: 8),
              ),
            ),
          ).paddingSymmetric(horizontal: 22),
        ).paddingTop(200),
      ],
    );
  }
}
