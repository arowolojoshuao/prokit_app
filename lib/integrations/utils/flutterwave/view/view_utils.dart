import 'package:flutter/material.dart';

class FlutterwaveViewUtils {
  /// Displays a modal to confirm payment
  static Future<void> showConfirmPaymentModal(
    final BuildContext context,
    final String? currency,
    final String amount,
    final TextStyle textStyle,
    final Color? dialogBackgroundColor,
    final TextStyle modalCancelTextStyle,
    final TextStyle modalContinueTextStyle,
    final Function onContinuePressed,
  ) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        final transactionCurrency = currency ?? "NGN";
        return AlertDialog(
          // backgroundColor: context.cardColor,
          content: Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Text(
              "You will be charged a total of $transactionCurrency "
              "$amount. Do you wish to continue? ",
              textAlign: TextAlign.center,
              // style: primaryTextStyle()
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: Text(
                "CANCEL",
                // style: primaryTextStyle(),
              ),
            ),
            TextButton(
              onPressed: () => onContinuePressed(),
              child: Text(
                "CONTINUE",
                // style: primaryTextStyle(color: primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Shows progress dialog
  Future<void> showProgressDialog(
      final String message, final BuildContext context, final bool dismissible, final Widget? progressIndicator, final TextStyle? textStyle, final Color? dialogBackgroundColor) {
    final Widget indicator = progressIndicator != null ? progressIndicator : CircularProgressIndicator(backgroundColor: Colors.orangeAccent);

    final style = textStyle != null ? textStyle : TextStyle(color: Colors.black);

    return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: dialogBackgroundColor,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              indicator,
              Text(
                message,
                textAlign: TextAlign.center,
                style: style,
              )
            ],
          ),
        );
      },
    );
  }

  static void _goBackToPaymentScreen(final BuildContext context) {
    Navigator.of(context).pop();
  }

  /// Cretaes a customised Appbar
  static AppBar appBar(final BuildContext context, final String title, final TextStyle appBarTitleTextStyle, final Icon appBarIcon, final Color appBarColor, [final Function? handleBackPress]) {
    return AppBar(
      backgroundColor: appBarColor,
      titleTextStyle: appBarTitleTextStyle,
      leading: IconButton(
        icon: appBarIcon,
        onPressed: () => handleBackPress == null ? _goBackToPaymentScreen(context) : handleBackPress(),
      ),
      title: Text(title, style: appBarTitleTextStyle),
    );
  }

  /// Displays a Snackbar
  static showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Displays a toast notification
  static void showToast(BuildContext context, String text) {
    // Fluttertoast.showToast(
    //     msg: text,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Color(0xAA383737),
    //     textColor: Colors.white,
    // );
  }
}
