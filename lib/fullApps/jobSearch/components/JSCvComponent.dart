import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';
import 'package:prokit_flutter/main.dart';

class JSCvComponent extends StatefulWidget {
  const JSCvComponent({Key? key}) : super(key: key);

  @override
  _JSCvComponentState createState() => _JSCvComponentState();
}

class _JSCvComponentState extends State<JSCvComponent> {
  List<JSPopularCompanyModel> skillList = getSkillList();

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
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.circular(8),
        backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : js_backGroundColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Do you have any of these skills?Check all that apply or add your own in Skill below.",
              style: boldTextStyle(),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ).paddingAll(8),
            Divider(color: gray.withOpacity(0.4)),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(8),
              physics: NeverScrollableScrollPhysics(),
              children: skillList
                  .map(
                    (skillList) => CheckboxListTile(
                      title: Text(skillList.companyName.validate(), style: boldTextStyle()),
                      value: skillList.isBlocked.validate(),
                      dense: true,
                      activeColor: js_primaryColor,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                      onChanged: (bool? val) {
                        setState(() {
                          skillList.isBlocked = val!;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            24.height,
            AppButton(
              color: js_textColor,
              width: context.width(),
              margin: EdgeInsets.symmetric(horizontal: 8),
              onTap: () {
                //JSCompleteProfileFiveScreen().launch(context);
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: Text("Save", style: boldTextStyle(color: white)),
            ),
            24.height,
            Text("Dismiss", style: boldTextStyle(color: js_textColor)).paddingOnly(left: 16, bottom: 22),
          ],
        ),
      ),
    );
  }
}
