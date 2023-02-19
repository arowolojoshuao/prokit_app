import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBCountryCodeModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBSelectCountryCodeScreen extends StatefulWidget {
  const JCBSelectCountryCodeScreen({Key? key}) : super(key: key);

  @override
  State<JCBSelectCountryCodeScreen> createState() => _JCBSelectCountryCodeScreenState();
}

class _JCBSelectCountryCodeScreenState extends State<JCBSelectCountryCodeScreen> {
  List<JCBCountryCodeModel> countryList = jcbGetCountryCodes();

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor),
          onPressed: () {
            if (selectedIndex != -1) {
              finish(context, countryList[selectedIndex].code);
            } else {
              finish(context);
            }
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a country',
              style: boldTextStyle(
                size: 40,
                fontFamily: jcbFont,
                color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor,
                weight: FontWeight.w900,
              ),
            ).paddingSymmetric(horizontal: 16),
            16.height,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: jcbSecBorderColor.withAlpha(100), borderRadius: radius(jcbButtonRadius)),
              child: AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.NAME,
                textStyle: boldTextStyle(),
                onChanged: (val) {
                  //
                },
                suffixPasswordInvisibleWidget: Offstage(),
                suffixPasswordVisibleWidget: Offstage(),
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'images/juberCarBooking/jcbIcons/ic_search.png',
                    height: 14,
                    width: 14,
                    fit: BoxFit.cover,
                    color: Colors.grey,
                  ).paddingAll(12),
                  border: InputBorder.none,
                  hintText: 'Search..',
                  hintStyle: boldTextStyle(color: Colors.grey),
                ),
              ),
            ),
            20.height,
            ListView.builder(
              itemCount: countryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  color: index == selectedIndex ? jcbGreyColor.withAlpha(30) : context.scaffoldBackgroundColor,
                  child: RichText(
                    text: TextSpan(
                      text: '${countryList[index].name.toUpperCase()}',
                      style: boldTextStyle(size: 16),
                      children: <TextSpan>[
                        TextSpan(text: '(${countryList[index].code})', style: boldTextStyle(size: 16, color: Colors.grey)),
                      ],
                    ),
                  ),
                ).onTap(() {
                  selectedIndex = index;
                  setState(() {});
                });
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            )
          ],
        ),
      ),
    );
  }
}
