import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSCompleteProfileThreeScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSConstant.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

import '../../../main/utils/AppWidget.dart';

class JSCompleteProfileTwoScreen extends StatefulWidget {
  const JSCompleteProfileTwoScreen({Key? key}) : super(key: key);

  @override
  _JSCompleteProfileTwoScreenState createState() => _JSCompleteProfileTwoScreenState();
}

class _JSCompleteProfileTwoScreenState extends State<JSCompleteProfileTwoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController studyController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController timePeriodController = TextEditingController();

  FocusNode studyFocus = FocusNode();
  FocusNode universityFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode timePeriodFocus = FocusNode();

  String degreeValue = 'MBBS';

  var items = [
    'Bachelor of Law',
    'MBBS',
    'BMS/BBA/BBS',
    'ENGINEERING',
    'Bachelor of Science',
  ];

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
      key: _scaffoldkey,
      appBar: jsAppBar(context, notifications: false, message: false, bottomSheet: true, backWidget: true, homeAction: true, callBack: () {
        setState(() {});
        _scaffoldkey.currentState!.openDrawer();
      }),
      drawer: JSDrawerScreen(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.height,
                jsCompleteProfileStep(context, hideCV: false, stepSubTitle: 2),
                16.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Education", style: boldTextStyle(size: 20)),
                    16.height,
                    Text("* Required fields", style: secondaryTextStyle(size: 16)),
                    16.height,
                    Text("Degree *", style: boldTextStyle()),
                    16.height,
                    Container(
                      decoration: boxDecorationWithRoundedCorners(
                        border: Border.all(color: gray.withOpacity(0.4)),
                        backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: Container(color: Colors.transparent),
                        value: degreeValue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            degreeValue = newValue!;
                          });
                        },
                      ),
                    ),
                    16.height,
                    Text("Field of Study  *", style: boldTextStyle()),
                    Container(
                      height: textFieldHeight,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 16),
                      decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                      child: AppTextField(
                        controller: studyController,
                        focus: studyFocus,
                        nextFocus: universityFocus,
                        textFieldType: TextFieldType.NAME,
                        decoration: jsInputDecoration(),
                      ),
                    ),
                    16.height,
                    Text("College or University", style: boldTextStyle()),
                    Container(
                      height: textFieldHeight,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 16),
                      decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                      child: AppTextField(
                        controller: universityController,
                        focus: universityFocus,
                        nextFocus: cityFocus,
                        textFieldType: TextFieldType.OTHER,
                        decoration: jsInputDecoration(),
                      ),
                    ),
                    16.height,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("City- United Kingdom (", style: boldTextStyle()),
                            Text("Change", style: boldTextStyle(color: js_primaryColor)),
                            Text(") *", style: boldTextStyle()),
                          ],
                        ),
                        8.height,
                        Text("e.g London", style: secondaryTextStyle()),
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
                        nextFocus: timePeriodFocus,
                        textFieldType: TextFieldType.OTHER,
                        decoration: jsInputDecoration(),
                      ),
                    ),
                    16.height,
                    Text("Time period", style: boldTextStyle()),
                    Container(
                      height: textFieldHeight,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 16),
                      decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                      child: AppTextField(
                        controller: timePeriodController,
                        focus: timePeriodFocus,
                        textFieldType: TextFieldType.PHONE,
                        decoration: jsInputDecoration(),
                      ),
                    ),
                  ],
                ).paddingOnly(left: 16, right: 16, top: 8, bottom: 80),
              ],
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            right: 16,
            child: AppButton(
              color: js_primaryColor,
              width: context.width(),
              onTap: () {
                JSCompleteProfileThreeScreen().launch(context);
              },
              child: Text("Next", style: boldTextStyle(color: white)),
            ),
          ),
        ],
      ),
    );
  }
}
