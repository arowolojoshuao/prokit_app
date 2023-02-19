import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';

class JSSortByComponent extends StatefulWidget {
  const JSSortByComponent({Key? key}) : super(key: key);

  @override
  _JSSortByComponentState createState() => _JSSortByComponentState();
}

class _JSSortByComponentState extends State<JSSortByComponent> {
  int? sortByValue = 0;

  List<JSPopularCompanyModel> sortByList = getSortByList();

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
        itemCount: sortByList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (_, i) {
          JSPopularCompanyModel data = sortByList[i];
          return Theme(
            data: Theme.of(context).copyWith(unselectedWidgetColor: Theme.of(context).iconTheme.color),
            child: RadioListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 0, bottom: 0),
              activeColor: js_primaryColor,
              value: i,
              groupValue: sortByValue,
              onChanged: (int? val) {
                setState(() {
                  sortByValue = val;
                });
              },
              title: Text(data.companyName.validate(), style: primaryTextStyle()),
            ),
          );
        });
  }
}
