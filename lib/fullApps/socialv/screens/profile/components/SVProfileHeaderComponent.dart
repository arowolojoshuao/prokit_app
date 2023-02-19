import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVConstants.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVProfileHeaderComponent extends StatelessWidget {
  const SVProfileHeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              svCommonCachedNetworkImage(
                '$BaseUrl/images/socialv/backgroundImage.png',
                width: context.width(),
                height: 130,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRectOnly(topLeft: SVAppCommonRadius.toInt(), topRight: SVAppCommonRadius.toInt()),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: radius(18)),
                  child: svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_5.png', height: 88, width: 88, fit: BoxFit.cover).cornerRadiusWithClipRRect(SVAppCommonRadius),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
