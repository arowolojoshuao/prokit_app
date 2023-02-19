import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/colors.dart';
import 'package:prokit_flutter/fullApps/carea/commons/images.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/screens/login_with_pass_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/profile_screen.dart';
import 'package:prokit_flutter/fullApps/carea/store/user_signup.dart';
import 'package:prokit_flutter/main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  bool isIconTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: careaAppBarWidget(context),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(height: 110, width: 110, fit: BoxFit.cover, image: AssetImage(car), color: context.iconColor),
                SizedBox(height: 16),
                Text('Create Your Account', style: boldTextStyle(size: 24)),
                SizedBox(height: 40),
                TextFormField(
                  autofocus: false,
                  validator: (value) {
                    if (!value!.contains('@') || !value.endsWith(".com")) {
                      return 'Please enter the correct email';
                    }
                    return null;
                  },
                  focusNode: focusEmail,
                  autofillHints: [AutofillHints.email],
                  onFieldSubmitted: (v) {
                    focusEmail.unfocus();
                    FocusScope.of(context).requestFocus(focusPassword);
                  },
                  controller: _emailController,
                  decoration: inputDecoration(context, prefixIcon: Icons.mail_rounded, hintText: "Email"),
                ),
                SizedBox(height: 20),
                Observer(
                  builder: (context) => TextFormField(
                    autofocus: false,
                    focusNode: focusPassword,
                    controller: _passwordController,
                    obscureText: isIconTrue,
                    validator: (value) {
                      return Validate.validate(value!);
                    },
                    onFieldSubmitted: (v) {
                      focusPassword.unfocus();
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()),
                        );
                      }
                    },
                    decoration: inputDecoration(
                      context,
                      prefixIcon: Icons.lock,
                      hintText: "Password",
                      suffixIcon: Theme(
                        data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            setState(() {
                              isIconTrue = !isIconTrue;
                            });
                          },
                          icon: Icon(
                            (isIconTrue) ? Icons.visibility_rounded : Icons.visibility_off,
                            size: 16,
                            color: appStore.isDarkModeOn ? white : gray,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    decoration: boxDecorationWithRoundedCorners(
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                      backgroundColor: appStore.isDarkModeOn ? cardDarkColor : black,
                    ),
                    child: Text('Sign Up', style: boldTextStyle(color: white)),
                  ),
                ),
                //Divider
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(child: Container(height: 0.2, color: Colors.black)),
                        SizedBox(width: 10),
                        Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Expanded(child: Container(height: 0.2, color: primaryBlackColor)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await customDialoge(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          width: 65,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: context.iconColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image(height: 24, width: 24, image: AssetImage(facebook)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await customDialoge(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          width: 65,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: context.iconColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image(height: 24, width: 24, image: AssetImage(google)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await customDialoge(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          width: 65,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: context.iconColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image(height: 24, width: 24, image: AssetImage(apple), color: context.iconColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginWithPassScreen()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Already have account? ",
                      style: secondaryTextStyle(),
                      children: [
                        TextSpan(text: ' Sign in', style: primaryTextStyle()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
