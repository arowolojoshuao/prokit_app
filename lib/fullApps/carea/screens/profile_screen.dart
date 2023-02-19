import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/app_theme.dart';
import 'package:prokit_flutter/fullApps/carea/commons/colors.dart';
import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/model/user_info.dart';
import 'package:prokit_flutter/fullApps/carea/store/profile_ob.dart';
import 'package:prokit_flutter/main.dart';

import 'create_pin_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, this.isAppbarNeeded, this.appBar}) : super(key: key);
  bool? isAppbarNeeded;
  final PreferredSizeWidget? appBar;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  XFile? pickedFile;
  ProfileOb pr_ob = ProfileOb();
  UserInfo? _userInfo;
  String? imagePath;
  String? UserImage;
  String dropdownValue = 'Male';

  TextEditingController userNameController = TextEditingController();
  TextEditingController userNickNameController = TextEditingController();
  TextEditingController userDateOfBirthController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userContactNumberController = TextEditingController();
  TextEditingController userGenderController = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();

  DateTime? selectedDate;

  void selectDateAndTime(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(3000),
      builder: (_, child) {
        return Theme(
          data: appStore.isDarkModeOn ? ThemeData.dark() : AppThemeData.lightTheme,
          child: child!,
        );
      },
    ).then((date) async {
      if (date != null) {
        selectedDate = date;
        userDateOfBirthController.text = "${formatDate(selectedDate.toString(), format: DATE_FORMAT_2)}";
      }
    }).catchError((e) {
      toast(e.toString());
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: (widget.isAppbarNeeded == null) ? careaAppBarWidget(context, titleText: "Fill Your Profile") : widget.appBar,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Observer(
                        builder: (context) => GestureDetector(
                          onTap: () async {
                            if (UserImage != null) {
                              imagePath = UserImage;
                            }
                            try {
                              await pr_ob.pickImage();
                              imagePath = pr_ob.pickedFile!.path;
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: (pr_ob.pickedFile != null)
                              ? Image.file(
                                  File(pr_ob.pickedFile!.path),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ).cornerRadiusWithClipRRect(60)
                              : Image.asset(
                                  "images/carea/userImage.jpg",
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                ).cornerRadiusWithClipRRect(60),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 8,
                        child: GestureDetector(
                          onTap: () async {
                            if (UserImage != null) {
                              imagePath = UserImage;
                            }
                            try {
                              await pr_ob.pickImage();
                              imagePath = pr_ob.pickedFile!.path;
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.edit, color: white, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: userNameController,
                    focusNode: f1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter user name';
                      }
                      return null;
                    },
                    onFieldSubmitted: (v) {
                      f1.unfocus();
                      FocusScope.of(context).requestFocus(f2);
                    },
                    decoration: inputDecoration(context, hintText: "Full name"),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: userNickNameController,
                    focusNode: f2,
                    onFieldSubmitted: (v) {
                      f2.unfocus();
                      FocusScope.of(context).requestFocus(f3);
                    },
                    decoration: inputDecoration(context, hintText: "Nickname"),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: userDateOfBirthController,
                    focusNode: f3,
                    readOnly: true,
                    onTap: () {
                      selectDateAndTime(context);
                    },
                    onFieldSubmitted: (v) {
                      f3.unfocus();
                      FocusScope.of(context).requestFocus(f4);
                    },
                    decoration: inputDecoration(
                      context,
                      hintText: "Date of Birth",
                      suffixIcon: Icon(Icons.calendar_month_rounded, size: 16, color: appStore.isDarkModeOn ? white : gray),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: userEmailController,
                    focusNode: f4,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Enter correct email';
                      }
                      return null;
                    },
                    onFieldSubmitted: (v) {
                      f4.unfocus();
                      FocusScope.of(context).requestFocus(f5);
                    },
                    decoration: inputDecoration(
                      context,
                      hintText: "Email",
                      suffixIcon: Icon(Icons.mail_outline_rounded, size: 16, color: appStore.isDarkModeOn ? white : gray),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: userContactNumberController,
                    focusNode: f5,
                    validator: (value) {
                      if (int.tryParse(value!) == null) {
                        return 'Only Number are allowed';
                      }
                      return null;
                    },
                    onFieldSubmitted: (v) {
                      f5.unfocus();
                      FocusScope.of(context).requestFocus(f6);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'Phone number',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: radius(defaultRadius),
                        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: radius(defaultRadius),
                        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      filled: true,
                      fillColor: appStore.isDarkModeOn ? cardDarkColor : editTextBgColor,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Observer(
                          builder: (context) => DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: pr_ob.pickedValuseOfDropDownMenu1,
                              style: primaryTextStyle(),
                              items: [
                                DropdownMenuItem(child: Text('🇮🇳'), value: 0),
                                DropdownMenuItem(child: Text('🇰🇷'), value: 1),
                                DropdownMenuItem(child: Text('🇮🇨'), value: 2),
                                DropdownMenuItem(child: Text('🇬🇪'), value: 3),
                              ],
                              onChanged: (val) {
                                pr_ob.pickedValuseOfDropDownMenu1 = val!.toString().validate().toDouble();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: boxDecorationWithRoundedCorners(
                      borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                      backgroundColor: appStore.isDarkModeOn ? cardDarkColor : editTextBgColor,
                    ),
                    padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 16,
                      style: primaryTextStyle(),
                      hint: Text('Gender', style: primaryTextStyle()),
                      isExpanded: true,
                      underline: Container(
                        height: 0,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue.toString();
                        });
                      },
                      items: <String>['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreatePinScreen()),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: appStore.isDarkModeOn ? cardDarkColor : Colors.black,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Text('Continue', style: boldTextStyle(color: white)),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
