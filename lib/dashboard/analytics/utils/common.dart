import 'package:flutter/material.dart';

RichText richText({String? text1, TextStyle? style1, String? text2, TextStyle? style2}) {
  return RichText(
    text: TextSpan(
      text: text1 ?? '',
      style: style1,
      children: [
        TextSpan(text: text2 ?? '', style: style2),
      ],
    ),
  );
}
