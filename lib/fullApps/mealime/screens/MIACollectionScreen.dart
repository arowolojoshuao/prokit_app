import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAAddCollectionScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAConstants.dart';
import 'package:prokit_flutter/main.dart';

class MIACollectionScreen extends StatefulWidget {
  const MIACollectionScreen({Key? key}) : super(key: key);

  @override
  State<MIACollectionScreen> createState() => _MIACollectionScreenState();
}

class _MIACollectionScreenState extends State<MIACollectionScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
              onPressed: () {
                finish(context);
              },
              child: Text('Done', style: primaryTextStyle(color: miaPrimaryColor))),
          leadingWidth: 80,
          elevation: 0,
          actions: [
            collections.isNotEmpty
                ? TextButton(
                    onPressed: () async {
                      collections = await MIAAddCollectionScreen().launch(context);
                    },
                    child: Text('New collection', style: primaryTextStyle(color: miaPrimaryColor)),
                  )
                : Offstage(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Collections', style: boldTextStyle(size: 30)),
              16.height,
              collections.isEmpty
                  ? Text(
                      'Create your own collections for quick access to your favourites. Add your first collections to get started.',
                      style: secondaryTextStyle(size: 16, color: miaSecondaryTextColor),
                    )
                  : Text(
                      'Organize this recipe into your own collections for quick access from the recipe list',
                      style: secondaryTextStyle(size: 16, color: miaSecondaryTextColor),
                    ),
              16.height,
              collections.isEmpty
                  ? AppButton(
                      width: context.width() - 32,
                      color: miaContainerSecondaryColor,
                      text: 'Add a new collection',
                      textStyle: boldTextStyle(color: miaSecondaryColor),
                      onTap: () async {
                        collections = await MIAAddCollectionScreen().launch(context);
                      },
                    )
                  : Offstage(),
              collections.isNotEmpty
                  ? Column(
                      children: collections.map((e) {
                        int index = collections.indexOf(e);
                        return Container(
                          width: context.width() - 32,
                          margin: EdgeInsets.symmetric(vertical: 4),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? miaContainerColor
                                  : appStore.isDarkModeOn
                                      ? context.cardColor
                                      : miaContainerSecondaryColor,
                              borderRadius: radius(miaDefaultRadius)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e.title, style: boldTextStyle()),
                              selectedIndex == index ? Icon(Icons.check, color: Colors.brown) : Offstage(),
                            ],
                          ),
                        ).onTap(() {
                          selectedIndex = index;
                          setState(() {});
                        });
                      }).toList(),
                    )
                  : Offstage()
            ],
          ).paddingSymmetric(horizontal: 16),
        ));
  }
}
