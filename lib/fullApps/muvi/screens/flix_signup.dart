import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_home_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class SignUpScreen extends StatefulWidget {
  static String tag = '/SignUpScreen';

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  FocusNode passFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
  TextEditingController _controller = TextEditingController();
  String? email;
  String? password;
  bool autoValidate = false;
  bool passwordVisible = false;
  bool isLoading = false;

  showLoading(bool show) {
    setState(
      () {
        isLoading = show;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColor(
      muvi_navigationBackground,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    );
  }

  @override
  void initState() {
    setStatusBarColor(
      muvi_navigationBackground,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var form = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            cursorColor: muvi_colorPrimary,
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            onSaved: (String? value) {
              email = value;
            },
            textInputAction: TextInputAction.next,
            focusNode: emailFocus,
            onFieldSubmitted: (arg) {
              FocusScope.of(context).requestFocus(passFocus);
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: muvi_colorPrimary)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: muvi_textColorPrimary)),
              labelText: "Email",
              labelStyle: TextStyle(fontSize: ts_normal, color: muvi_textColorPrimary),
              suffixIcon: Icon(Icons.mail_outline, color: muvi_colorPrimary, size: 20),
              contentPadding: EdgeInsets.only(bottom: 1.5),
            ),
            style: TextStyle(fontSize: ts_normal, color: muvi_textColorPrimary, fontFamily: font_regular),
          ).paddingBottom(spacing_standard_new),
          TextFormField(
            controller: _controller,
            obscureText: passwordVisible,
            cursorColor: muvi_colorPrimary,
            style: TextStyle(fontSize: ts_normal, color: muvi_textColorPrimary, fontFamily: font_regular),
            focusNode: passFocus,
            onSaved: (String? value) {
              password = value;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: muvi_colorPrimary)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: muvi_textColorPrimary)),
              labelText: "Password",
              labelStyle: TextStyle(fontSize: ts_normal, color: muvi_textColorPrimary),
              contentPadding: EdgeInsets.only(bottom: 1.5),
              suffixIcon: Icon(
                passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: muvi_colorPrimary,
                size: 20,
              ).onTap(
                () {
                  setState(
                    () {
                      passwordVisible = !passwordVisible;
                    },
                  );
                },
              ),
            ),
          ).paddingBottom(spacing_standard_new),
          TextFormField(
            obscureText: passwordVisible,
            cursorColor: muvi_colorPrimary,
            style: TextStyle(fontSize: ts_normal, color: muvi_textColorPrimary, fontFamily: font_regular),
            focusNode: confirmPasswordFocus,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (arg) {
              FocusScope.of(context).requestFocus(passFocus);
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: muvi_colorPrimary)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: muvi_textColorPrimary)),
              labelText: "Confirm Password",
              labelStyle: TextStyle(fontSize: ts_normal, color: muvi_textColorPrimary),
              contentPadding: EdgeInsets.only(bottom: 1.5, top: spacing_control),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                child: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: muvi_colorPrimary,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    var signUpButton = SizedBox(
      width: double.infinity,
      child: button(
        context,
        "Sign Up",
        () {
          HomeScreen().launch(context);
        },
      ),
    );

    Widget loginWithGoogle = iconButton(
      context,
      "Sign Up with Google",
      ic_google,
      () {},
      backgroundColor: Colors.white,
    ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new);

    return SafeArea(
      child: Scaffold(
        backgroundColor: muvi_appBackground,
        appBar: appBarLayout(context, "Register", darkBackground: false),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Align(alignment: Alignment.center, child: flixTitle(context).paddingAll(spacing_large)),
              Text(
                "Sign up to discover all our movies and enjoy our features",
                style: primaryTextStyle(color: muvi_textColorPrimary),
                maxLines: 2,
                textAlign: TextAlign.center,
              ).paddingOnly(top: spacing_control, left: spacing_large, right: spacing_large).center(),
              form.paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_large),
              signUpButton.paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_large),
              Align(
                  alignment: Alignment.center,
                  child: text(
                    "Or simply sign up with",
                    fontSize: ts_medium,
                  ).paddingAll(spacing_standard_new)),
              loginWithGoogle..paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
              Container(
                margin: EdgeInsets.all(spacing_standard_new),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      16.height,
                      text(
                        "Already have an account?",
                        fontSize: ts_medium,
                        textColor: muvi_textColorPrimary,
                      ).paddingAll(spacing_control),
                      text(
                        "Login",
                        fontSize: ts_medium,
                        fontFamily: font_medium,
                        textColor: muvi_colorPrimary,
                      ).paddingAll(spacing_control).onTap(
                        () {
                          finish(context);
                        },
                      )
                    ],
                  ).onTap(() {
                    SignUpScreen().launch(context);
                  }),
                ),
              ),
              loadingWidgetMaker().visible(isLoading).center()
            ],
          ),
        ),
      ),
    );
  }
}
