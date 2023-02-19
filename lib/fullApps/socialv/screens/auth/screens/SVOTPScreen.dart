import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/auth/screens/SVResetPasswordScreen.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVColors.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';

class SVOTPScreen extends StatefulWidget {
  const SVOTPScreen({Key? key}) : super(key: key);

  @override
  State<SVOTPScreen> createState() => _SVOTPScreenState();
}

class _SVOTPScreenState extends State<SVOTPScreen> {
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
    startTimer();
    super.initState();
  }

  late Timer timer;
  late int counter;

  void startTimer() {
    counter = 59;
    timer = new Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (counter == 0) {
        t.cancel();
        setState(() {});
      } else {
        counter--;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: svGetScaffoldColor(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: context.statusBarHeight + 80),
            Text('OTP Verification', style: boldTextStyle(size: 20)),
            16.height,
            svRobotoText(text: 'We Have Sent A 4 Digit Code To Your \n Email Address'),
            48.height,
            Wrap(
              spacing: 24,
              children: List.generate(4, (index) {
                return Container(
                  height: 68,
                  width: 60,
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: radius(8),
                    border: Border.all(color: SVAppBorderColor),
                  ),
                  child: AppTextField(
                    autoFocus: index == 0 ? true : false,
                    controller: controller[index],
                    nextFocus: nodes[index + 1],
                    focus: nodes[index],
                    maxLength: 1,
                    textInputAction: index == 3 ? TextInputAction.done : TextInputAction.next,
                    textAlign: TextAlign.center,
                    textFieldType: TextFieldType.PHONE,
                    textStyle: boldTextStyle(size: 24, color: svGetBodyColor()),
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
            24.height,
            Text('00:${counter.toString()}', style: boldTextStyle(size: 14, color: Color(0xFF3AB74E))),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                svRobotoText(text: 'Don\'t Receive The OTP?'),
                2.width,
                svRobotoText(
                  text: 'RESEND OTP',
                  color: SVAppColorPrimary,
                  onTap: () {
                    startTimer();
                    setState(() {});
                  },
                ),
              ],
            ),
            40.height,
            svAppButton(
              context: context,
              text: 'VERIFY NOW',
              onTap: () {
                SVResetPasswordScreen().launch(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
