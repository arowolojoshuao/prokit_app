import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVConstants.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVPostOptionsComponent extends StatefulWidget {
  @override
  State<SVPostOptionsComponent> createState() => _SVPostOptionsComponentState();
}

class _SVPostOptionsComponentState extends State<SVPostOptionsComponent> {
  List<String> list = [
    '$BaseUrl/images/socialv/posts/post_one.png',
    '$BaseUrl/images/socialv/posts/post_two.png',
    '$BaseUrl/images/socialv/posts/post_three.png',
    '$BaseUrl/images/socialv/postImage.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: svGetScaffoldColor(),
        borderRadius: radiusOnly(topRight: SVAppContainerRadius, topLeft: SVAppContainerRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 62,
                  width: 52,
                  color: context.cardColor,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Image.asset('images/socialv/icons/ic_CameraPost.png', height: 22, width: 22, fit: BoxFit.cover),
                ),
                HorizontalList(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return svCommonCachedNetworkImage(list[index], height: 62, width: 52, fit: BoxFit.cover);
                  },
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('images/socialv/icons/ic_Video.png', height: 32, width: 32, fit: BoxFit.cover),
              Image.asset('images/socialv/icons/ic_Voice.png', height: 32, width: 32, fit: BoxFit.cover),
              Image.asset('images/socialv/icons/ic_Location.png', height: 32, width: 32, fit: BoxFit.cover),
              Image.asset('images/socialv/icons/ic_Paper.png', height: 32, width: 32, fit: BoxFit.cover),
            ],
          ),
        ],
      ),
    );
  }
}
