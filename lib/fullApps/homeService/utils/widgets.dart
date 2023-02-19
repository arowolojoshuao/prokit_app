import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/homeService/models/last_bookings_model.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/dashboard_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';
import 'package:prokit_flutter/main.dart';

InputDecoration commonInputDecoration({String? hintText, Widget? prefixIcon, Widget? suffixIcon}) {
  return InputDecoration(
    filled: true,
    fillColor: textFieldColor,
    hintText: hintText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    hintStyle: TextStyle(color: hintTextColor, fontSize: 16),
    contentPadding: EdgeInsets.symmetric(horizontal: 16),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
  );
}

Widget homeTitleWidget({
  String? titleText,
  String? viewAllText,
  Function()? onAllTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titleText!, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        TextButton(
          child: Text(
            viewAllText ?? "View All",
            style: TextStyle(color: viewAllColor, fontSize: 16, fontWeight: FontWeight.normal),
          ),
          onPressed: onAllTap!,
        ),
      ],
    ),
  );
}

Widget drawerWidget({String? drawerTitle, Function()? drawerOnTap, IconData? drawerIcon}) {
  return ListTile(
    horizontalTitleGap: 0,
    visualDensity: VisualDensity.compact,
    leading: Icon(drawerIcon!, size: 20),
    title: Text(drawerTitle!, style: TextStyle()),
    onTap: drawerOnTap!,
  );
}

Future<void> showAlertDialog(BuildContext context, {int? index}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Are you sure to book that service again?'),
        actions: [
          TextButton(
            child: Text('No', style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Yes', style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
            onPressed: () {
              againBooking(index!);
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardScreen()));
            },
          ),
        ],
      );
    },
  );
}
