import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/screens/ProKitScreenListing.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppImages.dart';
import 'package:prokit_flutter/main/utils/AppStrings.dart';

List<Color> colors = [appCat1, appCat2, appCat3];

class ThemeItemWidget extends StatelessWidget {
  final int index;
  final ProTheme data;

  ThemeItemWidget(this.index, this.data);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (appStore.isDarkModeOn) {
          appStore.toggleDarkMode(value: data.darkThemeSupported.validate());
        }

        if (data.sub_kits == null || data.sub_kits!.isEmpty) {
          if (data.widget != null) {
            log('Tag ${data.widget!.key}');

            data.widget.launch(context);
          } else {
            toasty(context, appComingSoon);
          }
        } else {
          ProKitScreenListing(data).launch(context);
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.all(16),
              child: Image.asset(icons[index % icons.length], color: Colors.white),
              decoration: boxDecorationDefault(color: colors[index % colors.length]),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Container(
                    width: context.width(),
                    height: 80,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    margin: EdgeInsets.only(right: context.width() / 28),
                    decoration: boxDecorationDefault(color: context.cardColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('${data.name.validate()}', style: boldTextStyle(), maxLines: 2),
                            Text(
                              data.title_name.validate(),
                              style: secondaryTextStyle(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ).visible(data.title_name.validate().isNotEmpty),
                          ],
                        ).expand(),
                        Container(
                          //height: 25,
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: data.tag.validate().isNotEmpty ? boxDecorationDefault(color: appDarkRed) : BoxDecoration(),
                          child: Text(data.tag.validate(), style: primaryTextStyle(color: white, size: 12)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                    decoration: boxDecorationDefault(color: colors[index % colors.length], shape: BoxShape.circle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
