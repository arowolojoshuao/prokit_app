import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCSignInComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCSignUpComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';
import 'package:prokit_flutter/main.dart';

class RCSignUpScreen extends StatefulWidget {
  int selectedIndex;

  RCSignUpScreen({required this.selectedIndex});

  @override
  State<RCSignUpScreen> createState() => _RCSignUpScreenState();
}

class _RCSignUpScreenState extends State<RCSignUpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setStatusBarColor(appStore.isDarkModeOn ? Colors.black : Colors.white);
  }

  var form_key = GlobalKey<FormState>();

  FocusNode name = FocusNode();
  FocusNode password = FocusNode();
  TextEditingController emailController = TextEditingController();

  Widget getComponent() {
    if (widget.selectedIndex == 0) {
      return RCSignUpComponent();
    } else {
      return RCSignInComponent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Form(
                key: form_key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(vertical: 50),
                        decoration: BoxDecoration(borderRadius: radius(16), color: rcSecondaryColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(borderRadius: radius(16), color: widget.selectedIndex == 0 ? primaryColor : rcSecondaryColor),
                              child: Text('Sign Up', style: boldTextStyle(color: widget.selectedIndex == 0 ? Colors.white : rcSecondaryTextColor)),
                              padding: EdgeInsets.all(8),
                            ).onTap(() {
                              widget.selectedIndex = 0;
                              setState(() {});
                            }),
                            Container(
                              decoration: BoxDecoration(borderRadius: radius(16), color: widget.selectedIndex == 1 ? primaryColor : rcSecondaryColor),
                              child: Text('Sign In', style: boldTextStyle(color: widget.selectedIndex == 1 ? Colors.white : rcSecondaryTextColor)),
                              padding: EdgeInsets.all(8),
                            ).onTap(() {
                              widget.selectedIndex = 1;
                              setState(() {});
                            }),
                          ],
                        ),
                      ),
                    ),
                    getComponent(),
                    16.height,
                    Text('or', style: secondaryTextStyle(color: rcSecondaryTextColor)),
                    16.height,
                    loginOptions(),
                    20.height
                  ],
                ).paddingAll(16),
              ),
            ),
          ],
        ));
  }
}
