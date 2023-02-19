import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/banking/utils/images.dart';
import 'package:prokit_flutter/dashboard/split_bill/model/split_bill_info_model.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/colors.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/images.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/constant.dart';
import 'package:prokit_flutter/main.dart';

class SplitWithComponent extends StatelessWidget {
  const SplitWithComponent({
    Key? key,
    required this.splitModelInfo,
  }) : super(key: key);

  final List<SplitBillInfoModel> splitModelInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Split with', style: boldTextStyle(size: 17)),
              10.height,
              Stack(
                clipBehavior: Clip.none,
                children: List.generate(splitModelInfo.length, (index) {
                  SplitBillInfoModel splitWithData = splitModelInfo[index];
                  if (splitModelInfo.length != (index + 1)) {
                    return Container(
                      margin: EdgeInsets.only(left: (index * 20)),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: splitWithData.iconBgColor, shape: BoxShape.circle),
                      child: Image.asset(splitWithData.icon!, height: 24, width: 24),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.only(left: (index * 20)),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: appStore.isDarkModeOn ? bottomNavBackgroundColor : containerColor, shape: BoxShape.circle),
                      child: Image.asset(ic_add, height: 24, width: 24, color: Colors.white),
                    );
                  }
                }),
              ),
              20.height,
              SizedBox(
                height: 45,
                child: AppButton(
                  text: 'Split Now',
                  textStyle: primaryTextStyle(color: Colors.white),
                  color: primarySplitBillColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(DEFAULT_RADIUS)),
                  padding: EdgeInsets.all(10),
                  onTap: () {
                    //
                  },
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text('Total Bill', style: secondaryTextStyle()),
            6.height,
            Text('\$877.22', style: boldTextStyle()),
            15.height,
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: radius(50),
              child: Image.asset(img_food, height: 82, width: 82),
            ),
          ],
        ),
      ],
    );
  }
}
