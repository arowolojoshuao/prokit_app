import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/home/components/SVHomeDrawerComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/home/components/SVPostComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/home/components/SVStoryComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';

class SVHomeFragment extends StatefulWidget {
  @override
  State<SVHomeFragment> createState() => _SVHomeFragmentState();
}

class _SVHomeFragmentState extends State<SVHomeFragment> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  File? image;

  @override
  void initState() {
    super.initState();
    afterBuildCreated(() {
      setStatusBarColor(svGetScaffoldColor());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: svGetScaffoldColor(),
      appBar: AppBar(
        backgroundColor: svGetScaffoldColor(),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'images/socialv/icons/ic_More.png',
            width: 18,
            height: 18,
            fit: BoxFit.cover,
            color: context.iconColor,
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text('Home', style: boldTextStyle(size: 18)),
        actions: [
          IconButton(
            icon: Image.asset(
              'images/socialv/icons/ic_Camera.png',
              width: 24,
              height: 22,
              fit: BoxFit.fill,
              color: context.iconColor,
            ),
            onPressed: () async {
              image = await svGetImageSource();
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: context.cardColor,
        child: SVHomeDrawerComponent(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            SVStoryComponent(),
            16.height,
            SVPostComponent(),
            16.height,
          ],
        ),
      ),
    );
  }
}
