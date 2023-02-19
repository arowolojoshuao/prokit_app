import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';

class AppLogoImageComponent extends StatelessWidget {
  AppLogoImageComponent({Key? key, this.isCenter}) : super(key: key);

  final bool? isCenter;

  @override
  Widget build(BuildContext context) {
    if (isCenter ?? false) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('EV', style: boldTextStyle(size: 24)),
            Image.asset(ic_thunder, height: 24, width: 24, color: ev_primary_color),
            Text('SPOT', style: boldTextStyle(size: 24)),
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('EV', style: boldTextStyle(size: 24)),
          Image.asset(ic_thunder, height: 24, width: 24, color: ev_primary_color),
          Text('SPOT', style: boldTextStyle(size: 24)),
        ],
      );
    }
  }
}
