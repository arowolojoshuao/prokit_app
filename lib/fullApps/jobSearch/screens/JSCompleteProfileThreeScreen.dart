import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSAddSkillFourScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSConstant.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

import '../../../main/utils/AppWidget.dart';

class JSCompleteProfileThreeScreen extends StatefulWidget {
  const JSCompleteProfileThreeScreen({Key? key}) : super(key: key);

  @override
  _JSCompleteProfileThreeScreenState createState() => _JSCompleteProfileThreeScreenState();
}

class _JSCompleteProfileThreeScreenState extends State<JSCompleteProfileThreeScreen> {
  String text = "Initial Text";

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController jobTitleController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  FocusNode jobTitleFocus = FocusNode();
  FocusNode companyFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode descriptionFocus = FocusNode();

  String fromMonthValue = 'January';
  String fromYearValue = '2021';

  String toMonthValue = 'February';
  String toYearValue = '2022';

  var fromMonthItems = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

  var fromYearItems = ['2018', '2019', '2020', '2021', '2022'];

  var toMonthItems = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

  var toYearItems = ['2018', '2019', '2020', '2021', '2022'];

  // value set to false
  bool _value = false;

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
      floatingActionButton: AppButton(
        color: js_primaryColor,
        width: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        onTap: () {
          JSAddSkillFourScreen().launch(context);
        },
        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 0,
        child: Text("Save", style: boldTextStyle(color: white)),
      ),
      drawer: JSDrawerScreen(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.height,
                jsCompleteProfileStep(context, hideCV: false, stepSubTitle: 3),
                16.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Work experience", style: boldTextStyle(size: 20)),
                    16.height,
                    Text("* Required fields", style: secondaryTextStyle(size: 16)),
                    16.height,
                    Text("Job Title *", style: boldTextStyle()),
                    Container(
                      height: textFieldHeight,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 16),
                      decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                      child: AppTextField(
                        controller: jobTitleController,
                        focus: jobTitleFocus,
                        nextFocus: companyFocus,
                        textFieldType: TextFieldType.OTHER,
                        decoration: jsInputDecoration(),
                      ),
                    ),
                    16.height,
                    Text("Company", style: boldTextStyle()),
                    Container(
                      height: textFieldHeight,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 16),
                      decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                      child: AppTextField(
                        controller: companyController,
                        focus: companyFocus,
                        nextFocus: cityFocus,
                        textFieldType: TextFieldType.NAME,
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
                        nextFocus: descriptionFocus,
                        textFieldType: TextFieldType.OTHER,
                        decoration: jsInputDecoration(),
                      ),
                    ),
                    16.height,
                    Text("Time period", style: boldTextStyle()),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text("I currently work here", style: primaryTextStyle()),
                      value: _value,
                      activeColor: js_primaryColor,
                      dense: true,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _value = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    16.height,
                    Text("From", style: boldTextStyle()),
                    8.height,
                    Row(
                      children: [
                        Container(
                          width: context.width() * 0.6,
                          decoration: boxDecorationWithRoundedCorners(
                            border: Border.all(color: gray.withOpacity(0.4)),
                            backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(color: Colors.transparent),
                            value: fromMonthValue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: fromMonthItems.map((String fromMonthItems) {
                              return DropdownMenuItem(
                                value: fromMonthItems,
                                child: Text(fromMonthItems),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                fromMonthValue = newValue!;
                              });
                            },
                          ),
                        ),
                        8.width,
                        Container(
                          width: context.width() * 0.26,
                          decoration: boxDecorationWithRoundedCorners(
                            border: Border.all(color: gray.withOpacity(0.4)),
                            backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(color: Colors.transparent),
                            value: fromYearValue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: fromYearItems.map((String fromYearItems) {
                              return DropdownMenuItem(
                                value: fromYearItems,
                                child: Text(fromYearItems),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                fromYearValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    16.height,
                    Text("To", style: boldTextStyle()),
                    8.height,
                    Row(
                      children: [
                        Container(
                          width: context.width() * 0.6,
                          decoration: boxDecorationWithRoundedCorners(
                            border: Border.all(color: gray.withOpacity(0.4)),
                            backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(color: Colors.transparent),
                            value: toMonthValue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: toMonthItems.map((String toMonthItems) {
                              return DropdownMenuItem(
                                value: toMonthItems,
                                child: Text(toMonthItems),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                toMonthValue = newValue!;
                              });
                            },
                          ),
                        ),
                        8.width,
                        Container(
                          width: context.width() * 0.26,
                          decoration: boxDecorationWithRoundedCorners(
                            border: Border.all(color: gray.withOpacity(0.4)),
                            backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(color: Colors.transparent),
                            value: toYearValue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: toYearItems.map((String toYearItems) {
                              return DropdownMenuItem(
                                value: toYearItems,
                                child: Text(toYearItems),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                toYearValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    16.height,
                    Text("Description (Recommended)", style: boldTextStyle()),
                    8.height,
                    Text(
                        "Describe your job tasks about your achievement, and show  off what skill set your apart. This information will help prove insight into your background and showcase "
                        "compatibility as potential employee.",
                        style: secondaryTextStyle()),
                    16.height,
                    Container(
                      height: textFieldHeight,
                      alignment: Alignment.center,
                      decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                      child: AppTextField(
                        controller: descriptionController,
                        focus: descriptionFocus,
                        textFieldType: TextFieldType.OTHER,
                        decoration: jsInputDecoration(),
                      ),
                    ),
                  ],
                ).paddingOnly(left: 16, right: 16, top: 8, bottom: 85),
              ],
            ),
          ),
          /*   Positioned(
            left: 16,
            bottom: 16,
            child: AppButton(
              color: js_primaryColor,
              width: 100,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              onTap: () {
                JSAddSkillFourScreen().launch(context);
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              elevation: 0,
              child: Text("Save", style: boldTextStyle(color: white)),
            ),
          ),*/
        ],
      ),
    );
  }
}
