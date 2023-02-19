import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPDashBoardScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPColors.dart';
import 'package:prokit_flutter/integrations/screens/Marquee/MHomePage.dart';

class CPLoginScreen extends StatefulWidget {
  @override
  CPLoginScreenState createState() => CPLoginScreenState();
}

class CPLoginScreenState extends State<CPLoginScreen> {
  bool? checkBoxValue = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passWordFocus = FocusNode();

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
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?  ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Register",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: CPPrimaryColor,
                ),
              ).onTap(
                () {
                  CPSignUpScreen().launch(context);
                },
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 80, bottom: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Login to your \naccount",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(width: 60, height: 3, decoration: boxDecorations(radius: 8, bgColor: CPPrimaryColor, showShadow: false)),
                      SizedBox(width: 8),
                      Container(width: 10, height: 3, decoration: boxDecorations(radius: 8, bgColor: CPPrimaryColor, showShadow: false)),
                    ],
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: emailController,
                    obscureText: false,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(passWordFocus);
                    },
                    focusNode: emailFocus,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.transparent, width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.transparent, width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.transparent, width: 0),
                      ),
                      hintText: "Email",
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
                  SizedBox(height: 24),
                  TextField(
                    controller: passController,
                    obscureText: true,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    focusNode: passWordFocus,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
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
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      filled: true,
                      isDense: false,
                      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined, color: Color(0xffa7a7a7), size: 22),
                    ),
                  ),
                  SizedBox(height: 16),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text("Remember Me", style: primaryTextStyle()),
                    value: checkBoxValue,
                    dense: true,
                    onChanged: (newValue) {
                      setState(() {
                        checkBoxValue = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  SizedBox(height: 16),
                  MaterialButton(
                    onPressed: () {
                      CPDashBoardScreen().launch(context);
                    },
                    color: Color(0xff2972ff),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, fontStyle: FontStyle.normal),
                    ),
                    textColor: Color(0xffffffff),
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: Text(
                      "OR",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff9d9d9d),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  MaterialButton(
                    onPressed: () {
                      CPDashBoardScreen().launch(context);
                    },
                    color: context.cardColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Text(
                      "Login with Google",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, fontStyle: FontStyle.normal),
                    ),
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
