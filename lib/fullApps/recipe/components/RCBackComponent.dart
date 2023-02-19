import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class RCBackComponent extends StatelessWidget {
  Color color;
  Color borderColor;

  RCBackComponent({required this.color, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: borderColor), borderRadius: radius(16)),
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: color),
          onPressed: () {
            finish(context);
          },
        ));
  }
}
