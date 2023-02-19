import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingContainerWidget extends StatelessWidget {
  final Widget child;

  SettingContainerWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() / 2 - 24,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: radius(defaultRadius),
        border: Border.all(color: context.dividerColor, width: 2),
      ),
      child: child,
    );
  }
}

void contactBottomSheet(BuildContext context) {
  Widget options(var icon, var value, var url) {
    return SettingItemWidget(
      title: value,
      leading: SvgPicture.asset(icon, color: appStore.isDarkModeOn ? white : black, height: 40),
      trailing: Icon(Icons.arrow_forward_ios, color: iconColorSecondary),
      onTap: () {
        finish(context);
        launch(url);
      },
    );
  }

  showModalBottomSheet(
      context: context,
      backgroundColor: context.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topRight: defaultRadius, topLeft: defaultRadius)),
      builder: (builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            16.height,
            Text('Contact Us', style: boldTextStyle(size: 20, color: iconColorSecondary)),
            16.height,
            Divider(height: 0),
            options('images/app/socialIcons/ic_instagram.svg', "Instagram", 'https://www.instagram.com/iqonicdesign/?hl=en'),
            Divider(height: 0),
            options('images/app/socialIcons/ic_youtube.svg', "Youtube", 'https://www.youtube.com/iqonicdesign'),
            Divider(height: 0),
            options('images/app/socialIcons/ic_twitter.svg', "Twitter", 'https://twitter.com/iqonicdesign'),
            16.height,
          ],
        );
      });
}
