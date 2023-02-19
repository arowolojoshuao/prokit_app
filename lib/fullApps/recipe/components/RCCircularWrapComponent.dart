import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCircularProgress.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';

class RCCircularWrapComponent extends StatelessWidget {
  const RCCircularWrapComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomPaint(
              foregroundPainter: RCCircularProgress(primaryColor, 25),
              child: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LineIcons.cheese,
                      color: primaryColor,
                      size: 30,
                    ),
                    8.height,
                    RichText(
                      text: TextSpan(text: '25', style: boldTextStyle(size: 20), children: [TextSpan(text: ' min', style: secondaryTextStyle())]),
                    )
                  ],
                ).center(),
              ),
            ),
            8.height,
            Text('Cooking', style: boldTextStyle())
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomPaint(
              foregroundPainter: RCCircularProgress(Colors.orange, 60),
              child: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LineIcons.cookie,
                      color: Colors.orange,
                      size: 30,
                    ),
                    8.height,
                    RichText(
                      text: TextSpan(text: '45', style: boldTextStyle(size: 20), children: [TextSpan(text: ' min', style: secondaryTextStyle())]),
                    )
                  ],
                ).center(),
              ),
            ),
            8.height,
            Text('Baking', style: boldTextStyle())
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomPaint(
              foregroundPainter: RCCircularProgress(Colors.blue, 10),
              child: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LineIcons.leaf,
                      color: Colors.blue,
                      size: 30,
                    ),
                    8.height,
                    RichText(
                      text: TextSpan(text: '5', style: boldTextStyle(size: 20), children: [TextSpan(text: ' min', style: secondaryTextStyle())]),
                    )
                  ],
                ).center(),
              ),
            ),
            8.height,
            Text('Resting', style: boldTextStyle())
          ],
        ),
      ],
    );
  }
}
