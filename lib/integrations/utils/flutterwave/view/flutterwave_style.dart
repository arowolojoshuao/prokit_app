import 'package:flutter/material.dart';

class FlutterwaveStyle {
  final String? appBarText;
  final Color? buttonColor;
  final TextStyle? buttonTextStyle;
  final Color? appBarColor;
  final TextStyle? appBarTitleTextStyle;
  final Icon? appBarIcon;
  final Color? mainBackgroundColor;
  final TextStyle? mainTextStyle;
  final Color? dialogBackgroundColor;
  final TextStyle? dialogCancelTextStyle;
  final TextStyle? dialogContinueTextStyle;
  final String? buttonText;

  FlutterwaveStyle(
      {this.buttonColor,
      this.buttonTextStyle,
      this.appBarText,
      this.appBarTitleTextStyle,
      this.appBarColor,
      this.appBarIcon,
      this.mainBackgroundColor,
      this.mainTextStyle,
      this.dialogBackgroundColor,
      this.dialogCancelTextStyle,
      this.dialogContinueTextStyle,
      this.buttonText});

  /// Returns app bar text text or default
  String getAppBarText() {
    return appBarText ?? "Flutterwave";
  }

  /// Returns button color or default
  Color getButtonColor() {
    return buttonColor ?? Color(0xFFfff1d0);
  }

  /// Returns button text style or default
  TextStyle getButtonTextStyle() {
    return buttonTextStyle ?? TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
  }

  /// Returns app bar color or default
  Color getAppBarColor() {
    return appBarColor ?? Color(0xFFfff1d0);
  }

  /// Returns app bar text style or default
  TextStyle getAppBarTextStyle() {
    return appBarTitleTextStyle ?? TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
  }

  /// Returns app bar icon or default
  Icon getAppBarIcon() {
    return appBarIcon ?? Icon(Icons.arrow_back, color: Colors.black);
  }

  /// Returns background color or default
  Color getMainBackgroundColor() {
    return mainBackgroundColor ?? Colors.white;
  }

  /// Returns dialog text style or default
  TextStyle getMainTextStyle() {
    return mainTextStyle ?? TextStyle(color: Colors.black, fontSize: 18, letterSpacing: 1.2);
  }

  /// Returns dialog background color or default
  Color getDialogBackgroundColor() {
    return dialogBackgroundColor ?? Colors.white;
  }

  /// Returns dialog's cancel text style or default
  TextStyle getDialogCancelTextStyle() {
    return dialogCancelTextStyle ?? TextStyle(fontSize: 18, color: Colors.red);
  }

  /// Returns dialog's continue text style or default
  TextStyle getDialogContinueTextStyle() {
    return dialogContinueTextStyle ?? TextStyle(fontSize: 18, color: Colors.blue);
  }

  /// Returns button text or default
  String getButtonText() {
    return buttonText ?? "Make Payment";
  }
}
