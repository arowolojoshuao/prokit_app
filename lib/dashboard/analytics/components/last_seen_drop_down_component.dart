import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/colors.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/constant.dart';
import 'package:prokit_flutter/main.dart';
import 'package:nb_utils/nb_utils.dart';

class LastSeenDropDownComponent extends StatefulWidget {
  @override
  State<LastSeenDropDownComponent> createState() => _LastSeenDropDownComponentState();
}

class _LastSeenDropDownComponentState extends State<LastSeenDropDownComponent> {
  String lastSeenPage = 'Last 30 days';

  List<String> lastSeenItem = ['Last 30 days', 'Last 10 days', 'Last 20 days'];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: lastSeenPage,
      isExpanded: true,
      iconSize: 0,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: radius(DEFAULT_ANALYTICS_RADIUS)),
        prefixIcon: Icon(Icons.calendar_today, color: appStore.isDarkModeOn ? Colors.white : Colors.black, size: 20),
        suffixIcon: Icon(Icons.keyboard_arrow_down, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        suffixIconConstraints: BoxConstraints.tightFor(height: 50),
        contentPadding: EdgeInsets.zero,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: dropDownBorderColor),
          borderRadius: radius(DEFAULT_ANALYTICS_RADIUS),
        ),
      ),
      onChanged: (String? value) {
        lastSeenPage = value!;
        setState(() {});
      },
      items: lastSeenItem.map((itemValue) {
        return DropdownMenuItem(child: Text(itemValue, style: primaryTextStyle()), value: itemValue);
      }).toList(),
    );
  }
}
