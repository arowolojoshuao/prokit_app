import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';
import 'package:prokit_flutter/main.dart';

class JSSkillComponent extends StatefulWidget {
  const JSSkillComponent({Key? key}) : super(key: key);

  @override
  _JSSkillComponentState createState() => _JSSkillComponentState();
}

class _JSSkillComponentState extends State<JSSkillComponent> {
  List<JSPopularCompanyModel> skillList = getSkillData();

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
      itemCount: skillList.length,
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        JSPopularCompanyModel data = skillList[index];

        return AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: gray.withOpacity(0.6)),
            backgroundColor: appStore.isDarkModeOn
                ? scaffoldDarkColor
                : data.selectSkill.validate()
                    ? js_selectSkillBgColor.withOpacity(0.7)
                    : white,
          ),
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              Icon(data.selectSkill.validate() ? Icons.done : Icons.add, color: js_primaryColor, size: 16),
              16.width,
              Text(data.companyName.validate(), style: boldTextStyle(color: js_primaryColor)),
            ],
          ),
        ).onTap(() {
          data.selectSkill = !data.selectSkill.validate();
          setState(() {});
        });
      },
    );
  }
}
