import 'package:prokit_flutter/fullApps/evSpot/components/app_logo_image_component.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/terms_condition_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/verification_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:prokit_flutter/main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: AppLogoImageComponent(),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign Up Now', style: boldTextStyle(size: 22)),
              SizedBox(height: 6),
              Text('Looks like you\'re not registered yet', style: secondaryTextStyle(size: 16)),
              SizedBox(height: 40),
              Text('Phone Number', style: primaryTextStyle()),
              SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration(context, hintText: 'Enter Phone Number'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                cursorColor: ev_primary_color,
                cursorWidth: 1,
                maxLength: 10,
              ),
              SizedBox(height: 20),
              Text('Full Name', style: primaryTextStyle()),
              SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration(context, hintText: 'Enter Full Name'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                cursorColor: ev_primary_color,
                cursorWidth: 1,
              ),
              SizedBox(height: 20),
              Text('Email Address', style: primaryTextStyle()),
              SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration(context, hintText: 'Enter Email Address'),
                keyboardType: TextInputType.emailAddress,
                cursorColor: ev_primary_color,
                cursorWidth: 1,
              ),
              SizedBox(height: 25),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: getElevatedButtonStyle(),
                  child: Text('Continue', style: primaryTextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen()));
                  },
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text('By Continue you\'re agreed to our', style: primaryTextStyle()),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionScreen()));
                      },
                      child: Text('Terms & Conditions', style: primaryTextStyle(color: ev_primary_color)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
