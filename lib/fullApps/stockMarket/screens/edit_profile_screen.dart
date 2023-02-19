import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/colors.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
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
      appBar: commonAppBarWidget(context, title: "Edit Profile", changeIcon: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.height,
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8, top: 80),
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                    child: Icon(Icons.person, color: white, size: 60),
                  ),
                  Positioned(
                    bottom: 16,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.edit, color: Colors.white, size: 20),
                      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
            42.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: fullNameController,
                  nextFocus: emailFocus,
                  decoration: inputDecoration(
                    context,
                    labelText: "Full Name",
                    prefixIcon: ic_profile.iconImage(size: 10).paddingAll(14),
                  ),
                ),
                16.height,
                AppTextField(
                  textFieldType: TextFieldType.EMAIL,
                  controller: emailController,
                  focus: emailFocus,
                  nextFocus: contactNumberFocusNode,
                  decoration: inputDecoration(
                    context,
                    labelText: "Email",
                    prefixIcon: ic_message.iconImage(size: 10).paddingAll(14),
                  ),
                ),
                16.height,
                AppTextField(
                  textFieldType: TextFieldType.NUMBER,
                  controller: contactNumberController,
                  decoration: inputDecoration(
                    context,
                    labelText: "Contact Number",
                    prefixIcon: ic_calling.iconImage(size: 10).paddingAll(14),
                  ),
                ),
              ],
            ),
            32.height,
            AppButton(
                onTap: () {
                  name = fullNameController.text;
                  toast("Update Profile Successfully");
                  finish(context, name);
                },
                width: context.width(),
                child: Text("Continue", style: boldTextStyle(color: white)),
                color: primaryColor),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
