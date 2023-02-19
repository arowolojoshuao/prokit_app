import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLCountryPIckerComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLAuthenticationScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MLForgetPasswordScreen extends StatefulWidget {
  static String tag = '/MLForgetPasswordScreen';

  @override
  _MLForgetPasswordScreenState createState() => _MLForgetPasswordScreenState();
}

class _MLForgetPasswordScreenState extends State<MLForgetPasswordScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(mlPrimaryColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24.0),
            decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  80.height,
                  Text(mlForgetPassword!, style: boldTextStyle(size: 24)),
                  8.height,
                  Text(mlForget_password_msg!, style: secondaryTextStyle()),
                  16.height,
                  Row(
                    children: [
                      MLCountryPickerComponent(),
                      16.width,
                      AppTextField(
                        textFieldType: TextFieldType.PHONE,
                        decoration: InputDecoration(
                          labelText: mlPhoneNumber!,
                          labelStyle: secondaryTextStyle(size: 16),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: mlColorLightGrey.withOpacity(0.2)),
                          ),
                        ),
                      ).expand(),
                    ],
                  ),
                  16.height,
                  AppButton(
                    width: double.infinity,
                    color: mlPrimaryColor,
                    onTap: () => MLAuthenticationScreen().launch(context),
                    child: Text('Send', style: boldTextStyle(color: white)),
                  ),
                ],
              ).paddingOnly(right: 16.0, left: 16.0),
            ),
          ),
          Positioned(
            top: 30,
            child: mlBackToPrevious(context, appStore.isDarkModeOn ? white : black),
          ),
        ],
      ),
    );
  }
}
