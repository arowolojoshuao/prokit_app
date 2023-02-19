import 'package:prokit_flutter/fullApps/evSpot/components/app_logo_image_component.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : backgroundColor,
      appBar: AppBar(
        title: AppLogoImageComponent(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appStore.isDarkModeOn ? Colors.black : backgroundColor,
          statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('FAQs', style: boldTextStyle(size: 22)),
                  SizedBox(height: 8),
                  Text('Your Question got answered', style: secondaryTextStyle(size: 16)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      title: Text('How to Lorem ipsum dolor?', style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : textPrimaryLightColor)),
                      children: [
                        ListTile(
                          title: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', style: secondaryTextStyle()),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
