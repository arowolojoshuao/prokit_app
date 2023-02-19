import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/screens/ProKitLauncher.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class AppSplashScreen extends StatefulWidget {
  static String tag = '/';
  final String routeName;

  AppSplashScreen({this.routeName = "/"});

  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? scaleController;
  Animation<double>? scaleAnimation;

  bool _a = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;
  bool secondAnim = false;

  Color boxColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    Timer(Duration(milliseconds: 600), () {
      setState(() {
        boxColor = context.iconColor;
        _a = true;
      });
    });
    Timer(Duration(milliseconds: 1500), () {
      setState(() {
        boxColor = context.scaffoldBackgroundColor;
        _c = true;
      });
    });
    Timer(Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(Duration(milliseconds: 3200), () {
      secondAnim = true;

      scaleController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000),
      )..forward();
      scaleAnimation = Tween<double>(begin: 0.0, end: 12).animate(scaleController!);

      setState(() {
        boxColor = context.scaffoldBackgroundColor;
        _d = true;
      });
    });

    Timer(Duration(milliseconds: 4200), () {
      secondAnim = true;
      setState(() {});
      if (isWeb || isLinux) {
        if (widget.routeName == "/") {
          ProKitLauncher().launch(context, isNewTask: true);
        } else {
          Navigator.of(context).pushNamed(widget.routeName);
        }
      } else {
        ProKitLauncher().launch(context, isNewTask: true);
      }
    });
    afterBuildCreated(() async {
      setValue(appOpenCount, (getIntAsync(appOpenCount)) + 1);
      await appStore.setLanguage(getStringAsync(SELECTED_LANGUAGE_CODE, defaultValue: defaultLanguage), context: context);
    });
  }

  @override
  void dispose() {
    scaleController!.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: _d ? 900 : 2500),
                curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
                height: _d
                    ? 0
                    : _a
                        ? _h / 2.5
                        : 20,
                width: 20,
              ),
              AnimatedContainer(
                duration: Duration(seconds: _c ? 2 : 0),
                curve: Curves.fastLinearToSlowEaseIn,
                height: _d
                    ? _h
                    : _c
                        ? 130
                        : 20,
                width: _d
                    ? _w
                    : _c
                        ? 130
                        : 20,
                decoration: BoxDecoration(
                    color: boxColor,
                    //shape: _c? BoxShape.rectangle : BoxShape.circle,
                    borderRadius: _d ? BorderRadius.only() : BorderRadius.circular(30)),
                child: secondAnim
                    ? Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? context.cardColor : appSplashSecondaryColor, shape: BoxShape.circle),
                          child: AnimatedBuilder(
                            animation: scaleAnimation!,
                            builder: (c, child) => Transform.scale(
                              scale: scaleAnimation!.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appStore.isDarkModeOn ? context.cardColor : appSplashSecondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: _e ? Image.asset('images/app/app_icon-removebg.png', height: 130, width: 130, fit: BoxFit.cover) : SizedBox(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
