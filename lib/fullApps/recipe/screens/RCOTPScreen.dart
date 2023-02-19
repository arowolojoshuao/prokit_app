import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCBackComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCPreferenceScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCOTPScreen extends StatefulWidget {
  String email;
  String name;

  RCOTPScreen({required this.email, required this.name});

  @override
  State<RCOTPScreen> createState() => _RCOTPScreenState();
}

class _RCOTPScreenState extends State<RCOTPScreen> {
  var form_key = GlobalKey<FormState>();

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

  late Timer timer;
  late int counter;

  @override
  void initState() {
    nodes = [node0, node1, node2, node3, node4];
    controller = [c0, c1, c2, c3];
    startTimer();
    super.initState();
  }

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
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: Form(
        key: form_key,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.statusBarHeight + 16),
              Align(
                child: RCBackComponent(color: appStore.isDarkModeOn ? Colors.white : Colors.black, borderColor: rcSecondaryTextColor).paddingAll(16),
                alignment: Alignment.topLeft,
              ),
              rcCommonCachedNetworkImage('$BaseUrl/images/recipe/leonardo.png', height: 250),
              50.height,
              Text('OTP Verification', style: boldTextStyle(size: 40, fontFamily: GoogleFonts.playfairDisplay().fontFamily)).center(),
              Text('Please enter 4 digit code sent to you at', style: secondaryTextStyle(color: rcSecondaryTextColor)),
              Text(widget.email, style: secondaryTextStyle(color: primaryColor, weight: FontWeight.bold)),
              40.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(4, (index) {
                  return SizedBox(
                    height: 30,
                    width: 30,
                    child: AppTextField(
                      autoFocus: index == 0 ? true : false,
                      textFieldType: TextFieldType.PHONE,
                      textStyle: boldTextStyle(size: 20),
                      controller: controller[index],
                      textAlign: TextAlign.center,
                      nextFocus: nodes[index + 1],
                      textInputAction: index == 3 ? TextInputAction.done : TextInputAction.next,
                      decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor))),
                      focus: nodes[index],
                      maxLength: 1,
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
                    ),
                  );
                }),
              ),
              26.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Didn\'t get the code?', style: secondaryTextStyle(color: rcSecondaryTextColor)),
                  counter > 0
                      ? Text('Resend OTP [00:${counter.toString()}]', style: secondaryTextStyle(color: primaryColor))
                      : Text('Resend Link', style: boldTextStyle(color: primaryColor)).onTap(() {
                          startTimer();
                          setState(() {});
                        }),
                ],
              ).paddingAll(16),
              20.height,
              Container(
                child: Text('Verify', style: boldTextStyle(size: 18, color: Colors.white)).center(),
                width: context.width() - 40,
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor),
              ).onTap(() {
                if (form_key.currentState!.validate()) {
                  RCPreferenceScreen(
                    name: widget.name,
                  ).launch(context);
                }
              }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
              20.height
            ],
          ),
        ),
      ),
    );
  }
}
