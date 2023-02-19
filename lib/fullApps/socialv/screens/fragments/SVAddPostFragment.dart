import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/addPost/components/SVPostOptionsComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/addPost/components/SVPostTextComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVColors.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';

import '../../../../main.dart';
import '../../../../main/utils/AppColors.dart';

class SVAddPostFragment extends StatefulWidget {
  const SVAddPostFragment({Key? key}) : super(key: key);

  @override
  State<SVAddPostFragment> createState() => _SVAddPostFragmentState();
}

class _SVAddPostFragmentState extends State<SVAddPostFragment> {
  String image = '';

  @override
  void initState() {
    super.initState();
    afterBuildCreated(() {
      setStatusBarColor(context.cardColor);
    });
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.isDarkModeOn ? appBackgroundColorDark : SVAppLayoutBackground);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.iconColor),
        backgroundColor: context.cardColor,
        title: Text('New Post', style: boldTextStyle(size: 20)),
        elevation: 0,
        centerTitle: true,
        actions: [
          AppButton(
            shapeBorder: RoundedRectangleBorder(borderRadius: radius(4)),
            text: 'Post',
            textStyle: secondaryTextStyle(color: Colors.white, size: 10),
            onTap: () {
              svShowShareBottomSheet(context);
            },
            elevation: 0,
            color: SVAppColorPrimary,
            width: 50,
            padding: EdgeInsets.all(0),
          ).paddingAll(16),
        ],
      ),
      body: SizedBox(
        height: context.height(),
        child: Stack(
          children: [
            SVPostTextComponent(),
            Positioned(
              child: SVPostOptionsComponent(),
              bottom: 0,
            ),
          ],
        ),
      ),
    );
  }
}
