import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';

class JSRemoveJobComponent extends StatefulWidget {
  const JSRemoveJobComponent({Key? key}) : super(key: key);

  @override
  _JSRemoveJobComponentState createState() => _JSRemoveJobComponentState();
}

class _JSRemoveJobComponentState extends State<JSRemoveJobComponent> {
  List<JSPopularCompanyModel> removeJobsList = getRemoveJobsList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: removeJobsList.map((removeJobsList) {
        return CheckboxListTile(
          title: Text(removeJobsList.companyName.validate(), style: primaryTextStyle(size: 14)),
          subtitle: Text(removeJobsList.totalDays.validate(), style: secondaryTextStyle(size: 12)),
          value: removeJobsList.isBlocked.validate(),
          dense: true,
          activeColor: js_primaryColor,
          contentPadding: EdgeInsets.all(0),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (bool? val) {
            setState(() {
              removeJobsList.isBlocked = val;
            });
          },
        );
      }).toList(),
    ).expand();
  }
}
