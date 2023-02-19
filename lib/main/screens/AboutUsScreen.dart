import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, language!.lblAboutUs),
      body: SnapHelperWidget<String>(
        future: getPackageInfo().then((value) => value.versionName.validate()),
        onSuccess: (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('images/app/app_icon.png', height: 50, width: 50, fit: BoxFit.cover),
                16.width,
                Text(mainAppName, style: boldTextStyle(size: 20)),
              ],
            ),
            16.height,
            Divider(thickness: 4, color: appColorPrimary, endIndent: 200),
            16.height,
            Text(language!.lblVersion, style: boldTextStyle()),
            Text(data.validate(), style: secondaryTextStyle()),
            16.height,
            Text(language!.lblProkitUIDesignKit, style: secondaryTextStyle()),
            16.height,
            Text(language!.lblAboutUsDescription, style: secondaryTextStyle()),
            30.height,
            AppButton(
              padding: EdgeInsets.all(16),
              color: appColorPrimary,
              onTap: () {
                launch('https://codecanyon.net/item/prokit-flutter-app-ui-design-templete-kit/25787190?s_rank=1');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(MaterialCommunityIcons.shopping_outline, color: white),
                  4.width,
                  Text('Purchase', style: boldTextStyle(color: white)),
                ],
              ),
            )
          ],
        ).paddingAll(16),
      ),
    );
  }
}
