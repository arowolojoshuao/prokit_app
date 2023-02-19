import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';

class SHEditProfileScreen extends StatefulWidget {
  @override
  SHEditProfileScreenState createState() => SHEditProfileScreenState();
}

class SHEditProfileScreenState extends State<SHEditProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email = 'camreronedwards@gmail.com';
  String fName = 'camreron';
  String lName = 'Edwards';
  String phone = '8998898';

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

  void setValue() {
    emailController.text = email;
    fNameController.text = fName;
    lNameController.text = lName;
    phoneController.text = phone;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: button(
        context: context,
        textColor: white,
        width: context.width(),
        text: 'Update',
        onTap: () {
          setValue();
        },
      ).paddingSymmetric(horizontal: 16, vertical: 24),
      appBar: appBarWidget(
        '',
        elevation: 0,
        showBack: false,
        color: SHScaffoldDarkColor,
        titleWidget: Row(
          children: [
            IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.close, color: white),
            ),
            16.width,
            Text('Edit Profile', style: boldTextStyle(color: white)),
          ],
        ),
      ),
      backgroundColor: SHScaffoldDarkColor,
      body: Form(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                //overflow: Overflow.visible,
                alignment: Alignment.topCenter,
                children: [
                  FittedBox(
                    fit: BoxFit.fill,
                    child: commonSHCachedNetworkImage(
                      'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
                      height: 100,
                      width: 100,
                    ).cornerRadiusWithClipRRect(50),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 70,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: SHPrimaryColor),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.camera_alt_outlined, color: white),
                      ),
                    ),
                  )
                ],
              ).center(),
              16.height,
              AppTextField(
                textStyle: primaryTextStyle(color: white),
                cursorColor: white,
                textFieldType: TextFieldType.EMAIL,
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16),
                  labelText: 'Email',
                  labelStyle: secondaryTextStyle(color: white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                ),
              ),
              16.height,
              AppTextField(
                textStyle: primaryTextStyle(color: white),
                cursorColor: white,
                textFieldType: TextFieldType.NAME,
                controller: fNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16),
                  labelText: 'First Name',
                  labelStyle: secondaryTextStyle(color: white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                ),
              ),
              16.height,
              AppTextField(
                textStyle: primaryTextStyle(color: white),
                cursorColor: white,
                textFieldType: TextFieldType.NAME,
                controller: lNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16),
                  labelText: 'Last Name',
                  labelStyle: secondaryTextStyle(color: white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                ),
              ),
              16.height,
              AppTextField(
                textStyle: primaryTextStyle(color: white),
                cursorColor: white,
                textFieldType: TextFieldType.PHONE,
                controller: phoneController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16),
                  labelText: 'Phone Number',
                  labelStyle: secondaryTextStyle(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
