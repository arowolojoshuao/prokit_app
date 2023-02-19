import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryAddPayment.dart';
import 'GroceryChangePassword.dart';
import 'GroceryDeliveryAddress.dart';
import 'GroceryRecipientDetail.dart';

class GroceryProfile extends StatefulWidget {
  static String tag = '/GroceryProfile';

  @override
  _GroceryProfileState createState() => _GroceryProfileState();
}

class _GroceryProfileState extends State<GroceryProfile> {
  late List<GroceryProfileModel> profileList;

  @override
  // ignore: must_call_super
  void initState() {
    profileList = groceryProfileList();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              padding: EdgeInsets.all(spacing_standard_new),
              color: context.cardColor,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(radius: width * 0.11, backgroundImage: CachedNetworkImageProvider(grocery_ic_user1)),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ishan", style: boldTextStyle()),
                      2.height,
                      Text("ish.maduskha@gmail.com", style: secondaryTextStyle()),
                      2.height,
                      Text("0718786729", style: secondaryTextStyle()),
                    ],
                  )
                ],
              ),
            ),
            16.height,
            Container(
              decoration: boxDecoration(radius: 10.0, bgColor: context.cardColor),
              padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard, top: spacing_standard),
              child: ListView.separated(
                separatorBuilder: (_, index) => Divider(),
                itemCount: profileList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: boxDecoration(radius: 25.0, bgColor: profileList[index].color),
                        child: Image.asset(
                          profileList[index].icon,
                          height: 10,
                          width: 10,
                          color: grocery_color_white,
                        ).paddingAll(12),
                      ).paddingOnly(top: spacing_control, left: spacing_standard, bottom: spacing_control),
                      16.width,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(profileList[index].title, style: boldTextStyle()),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: index == 4 ? 0 : 25,
                            color: grocery_textColorSecondary,
                          )
                        ],
                      ).expand()
                    ],
                  ).onTap(
                    () {
                      if (index == 0) {
                        GroceryRecipientDetail().launch(context);
                      } else if (index == 1) {
                        GroceryDeliveryAddress().launch(context);
                      } else if (index == 2) {
                        GroceryAddPaymentScreen().launch(context);
                      } else if (index == 3) {
                        GroceryChangePassword().launch(context);
                      } else if (index == 4) {
                        showLogoutBottomSheetDialog(context);
                      }
                    },
                  );
                },
              ).paddingOnly(bottom: spacing_standard_new),
            ).paddingAll(spacing_standard_new)
          ],
        ),
      ),
    );
  }

  showLogoutBottomSheetDialog(context) async {
    var w = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          width: w,
          height: 200,
          decoration: boxDecorationWithShadow(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: const Radius.circular(20.0)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: boxDecoration(radius: 20.0, bgColor: grocery_Red_Color),
                    child: Image.asset(Grocery_ic_Logout, height: 10, width: 10, color: grocery_color_white).paddingAll(10),
                  ),
                  16.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(grocery_lbl_Logout, style: boldTextStyle()),
                        4.height,
                        Text(grocery_lbl_confirmation_for_logout, style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                ],
              ),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text("No", style: boldTextStyle()),
                    color: context.cardColor,
                    onTap: () {
                      finish(context);
                    },
                  ),
                  16.width,
                  AppButton(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(grocery_lbl_Logout, style: boldTextStyle()),
                    color: grocery_color_red,
                    onTap: () {
                      finish(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: spacing_standard_new),
            ],
          ).paddingSymmetric(horizontal: 24, vertical: 16),
        );
      },
    );
  }
}
