import 'package:prokit_flutter/fullApps/evSpot/components/app_logo_image_component.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/sign_up_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/verification_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/common.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // For Keyboard Dismiss
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: AppLogoImageComponent(isCenter: true),
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: MediaQuery.of(context).size.width, child: Image.asset(splash_image2, fit: BoxFit.cover)),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi mate,', style: secondaryTextStyle(size: 16)),
                    SizedBox(height: 6),
                    Text('Sign In Now', style: boldTextStyle(size: 22)),
                    SizedBox(height: 40),
                    Text('Phone Number', style: primaryTextStyle()),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: inputDecoration(context, hintText: 'Enter Phone Number'),
                      keyboardType: TextInputType.number,
                      cursorColor: ev_primary_color,
                      cursorWidth: 1,
                      maxLength: 10,
                    ),
                    SizedBox(height: 25),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: getElevatedButtonStyle(),
                        child: Text('Continue', style: primaryTextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(alignment: Alignment.center, child: Text('Or Continue With', style: primaryTextStyle())),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            child: OutlinedButton.icon(
                              icon: Image.asset(ic_facebook, height: 22, width: 22),
                              label: Text('Facebook', style: boldTextStyle()),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen()));
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            height: 50,
                            child: OutlinedButton.icon(
                              icon: GoogleLogoWidget(size: 22),
                              label: Text('Google', style: boldTextStyle()),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen()));
                              },
                            ),
                          ),
                        ),
                      ],
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
