import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCWelcomeImageComponent extends StatelessWidget {
  const RCWelcomeImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: -20,
            top: -20,
            child: Column(
              children: [
                rcCommonCachedNetworkImage('$BaseUrl/images/recipe/burger.jpg', width: context.width() / 3, height: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
                8.height,
                rcCommonCachedNetworkImage('$BaseUrl/images/recipe/strawberryCupcake.jpg', width: context.width() / 3, height: 130, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
                8.height,
                rcCommonCachedNetworkImage('$BaseUrl/images/recipe/panCake.jpg', width: context.width() / 3, height: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
              ],
            ),
          ),
          Column(
            children: [
              rcCommonCachedNetworkImage('$BaseUrl/images/recipe/walkThroughImages/imageOne.jpg', width: context.width() / 3, height: 130, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
              8.height,
              rcCommonCachedNetworkImage('$BaseUrl/images/recipe/doraCake.jpg', width: context.width() / 3, height: 170, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
              8.height,
              rcCommonCachedNetworkImage('$BaseUrl/images/recipe/coffee.jpg', width: context.width() / 3, height: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
            ],
          ),
          8.width,
          Positioned(
            right: -20,
            top: -20,
            child: Column(
              children: [
                rcCommonCachedNetworkImage('$BaseUrl/images/recipe/sandwich.jpg', width: context.width() / 3, height: 120, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
                8.height,
                rcCommonCachedNetworkImage('$BaseUrl/images/recipe/burger.jpg', width: context.width() / 3, height: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
                8.height,
                rcCommonCachedNetworkImage('$BaseUrl/images/recipe/milkShakes.jpg', width: context.width() / 3, height: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
              ],
            ),
          ),
          Container(
            height: 200,
            width: context.width(),
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
              Colors.white.withOpacity(0.8),
              Colors.white.withOpacity(0.75),
              Colors.white.withOpacity(0.7),
              Colors.white.withOpacity(0.65),
              Colors.white.withOpacity(0.6),
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.4),
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0.2),
              Colors.white.withOpacity(0.1),
              Colors.transparent
            ])),
          ),
        ],
      ),
    );
  }
}
