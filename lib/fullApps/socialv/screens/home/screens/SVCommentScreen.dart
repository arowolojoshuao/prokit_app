import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/models/SVCommentModel.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/home/components/SVCommentComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/home/components/SVCommentReplyComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVColors.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

import '../../../../../main.dart';

class SVCommentScreen extends StatefulWidget {
  const SVCommentScreen({Key? key}) : super(key: key);

  @override
  State<SVCommentScreen> createState() => _SVCommentScreenState();
}

class _SVCommentScreenState extends State<SVCommentScreen> {
  List<SVCommentModel> commentList = [];

  @override
  void initState() {
    commentList = getComments();
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
        backgroundColor: context.cardColor,
        iconTheme: IconThemeData(color: context.iconColor),
        title: Text('Comments', style: boldTextStyle(size: 20)),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: commentList.map((e) {
                return SVCommentComponent(comment: e);
              }).toList(),
            ),
          ),
          SVCommentReplyComponent(),
        ],
      ),
    );
  }
}
