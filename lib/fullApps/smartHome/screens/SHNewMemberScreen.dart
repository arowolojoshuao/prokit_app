import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';

class SHNewMemberScreen extends StatefulWidget {
  @override
  SHNewMemberScreenState createState() => SHNewMemberScreenState();
}

class SHNewMemberScreenState extends State<SHNewMemberScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode usernameFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

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
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    emailFocus.dispose();
    usernameFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SHScaffoldDarkColor,
      appBar: appBarWidget(
        '',
        elevation: 0,
        showBack: false,
        color: SHScaffoldDarkColor,
        titleWidget: Row(
          children: [
            IconButton(
              icon: Icon(Icons.close, color: white),
              onPressed: () {
                finish(context);
              },
            ),
            16.width,
            Text('New Members', style: boldTextStyle(color: white))
          ],
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Information', style: boldTextStyle(color: white, size: 22)),
              16.height,
              AppTextField(
                errorThisFieldRequired: 'This Field is required',
                textStyle: primaryTextStyle(color: white),
                nextFocus: usernameFocus,
                controller: emailController,
                cursorColor: white,
                textFieldType: TextFieldType.EMAIL,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16),
                  hintText: 'Email',
                  hintStyle: secondaryTextStyle(color: grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: BorderSide(color: grey, width: 0.5)),
                ),
              ),
              16.height,
              AppTextField(
                errorThisFieldRequired: 'This Field is required',
                textStyle: primaryTextStyle(color: white),
                controller: usernameController,
                cursorColor: white,
                focus: usernameFocus,
                textFieldType: TextFieldType.NAME,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16),
                  hintText: 'UserName',
                  hintStyle: secondaryTextStyle(color: grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: BorderSide(color: grey, width: 0.5)),
                ),
              ),
              32.height,
              Text('Access', style: boldTextStyle(color: white, size: 22)),
              16.height,
              memberAccessWidget(width: context.width(), name: 'Room'),
              16.height,
              memberAccessWidget(width: context.width(), name: 'Services'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: button(
        context: context,
        textColor: white,
        width: context.width(),
        text: 'Add Member',
        onTap: () {
          if (_formKey.currentState!.validate()) {
            hideKeyboard(context);
            SHModel data = SHModel(
              img: 'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
              name: usernameController.text,
              subtitle: 'HouseHold',
            );
            finish(context, data);
          }
        },
      ).paddingSymmetric(horizontal: 16, vertical: 16),
    );
  }
}
