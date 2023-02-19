import 'package:prokit_flutter/fullApps/carea/commons/data_provider.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';
import 'package:prokit_flutter/fullApps/carea/store/logicprovider.dart';
import 'package:prokit_flutter/fullApps/carea/store/search_delagete_ob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/colors.dart';
import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/main.dart';

class FilterComponent extends StatefulWidget {
  @override
  _FilterComponentState createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  LogicProvider logi = LogicProvider();
  List searchlist = [];

  SearchDelegateOb ob = SearchDelegateOb();
  SearchDelegateOb ob1 = SearchDelegateOb();
  SearchDelegateOb ob2 = SearchDelegateOb();
  SearchDelegateOb ob3 = SearchDelegateOb();

  List<CallingModel> carBrandData = carBrandList();
  List<CallingModel> carConditionData = carConditionList();
  List<CallingModel> carRattingData = carRattingList();

  String? selectedIndex;

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
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Center(child: Text('Sort & Filter', style: boldTextStyle(size: 20), textAlign: TextAlign.center)),
            SizedBox(height: 8),
            Padding(padding: EdgeInsets.all(8.0), child: Divider(color: primaryColor)),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(textAlign: TextAlign.start, 'Car Brand', style: boldTextStyle()),
            ),
            SizedBox(height: 16),
            Observer(
              builder: (context) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    carBrandData.length,
                    (index) => InkWell(
                      onTap: () {
                        carBrandData[index].selectCarCategory = !carBrandData[index].selectCarCategory.validate();
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryBlackColor),
                          color: appStore.isDarkModeOn
                              ? carBrandData[index].selectCarCategory.validate()
                                  ? black
                                  : cardDarkColor
                              : carBrandData[index].selectCarCategory.validate()
                                  ? black
                                  : white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          carBrandData[index].userName.validate(),
                          style: TextStyle(
                            color: appStore.isDarkModeOn
                                ? carBrandData[index].selectCarCategory.validate()
                                    ? white
                                    : gray
                                : carBrandData[index].selectCarCategory.validate()
                                    ? white
                                    : black,
                          ),
                        ),
                      ),
                    ),
                  ).toList(),
                ).paddingOnly(left: 8),
              ),
            ),
            SizedBox(height: 16),
            Padding(padding: EdgeInsets.only(left: 8), child: Text('Car Condition', style: boldTextStyle())),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  carConditionData.length,
                  (index) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          carConditionData[index].selectCarCategory = !carConditionData[index].selectCarCategory.validate();
                          setState(() {});
                        },
                        child: Observer(
                          builder: (context) => Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: primaryBlackColor),
                              color: appStore.isDarkModeOn
                                  ? carConditionData[index].selectCarCategory.validate()
                                      ? black
                                      : cardDarkColor
                                  : carConditionData[index].selectCarCategory.validate()
                                      ? black
                                      : white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              carConditionData[index].userName.validate(),
                              style: TextStyle(
                                color: appStore.isDarkModeOn
                                    ? carConditionData[index].selectCarCategory.validate()
                                        ? white
                                        : gray
                                    : carConditionData[index].selectCarCategory.validate()
                                        ? white
                                        : black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).toList(),
              ),
            ),
            SizedBox(height: 16),
            Padding(padding: EdgeInsets.only(left: 8), child: Text('Price Range', style: boldTextStyle())),
            SizedBox(height: 8),
            Observer(
              builder: (context) => Slider(
                label: "${ob.sliderInitialIndex}",
                activeColor: primaryColor,
                inactiveColor: primaryColor,
                divisions: 10,
                thumbColor: appStore.isDarkModeOn ? Colors.white : primaryBlackColor,
                max: 20000000,
                min: 80000,
                value: ob.sliderInitialIndex,
                onChanged: (index) {
                  ob.changeSlider(index);
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(padding: EdgeInsets.only(left: 8), child: Text('Sort By', style: boldTextStyle())),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  listOfSortBy.length,
                  (index) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          selectedIndex = listOfSortBy[index];
                          setState(() {});

                          // ob2.changeColor(primaryWhiteColor, primaryBlackColor, index);
                        },
                        child: Observer(
                          builder: (context) => Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: primaryBlackColor),
                              color: selectedIndex == listOfSortBy[index]
                                  ? black
                                  : appStore.isDarkModeOn
                                      ? cardDarkColor
                                      : white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              listOfSortBy[index],
                              style: TextStyle(
                                color: selectedIndex == listOfSortBy[index]
                                    ? white
                                    : appStore.isDarkModeOn
                                        ? gray
                                        : black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).toList(),
              ),
            ),
            SizedBox(height: 16),
            Padding(padding: EdgeInsets.only(left: 8), child: Text('Ratting', style: boldTextStyle())),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  carRattingData.length,
                  (index) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          carRattingData[index].selectCarCategory = !carRattingData[index].selectCarCategory.validate();
                          setState(() {});
                        },
                        child: Observer(
                          builder: (context) => Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: primaryBlackColor),
                              borderRadius: BorderRadius.circular(15),
                              color: appStore.isDarkModeOn
                                  ? carRattingData[index].selectCarCategory.validate()
                                      ? black
                                      : cardDarkColor
                                  : carRattingData[index].selectCarCategory.validate()
                                      ? black
                                      : white,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: appStore.isDarkModeOn
                                      ? white
                                      : carRattingData[index].selectCarCategory.validate()
                                          ? white
                                          : black,
                                ),
                                8.width,
                                Text(
                                  carRattingData[index].userName.validate(),
                                  style: TextStyle(
                                    color: appStore.isDarkModeOn
                                        ? carRattingData[index].selectCarCategory.validate()
                                            ? white
                                            : gray
                                        : carRattingData[index].selectCarCategory.validate()
                                            ? white
                                            : black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    finish(context);
                  },
                  child: Container(
                    width: context.width() * 0.35,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? dividerDarkColor : primaryColor.shade300,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Text(
                      "Reset",
                      style: boldTextStyle(color: appStore.isDarkModeOn ? white : gray.withOpacity(0.6)),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    finish(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Apply Filter Successful!'),
                      ),
                    );
                  },
                  child: Container(
                    width: context.width() * 0.35,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? cardDarkColor : black,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Text("Apply", style: boldTextStyle(color: white)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
