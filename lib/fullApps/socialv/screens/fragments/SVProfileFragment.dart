import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/home/components/SVStoryComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/profile/components/SVProfileHeaderComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/profile/components/SVProfilePostsComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVConstants.dart';

import '../../utils/SVColors.dart';

class SVProfileFragment extends StatefulWidget {
  const SVProfileFragment({Key? key}) : super(key: key);

  @override
  State<SVProfileFragment> createState() => _SVProfileFragmentState();
}

class _SVProfileFragmentState extends State<SVProfileFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    afterBuildCreated(() {
      setStatusBarColor(svGetScaffoldColor());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: svGetScaffoldColor(),
        appBar: AppBar(
          backgroundColor: svGetScaffoldColor(),
          title: Text('Profile', style: boldTextStyle(size: 20)),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: context.iconColor),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SVProfileHeaderComponent(),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Manding boss', style: boldTextStyle(size: 20)),
                  4.width,
                  Image.asset('images/socialv/icons/ic_TickSquare.png', height: 14, width: 14, fit: BoxFit.cover),
                ],
              ),
              Text('@splatterui', style: secondaryTextStyle(color: svGetBodyColor())),
              24.height,
              AppButton(
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(4)),
                text: 'Following',
                textStyle: boldTextStyle(color: Colors.white),
                onTap: () {},
                elevation: 0,
                color: SVAppColorPrimary,
              ),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Posts', style: secondaryTextStyle(color: svGetBodyColor(), size: 12)),
                      4.height,
                      Text('1,1286', style: boldTextStyle(size: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Followers', style: secondaryTextStyle(color: svGetBodyColor(), size: 12)),
                      4.height,
                      Text('127k', style: boldTextStyle(size: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Views', style: secondaryTextStyle(color: svGetBodyColor(), size: 12)),
                      4.height,
                      Text('1156m', style: boldTextStyle(size: 18)),
                    ],
                  )
                ],
              ),
              16.height,
              Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(SVAppCommonRadius)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Text('Your Stories', style: boldTextStyle(size: 14)).paddingSymmetric(horizontal: 16),
                    SVStoryComponent(),
                  ],
                ),
              ),
              16.height,
              SVProfilePostsComponent(),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
