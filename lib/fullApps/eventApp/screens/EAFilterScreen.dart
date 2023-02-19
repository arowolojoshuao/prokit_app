import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/screens/EALocationScreen.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class EAFilterScreen extends StatefulWidget {
  const EAFilterScreen({Key? key}) : super(key: key);

  @override
  _EAFilterScreenState createState() => _EAFilterScreenState();
}

class _EAFilterScreenState extends State<EAFilterScreen> {
  double _value = 0.33;
  RangeValues _currentRangeValues = const RangeValues(20, 100);
  bool isCheck = false;
  int? isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        "Filter",
        center: true,
        backWidget: IconButton(
          icon: Icon(Icons.close, color: white),
          onPressed: () {
            finish(context);
          },
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        width: context.width(),
        height: 50,
        decoration: boxDecorationWithShadow(
          borderRadius: radius(24),
          gradient: LinearGradient(colors: [primaryColor1, primaryColor2]),
        ),
        child: Text('Show 100+ Event'.toUpperCase(), style: primaryTextStyle(color: white, size: 16)),
      ).onTap(
        () {
          EALocationScreen().launch(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('When', style: boldTextStyle()).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
            HorizontalList(
              itemCount: filterDateList.length,
              itemBuilder: (context, i) {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: boxDecorationRoundedWithShadow(16,
                      backgroundColor: isSelected == i
                          ? primaryColor1
                          : appStore.isDarkModeOn
                              ? cardDarkColor
                              : white),
                  child: Text(
                    filterDateList[i].name!,
                    style: primaryTextStyle(
                        color: isSelected == i
                            ? white
                            : appStore.isDarkModeOn
                                ? white
                                : black),
                  ),
                ).onTap(
                  () {
                    setState(() {
                      isSelected = i;
                    });
                  },
                );
              },
            ),
            16.height,
            Text('#Hashtag', style: boldTextStyle()).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
            HorizontalList(
                itemCount: filterHashtagList.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationWithRoundedCorners(
                        borderRadius: radius(16),
                        backgroundColor: filterHashtagList[i].isSelected == true
                            ? primaryColor1
                            : appStore.isDarkModeOn
                                ? cardDarkColor
                                : white),
                    child: Text(
                      filterHashtagList[i].name!,
                      style: primaryTextStyle(
                          color: filterHashtagList[i].isSelected == true
                              ? white
                              : appStore.isDarkModeOn
                                  ? white
                                  : black),
                    ),
                  ).onTap(() {
                    filterHashtagList[i].isSelected = !filterHashtagList[i].isSelected;
                    log(filterHashtagList[i].isSelected);
                    setState(() {});
                  });
                }),
            16.height,
            Text('Ratings', style: boldTextStyle()).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
            RatingBarWidget(
              onRatingChanged: (rating) {},
              rating: 4,
              allowHalfRating: true,
              itemCount: 5,
              size: 40,
              activeColor: primaryColor1,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border_outlined,
            ).center(),
            16.height,
            createRichText(
              list: [
                TextSpan(text: "Distance ", style: boldTextStyle()),
                TextSpan(text: "10 mil", style: boldTextStyle(color: primaryColor1)),
              ],
            ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
            CustomTheme(
              child: Slider(
                min: 0,
                max: 100,
                activeColor: primaryColor1,
                inactiveColor: grey.withOpacity(0.1),
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
            16.height,
            createRichText(
              list: [
                TextSpan(text: "Price ", style: boldTextStyle()),
                TextSpan(text: "\$10-\$25", style: boldTextStyle(color: primaryColor1)),
              ],
            ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: primaryColor1,
                inactiveTrackColor: grey.withOpacity(0.1),
                thumbColor: white,
                valueIndicatorTextStyle: TextStyle(color: Colors.white),
              ),
              child: RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 100,
                divisions: 100,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            ),
            16.height,
            Row(
              children: [
                Container(
                  height: 26,
                  width: 26,
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: context.cardColor,
                    boxShape: BoxShape.rectangle,
                    border: Border.all(width: 0.1),
                  ),
                  child: Icon(
                    Icons.check,
                    color: isCheck ? primaryColor1 : white,
                  ),
                ).onTap(
                  () {
                    isCheck = !isCheck;
                    setState(() {});
                  },
                ),
                16.width,
                Text('Only Free events', style: boldTextStyle()),
              ],
            ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12)
          ],
        ),
      ),
    );
  }
}
