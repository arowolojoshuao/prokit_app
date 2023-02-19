import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSCompleteProfileTwoScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSConstant.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

import '../../../main/utils/AppWidget.dart';

class JSCompleteProfileOneScreen extends StatefulWidget {
  const JSCompleteProfileOneScreen({Key? key}) : super(key: key);

  @override
  _JSCompleteProfileOneScreenState createState() => _JSCompleteProfileOneScreenState();
}

class _JSCompleteProfileOneScreenState extends State<JSCompleteProfileOneScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TextEditingController fNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();

  FocusNode fNameFocus = FocusNode();
  FocusNode surnameFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode phoneNumFocus = FocusNode();

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
    return Scaffold(
      key: scaffoldKey,
      appBar: jsAppBar(context, notifications: false, message: false, bottomSheet: true, backWidget: true, homeAction: true, callBack: () {
        setState(() {});
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: JSDrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.height,
            jsCompleteProfileStep(context, hideCV: true, stepSubTitle: 1),
            16.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Profile", style: boldTextStyle(size: 20)),
                28.height,
                Text("* Required fields", style: secondaryTextStyle(size: 16)),
                16.height,
                Text("First Name *", style: boldTextStyle()),
                Container(
                  height: textFieldHeight,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 16),
                  decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                  child: AppTextField(
                    controller: fNameController,
                    focus: fNameFocus,
                    nextFocus: surnameFocus,
                    textFieldType: TextFieldType.NAME,
                    keyboardType: TextInputType.text,
                    decoration: jsInputDecoration(),
                  ),
                ),
                16.height,
                Text("Surname *", style: boldTextStyle()),
                Container(
                  height: textFieldHeight,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 16),
                  decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                  child: AppTextField(
                    controller: surnameController,
                    focus: surnameFocus,
                    nextFocus: addressFocus,
                    textFieldType: TextFieldType.NAME,
                    decoration: jsInputDecoration(),
                  ),
                ),
                16.height,
                Row(
                  children: [
                    Text("Street Address", style: boldTextStyle()),
                    8.width,
                    Icon(Icons.info_outline, color: js_primaryColor, size: 18),
                  ],
                ),
                Container(
                  height: textFieldHeight,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 16),
                  decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                  child: AppTextField(
                    controller: addressController,
                    focus: addressFocus,
                    nextFocus: cityFocus,
                    textFieldType: TextFieldType.OTHER,
                    decoration: jsInputDecoration(),
                  ),
                ),
                16.height,
                Row(
                  children: [
                    Text("City- United Kingdom (", style: boldTextStyle()),
                    Text("Change", style: boldTextStyle(color: js_primaryColor)),
                    Text(") *", style: boldTextStyle()),
                  ],
                ),
                Container(
                  height: textFieldHeight,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 16),
                  decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                  child: AppTextField(
                    controller: cityController,
                    focus: cityFocus,
                    nextFocus: phoneNumFocus,
                    textFieldType: TextFieldType.OTHER,
                    decoration: jsInputDecoration(),
                  ),
                ),
                16.height,
                Text("Contact Information", style: boldTextStyle()),
                Container(
                  height: textFieldHeight,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 16),
                  decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                  child: AppTextField(
                    controller: phoneNumController,
                    focus: phoneNumFocus,
                    textFieldType: TextFieldType.PHONE,
                    decoration: jsInputDecoration(),
                  ),
                ),
                24.height,
                AppButton(
                  color: js_primaryColor,
                  width: context.width(),
                  onTap: () {
                    JSCompleteProfileTwoScreen().launch(context);
                  },
                  child: Text("Next", style: boldTextStyle(color: white)),
                ),
              ],
            ).paddingOnly(left: 16, right: 16, top: 8, bottom: 24),
          ],
        ),
      ),
    );
  }
}
