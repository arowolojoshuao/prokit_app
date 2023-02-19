import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/images.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/screens/forgot_pass_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/home_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/signup_screen.dart';
import 'package:prokit_flutter/fullApps/carea/store/user_signup.dart';
import 'package:prokit_flutter/main.dart';

class LoginWithPassScreen extends StatefulWidget {
  const LoginWithPassScreen({Key? key}) : super(key: key);

  @override
  State<LoginWithPassScreen> createState() => _LoginWithPassScreenState();
}

class _LoginWithPassScreenState extends State<LoginWithPassScreen> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  bool isIconTrue = false;
  bool isChecked = false;

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();

  final _formKey = GlobalKey<FormState>();
  var userinfo;

  bool? checkBoxValue = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var userinfo = ModalRoute.of(context)!.settings.arguments;
    if (_emailController == null || _passwordController == null) {
      if (userinfo == null) {
        _emailController = TextEditingController();
        _passwordController = TextEditingController();
      } else {
        userinfo as UserCreadential;
        _emailController = TextEditingController(text: userinfo.user_email);
        _passwordController = TextEditingController(text: userinfo.user_password);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(elevation: 0, iconTheme: IconThemeData(color: context.iconColor)),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(height: 130, width: 130, fit: BoxFit.fitWidth, image: AssetImage(car), color: context.iconColor),
                  Text('Login to Your Account', style: boldTextStyle(size: 24)),
                  SizedBox(height: 20),
                  TextFormField(
                    focusNode: f1,
                    onFieldSubmitted: (v) {
                      f1.unfocus();
                      FocusScope.of(context).requestFocus(f2);
                    },
                    validator: (k) {
                      if (!k!.contains('@')) {
                        return 'Please enter the correct email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: inputDecoration(context, prefixIcon: Icons.mail_rounded, hintText: "Email"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isIconTrue,
                    focusNode: f2,
                    validator: (value) {
                      return Validate.validate(value!);
                    },
                    onFieldSubmitted: (v) {
                      f2.unfocus();
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
                  SizedBox(height: 8),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: appStore.isDarkModeOn ? Colors.white : black),
                    child: CheckboxListTile(
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : black,
                      ),
                      child: Text('Sign in', style: boldTextStyle(color: white)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPassScreen()));
                    },
                    child: Text('Forgot the password ?', style: boldTextStyle()),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(child: Container(height: 0.2, color: Colors.black26)),
                        SizedBox(width: 10),
                        Text('Or continue with', style: secondaryTextStyle()),
                        SizedBox(width: 10),
                        Expanded(child: Container(height: 0.2, color: Colors.black26)),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
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
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: secondaryTextStyle(),
                        children: [
                          TextSpan(text: ' Sign up', style: boldTextStyle(size: 14)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
