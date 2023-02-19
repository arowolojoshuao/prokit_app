import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/models/SVSearchModel.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/fragments/SVProfileFragment.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/search/components/SVSearchCardComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVSearchFragment extends StatefulWidget {
  @override
  State<SVSearchFragment> createState() => _SVSearchFragmentState();
}

class _SVSearchFragmentState extends State<SVSearchFragment> {
  List<SVSearchModel> list = [];

  @override
  void initState() {
    list = getRecentList();
    super.initState();
    afterBuildCreated(() {
      setStatusBarColor(svGetScaffoldColor());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: svGetScaffoldColor(),
      appBar: AppBar(
        backgroundColor: svGetScaffoldColor(),
        iconTheme: IconThemeData(color: context.iconColor),
        leadingWidth: 30,
        title: Container(
          decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(8)),
          child: AppTextField(
            textFieldType: TextFieldType.NAME,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Here',
              hintStyle: secondaryTextStyle(color: svGetBodyColor()),
              prefixIcon: Image.asset('images/socialv/icons/ic_Search.png', height: 16, width: 16, fit: BoxFit.cover, color: svGetBodyColor()).paddingAll(16),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('RECENT', style: boldTextStyle()).paddingAll(16),
            ListView.separated(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SVSearchCardComponent(element: list[index]).onTap(() {
                  SVProfileFragment().launch(context);
                });
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 20);
              },
              itemCount: list.length,
            ),
          ],
        ),
      ),
    );
  }
}
