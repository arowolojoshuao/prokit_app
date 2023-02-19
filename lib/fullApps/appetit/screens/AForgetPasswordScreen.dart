import 'package:prokit_flutter/fullApps/appetit/screens/AVerificationScreen.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class AForgetPasswordScreen extends StatefulWidget {
  const AForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _AForgetPasswordScreenState createState() => _AForgetPasswordScreenState();
}

class _AForgetPasswordScreenState extends State<AForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = EmailAuth(
      sessionName: "Sample session",
    );
  }

  void sendOTP() async {
    EmailAuth(sessionName: 'Harshit Rajput ');
    var res = await emailAuth.sendOtp(recipientMail: emailController.text, otpLength: 6);
    if (res)
      print('OTP sent');
    else
      print('we cannot sent OTP');
  }

  void verifyOTP() {
    var res = emailAuth.validateOtp(recipientMail: emailController.text, userOtp: otpController.text);
    if (res) {
      print('OTP verified');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP verifed successfully')));
    } else {
      print('Incorrect OTP');
    }
  }

  GlobalKey<FormState> myFormKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: myFormKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        child: Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Forgot Password', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800)),
                  SizedBox(height: 16),
                  Text('Enter your email for retrieve your data by creating new password'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.always,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          label: Text('Email'),
                          hintText: 'Enter email',
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                          suffixIcon: TextButton(onPressed: () => sendOTP(), child: Text('Send OTP', style: TextStyle(color: Colors.deepPurple.shade500))),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: TextFormField(
                      controller: otpController,
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey),
                        label: Text('OTP'),
                        hintText: 'Enter your OTP',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    onLongPress: () {
                      if (myFormKey.currentState!.validate()) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Otp verified successfully')));
                    },
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AVerificationScreen())),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Next', style: TextStyle(fontSize: 18)),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios_outlined, size: 15),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange.shade700,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
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
