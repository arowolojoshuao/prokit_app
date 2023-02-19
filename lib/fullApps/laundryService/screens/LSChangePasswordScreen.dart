import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSChangePasswordScreen extends StatefulWidget {
  static String tag = '/LSChangePasswordScreen';

  @override
  LSChangePasswordScreenState createState() => LSChangePasswordScreenState();
}

class LSChangePasswordScreenState extends State<LSChangePasswordScreen> {
  TextEditingController oldPassCont = TextEditingController();
  TextEditingController newPassCont = TextEditingController();
  TextEditingController cPassCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.microseconds.delay;
    setStatusBarColor(appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: BackButton(onPressed: () {
                  finish(context);
                }),
              ),
              commonCacheImageWidget(LSLogo, 120, fit: BoxFit.cover).center(),
              16.height,
              Container(
                decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
                width: context.width(),
                margin: EdgeInsets.only(left: 16, right: 16),
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    AppTextField(
                      controller: oldPassCont,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(hintText: 'Please enter old Password'),
                    ),
                    16.height,
                    AppTextField(
                      controller: newPassCont,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(hintText: 'Please enter new Password'),
                    ),
                    16.height,
                    AppTextField(
                      controller: cPassCont,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(hintText: 'Please enter confirm Password'),
                    ),
                    16.height,
                  ],
                ),
              ),
              24.height,
              AppButton(
                text: 'Change Password',
                textColor: white,
                width: context.width(),
                color: LSColorPrimary,
                onTap: () {
                  //
                },
              ).paddingOnly(left: 16, right: 16)
            ],
          ),
        ),
      ),
    );
  }
}
