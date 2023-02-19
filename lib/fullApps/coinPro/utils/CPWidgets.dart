import 'package:flutter/material.dart';

Widget investType({IconData? icon, String? text}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Icon(icon!, color: Color(0xffffffff), size: 24),
      SizedBox(height: 4, width: 16),
      Text(
        text!,
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xffffffff),
        ),
      ),
    ],
  );
}
