// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:prokit_flutter/fullApps/carea/commons/colors.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

import '../store/logicprovider.dart';
import 'create_new_pass_screen.dart';

class ForgotPassOtp extends StatefulWidget {
  const ForgotPassOtp({Key? key}) : super(key: key);

  @override
  State<ForgotPassOtp> createState() => _ForgotPassOtpState();
}

class _ForgotPassOtpState extends State<ForgotPassOtp> {
  LogicProvider passOb = LogicProvider();

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

  final _formStateKey = GlobalKey<FormState>();

  @override
  void initState() {
    nodes = [node0, node1, node2, node3, node4];
    controller = [c0, c1, c2, c3];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Timer.periodic(
      Duration(seconds: 1),
      (val) {
        if (passOb.conter != 61) {
          passOb.conter = val.tick;
        } else if (val.tick >= 61) {
          val.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: careaAppBarWidget(context, titleText: "Forgot Password"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            color: context.scaffoldBackgroundColor,
            child: Form(
              key: _formStateKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: Text(textAlign: TextAlign.center, 'Code has been send to 094*******9', style: primaryTextStyle()),
                  ),
                  SizedBox(height: 42),
                  Wrap(
                    spacing: 24,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        height: 68,
                        width: 60,
                        child: AppTextField(
                          autoFocus: index == 0 ? true : false,
                          controller: controller[index],
                          nextFocus: nodes[index + 1],
                          focus: nodes[index],
                          maxLength: 1,
                          textInputAction: index == 3 ? TextInputAction.done : TextInputAction.next,
                          textAlign: TextAlign.center,
                          textFieldType: TextFieldType.PHONE,
                          textStyle: boldTextStyle(size: 24),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: radius(defaultRadius),
                              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: radius(defaultRadius),
                              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                            ),
                            counterText: '',
                            fillColor: appStore.isDarkModeOn ? cardDarkColor : editTextBgColor,
                            filled: true,
                          ),
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
                  SizedBox(height: 40),
                  Observer(
                    builder: (context) {
                      if (passOb.conter == 61) {
                        return GestureDetector(
                          onTap: () {
                            passOb.conter == 0;
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Please try again', style: primaryTextStyle()),
                            //child: text(textAlign: TextAlign.center, txt: 'Please try again', color: Colors.black, size: 16),
                          ),
                        );
                      }
                      return Align(
                        alignment: Alignment.center,
                        child: Text('Resend code in ${passOb.conter} seconds', style: primaryTextStyle()),
                      );
                    },
                  ),
                  SizedBox(height: 70),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        if (_formStateKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateNewPassScreen()),
                          );
                        }
                      },
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: appStore.isDarkModeOn ? cardDarkColor : Colors.black,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Text('Verify', style: boldTextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
