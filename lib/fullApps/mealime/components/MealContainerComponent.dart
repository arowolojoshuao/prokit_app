import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIAMealModel.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIASingleMealScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIASplashScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAUpgradeScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';

class MealContainerComponent extends StatefulWidget {
  String header;
  List<MIAMealModel> mealList;

  MealContainerComponent({required this.header, required this.mealList});

  @override
  _MealContainerComponentState createState() => _MealContainerComponentState();
}

class _MealContainerComponentState extends State<MealContainerComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.header, style: boldTextStyle(size: 20)).paddingSymmetric(horizontal: 16),
        8.height,
        HorizontalList(
            spacing: 16,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: widget.mealList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 150,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      child: Stack(
                        children: [
                          miaCommonCachedNetworkImage(widget.mealList[index].image, height: 150, width: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(32).onTap(() {
                            MIASingleMealScreen(element: widget.mealList[index]).launch(context);
                          }),
                          !widget.mealList[index].added
                              ? widget.mealList[index].pro
                                  ? Positioned(
                                      top: 10,
                                      right: 30,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.8), borderRadius: radiusOnly(topLeft: 16, bottomLeft: 16)),
                                        child: Text('Pro  ', style: boldTextStyle(color: miaPrimaryColor)),
                                      ).onTap(() {
                                        //
                                      }),
                                    )
                                  : Offstage()
                              : Offstage(),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: widget.mealList[index].added ? Colors.black.withOpacity(0.8) : Colors.white,
                                borderRadius: radius(100),
                              ),
                              child: Icon(
                                widget.mealList[index].added ? Icons.check : Icons.add,
                                size: 28,
                                color: widget.mealList[index].added ? Colors.white : Colors.black,
                              ),
                            ).onTap(() {
                              widget.mealList[index].added = !widget.mealList[index].added;
                              if (widget.mealList[index].added && !widget.mealList[index].pro) {
                                miaStore.addMeal(header: widget.header, element: widget.mealList[index]);
                              } else if (widget.mealList[index].added && widget.mealList[index].pro) {
                                widget.mealList[index].added = false;
                                MIAUpgradeScreen().launch(context);
                              } else if (!widget.mealList[index].added) {
                                miaStore.removeMeal(header: widget.header, element: widget.mealList[index], name: widget.mealList[index].text);
                              }
                              setState(() {});
                            }),
                          ),
                        ],
                      ),
                      height: 150,
                      width: 150,
                    ),
                    8.height,
                    Text(widget.mealList[index].text, style: primaryTextStyle(), maxLines: 3, overflow: TextOverflow.ellipsis).onTap(() {
                      MIASingleMealScreen(element: widget.mealList[index]).launch(context);
                    })
                  ],
                ),
              );
            })
      ],
    );
  }
}
