import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBUpdateInfoScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBVerifyNumberScreen extends StatefulWidget {
  final String phoneNo;

  JCBVerifyNumberScreen({required this.phoneNo});

  @override
  State<JCBVerifyNumberScreen> createState() => _JCBVerifyNumberScreenState();
}

class _JCBVerifyNumberScreenState extends State<JCBVerifyNumberScreen> {
  FocusNode node0 = FocusNode();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();

  TextEditingController c0 = TextEditingController();
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();

  List<FocusNode> nodes = [];
  List<TextEditingController> controller = [];

  @override
  void initState() {
    nodes = [node0, node1, node2, node3, node4];
    controller = [c0, c1, c2, c3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: jcbBackWidget(context),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Verify phone \nnumber', style: boldTextStyle(size: 40, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900)),
            20.height,
            RichText(
              text: TextSpan(
                text: 'Check your SMS messages. We\'ve sent you the pin at ',
                style: boldTextStyle(),
                children: <TextSpan>[
                  TextSpan(text: widget.phoneNo, style: boldTextStyle(size: 14, color: jcbGreyColor)),
                ],
              ),
            ),
            30.height,
            Wrap(
              spacing: 24,
              children: List.generate(4, (index) {
                return Container(
                  height: 68,
                  width: 60,
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: radius(jcbButtonRadius),
                    border: Border.all(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
                  ),
                  child: AppTextField(
                    autoFocus: false,
                    controller: controller[index],
                    nextFocus: nodes[index + 1],
                    focus: nodes[index],
                    maxLength: 1,
                    textInputAction: index == 3 ? TextInputAction.done : TextInputAction.next,
                    textAlign: TextAlign.center,
                    textFieldType: TextFieldType.PHONE,
                    textStyle: boldTextStyle(size: 24, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor),
                    decoration: InputDecoration(border: InputBorder.none, counterText: ''),
                    validator: (no) {
                      if (no == null || no.isEmpty) {
                        return 'Enter';
                      }
                      return null;
                    },
                    onChanged: (c) {
                      if (c.isEmpty) {
                        if (index == 0) return;
                        nodes[index].unfocus();
                        nodes[index - 1].requestFocus();
                      } else {
                        nodes[index + 1].requestFocus();
                        controller[index].text = c;
                        setState(() {});
                      }
                    },
                  ).center(),
                );
              }),
            ).center(),
            30.height,
            RichText(
              text: TextSpan(
                text: 'Didn\'t receive SMS? ',
                style: boldTextStyle(),
                children: <TextSpan>[
                  TextSpan(text: 'Resend Code', style: boldTextStyle(size: 14, color: jcbPrimaryColor)),
                ],
              ),
            ),
            30.height,
            AppButton(
              width: context.width() - 32,
              child: Text('Verify'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
              onTap: () {
                JCBUpdateInfoScreen().launch(context);
              },
              color: jcbPrimaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
