import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPColors.dart';
import 'package:prokit_flutter/main.dart';

class CPEditProfileScreen extends StatefulWidget {
  @override
  CPEditProfileScreenState createState() => CPEditProfileScreenState();
}

class CPEditProfileScreenState extends State<CPEditProfileScreen> {
  TextEditingController fullNameController = TextEditingController(text: "Jelly Grande");
  TextEditingController contactNumberController = TextEditingController(text: "9845612337");
  TextEditingController emailController = TextEditingController(text: "Jelly123@gmail.com");

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode contactNumberFocusNode = FocusNode();
  FocusNode emailFocus = FocusNode();

  String? name;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Edit Profile', style: boldTextStyle(size: 18)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? white : black),
          iconSize: 18,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        height: context.height(),
        width: context.width(),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 110),
              padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
              width: context.width(),
              height: context.height(),
              decoration: boxDecorationWithShadow(
                backgroundColor: context.cardColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Personal Information', style: boldTextStyle(size: 18)),
                    16.height,
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Full Name', style: boldTextStyle(size: 14)),
                          SizedBox(height: 8),
                          TextField(
                            controller: fullNameController,
                            obscureText: false,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            onSubmitted: (value) {
                              FocusScope.of(context).requestFocus(emailFocus);
                            },
                            focusNode: fullNameFocusNode,
                            style: primaryTextStyle(),
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.transparent, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.transparent, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.transparent, width: 1),
                              ),
                              hintText: "Enter your full name",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              filled: true,
                              isDense: false,
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 12, 8),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text('Email', style: boldTextStyle(size: 14)),
                          SizedBox(height: 8),
                          TextField(
                            controller: emailController,
                            obscureText: false,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            onSubmitted: (value) {
                              FocusScope.of(context).requestFocus(contactNumberFocusNode);
                            },
                            focusNode: emailFocus,
                            style: primaryTextStyle(),
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.transparent, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.transparent, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.transparent, width: 1),
                              ),
                              hintText: "Enter your email",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              filled: true,
                              isDense: false,
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 12, 8),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text('Contact Number', style: boldTextStyle(size: 14)),
                          SizedBox(height: 8),
                          TextField(
                            controller: contactNumberController,
                            obscureText: false,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            onSubmitted: (value) {
                              FocusScope.of(context).requestFocus(contactNumberFocusNode);
                            },
                            focusNode: contactNumberFocusNode,
                            style: primaryTextStyle(),
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.transparent, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.transparent, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.transparent, width: 1),
                              ),
                              hintText: "Enter your contact number",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              filled: true,
                              isDense: false,
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 12, 8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.height,
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: MaterialButton(
                        onPressed: () {
                          name = fullNameController.text;
                          toast("Update Profile Successfully");
                          finish(context, name);
                        },
                        color: Color(0xff2972ff),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Text("Continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, fontStyle: FontStyle.normal)),
                        textColor: Color(0xffffffff),
                        height: 40,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8, top: 24),
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(color: CPPrimaryColor, shape: BoxShape.circle),
                  child: Icon(Icons.person, color: white, size: 60),
                ),
                Positioned(
                  bottom: 16,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.edit, color: Colors.white, size: 20),
                    decoration: BoxDecoration(color: CPLineCChart, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
          ],
        ).paddingTop(60),
      ),
    );
  }
}
