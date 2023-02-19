import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';

class JSDatePostedComponent extends StatefulWidget {
  const JSDatePostedComponent({Key? key}) : super(key: key);

  @override
  _JSDatePostedComponentState createState() => _JSDatePostedComponentState();
}

class _JSDatePostedComponentState extends State<JSDatePostedComponent> {
  List<JSPopularCompanyModel> datePostedList = getDatePostedList();

  int? datePostedValue = 0;

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
    return ListView.builder(
        itemCount: datePostedList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (_, i) {
          JSPopularCompanyModel data = datePostedList[i];
          return Theme(
            data: Theme.of(context).copyWith(unselectedWidgetColor: Theme.of(context).iconTheme.color),
            child: RadioListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 0, bottom: 0),
              activeColor: js_primaryColor,
              value: i,
              groupValue: datePostedValue,
              onChanged: (int? val) {
                setState(() {
                  datePostedValue = val;
                });
              },
              title: Text(data.companyName.validate(), style: primaryTextStyle()),
            ),
          );
        });
  }
}
