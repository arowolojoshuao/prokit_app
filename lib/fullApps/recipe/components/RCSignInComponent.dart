import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RcDashBoardScraan.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';

class RCSignInComponent extends StatelessWidget {
  FocusNode password = FocusNode();

  var form_key = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: form_key,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          Text('Welcome to,', style: boldTextStyle(size: 30, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
          12.height,
          Text('Kifota', style: boldTextStyle(size: 30, fontFamily: GoogleFonts.playfairDisplay().fontFamily, color: primaryColor)),
          24.height,
          AppTextField(
            controller: nameController,
            nextFocus: password,
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
          150.height,
          Container(
                  child: Text('Sign In', style: boldTextStyle(size: 18, color: Colors.white)).center(),
                  width: context.width() - 40,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor))
              .onTap(() {
            if (form_key.currentState!.validate()) {
              RcDashBoardScraan(name: nameController.text).launch(context);
            }
          }),
        ]));
  }
}
