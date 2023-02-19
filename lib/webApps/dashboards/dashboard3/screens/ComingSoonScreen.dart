import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Coming Soon..', style: boldTextStyle(size: 50)),
    ).center().expand();
  }
}
