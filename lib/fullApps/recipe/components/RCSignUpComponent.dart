import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCOTPScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';

class RCSignUpComponent extends StatelessWidget {
  var form_key = GlobalKey<FormState>();

  FocusNode name = FocusNode();
  FocusNode password = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: form_key,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          Text('Sign Up', style: boldTextStyle(size: 30, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
          12.height,
          Text('To discover all our tastebud tickling recipes and features', style: secondaryTextStyle(color: rcSecondaryTextColor)),
          16.height,
          AppTextField(
            controller: emailController,
            nextFocus: name,
            textFieldType: TextFieldType.EMAIL,
            textStyle: boldTextStyle(),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail_outlined,
                color: rcSecondaryTextColor,
              ),
              hintText: 'Enter email',
              hintStyle: secondaryTextStyle(),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: rcSecondaryTextColor)),
            ),
          ),
          16.height,
          AppTextField(
            nextFocus: password,
            focus: name,
            controller: nameController,
            textFieldType: TextFieldType.NAME,
            textStyle: boldTextStyle(),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outlined, color: rcSecondaryTextColor),
              hintText: 'Enter username',
              hintStyle: secondaryTextStyle(),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: rcSecondaryTextColor)),
            ),
          ),
          16.height,
          AppTextField(
            focus: password,
            textFieldType: TextFieldType.PASSWORD,
            suffixIconColor: rcSecondaryTextColor,
            textStyle: boldTextStyle(),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outlined, color: rcSecondaryTextColor),
              hintText: 'Enter password',
              hintStyle: secondaryTextStyle(),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: rcSecondaryTextColor)),
            ),
          ),
          32.height,
          RichText(
              text: TextSpan(text: 'By signing up I accept the ', style: secondaryTextStyle(color: rcSecondaryTextColor), children: <TextSpan>[
            TextSpan(text: 'terms of use ', style: secondaryTextStyle(color: primaryColor, weight: FontWeight.bold, decoration: TextDecoration.underline)),
            TextSpan(
              text: 'and ',
              style: secondaryTextStyle(color: rcSecondaryTextColor),
            ),
            TextSpan(text: 'data,private,policy.', style: secondaryTextStyle(color: primaryColor, weight: FontWeight.bold, decoration: TextDecoration.underline)),
          ])),
          50.height,
          Container(
                  child: Text('Sign Up', style: boldTextStyle(size: 18, color: Colors.white)).center(),
                  width: context.width() - 40,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor))
              .onTap(() {
            RCOTPScreen(
              email: emailController.text,
              name: nameController.text,
            ).launch(context);

            /*     if(form_key.currentState!.validate()){
              RCOTPScreen(email: emailController.text,name: nameController.text,).launch(context);
            }*/
          }),
        ]));
  }
}
