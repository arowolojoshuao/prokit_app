import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';

class MIANotesScreen extends StatelessWidget {
  const MIANotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              finish(context);
            },
            child: Text('Cancel', style: primaryTextStyle(color: miaPrimaryColor))),
        leadingWidth: 80,
        elevation: 0.5,
        centerTitle: true,
        title: Text('Notes', style: boldTextStyle()),
        actions: [
          TextButton(
            onPressed: () {
              finish(context);
            },
            child: Text('Save', style: primaryTextStyle(color: miaPrimaryColor)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              autofocus: true,
              cursorColor: miaPrimaryColor,
              maxLines: 10,
              decoration: InputDecoration(border: InputBorder.none),
            )
          ],
        ).paddingAll(16),
      ),
    );
  }
}
