import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/colors.dart';

class ShimmerHomeScreen extends StatefulWidget {
  @override
  _ShimmerHomeScreenState createState() => _ShimmerHomeScreenState();
}

class _ShimmerHomeScreenState extends State<ShimmerHomeScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          42.height,
          Container(
            decoration: boxDecorationWithRoundedCorners(backgroundColor: primaryColor, borderRadius: BorderRadius.zero),
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(24),
              width: context.width(),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.green.withOpacity(0.8)),
              height: 300,
            ),
          ),
          16.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(padding: EdgeInsets.only(left: 10), height: 8, width: 80, color: Colors.grey),
                  Container(padding: EdgeInsets.only(left: 10), height: 8, width: 80, color: Colors.grey),
                ],
              ).paddingSymmetric(horizontal: 16),
              16.height,
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 90,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey),
                width: context.width(),
              ).paddingSymmetric(horizontal: 16),
              16.height,
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 90,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey),
                width: context.width(),
              ).paddingSymmetric(horizontal: 16),
              16.height,
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 8,
                width: 80,
                color: Colors.grey,
              ).paddingSymmetric(horizontal: 16),
              16.height,
              Row(
                children: [
                  Container(height: 150, decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey), width: 150),
                  16.width,
                  Container(height: 150, decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey), width: 150),
                ],
              ).paddingSymmetric(horizontal: 16),
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 160,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey),
                width: context.width(),
              ).paddingSymmetric(horizontal: 16, vertical: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(padding: EdgeInsets.only(left: 10), height: 8, width: 80, color: Colors.grey),
                  Container(padding: EdgeInsets.only(left: 10), height: 8, width: 80, color: Colors.grey),
                ],
              ).paddingSymmetric(horizontal: 16),
              Container(
                height: 90,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey),
                width: context.width(),
              ).paddingSymmetric(horizontal: 16, vertical: 16),
              Container(
                height: 90,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey),
                width: context.width(),
              ).paddingSymmetric(horizontal: 16),
              16.height,
              Container(
                height: 90,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey),
                width: context.width(),
              ).paddingSymmetric(horizontal: 16),
            ],
          ),
        ],
      ),
    );
  }
}
