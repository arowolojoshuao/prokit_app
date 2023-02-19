import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/screens/details_screen.dart';
import 'package:prokit_flutter/fullApps/carea/store/logicprovider.dart';
import 'package:prokit_flutter/fullApps/carea/store/search_delagete_ob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

import '../commons/colors.dart';
import 'search_delageate.dart';

class TopDealsScreen extends StatefulWidget {
  const TopDealsScreen({Key? key}) : super(key: key);

  @override
  State<TopDealsScreen> createState() => _TopDealsScreenState();
}

class _TopDealsScreenState extends State<TopDealsScreen> {
  LogicProvider businessLogic = LogicProvider();
  SearchDelegateOb observer = SearchDelegateOb();

  late double width;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: careaAppBarWidget(
          context,
          titleText: "Top Deals",
          actionWidget: IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate.initialize(""));
            },
            icon: Icon(Icons.search, size: 18),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 45,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  padding: EdgeInsets.only(bottom: 8, top: 8),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        observer.changeColor(primaryWhiteColor, primaryBlackColor, index);
                        observer.list_of_image.shuffle();
                      },
                      child: Observer(
                        builder: (context) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryBlackColor),
                            color: appStore.isDarkModeOn ? cardDarkColor : observer.bgColor[index],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            listOfCarName[index],
                            style: TextStyle(color: appStore.isDarkModeOn ? white : observer.textColor[index]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 8,
                spacing: 16,
                children: List.generate(
                  observer.list_of_image.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(image: observer.list_of_image[index]),
                          ),
                        );
                      },
                      child: Container(
                        width: context.width() * 0.5 - 24,
                        decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(15)),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Observer(
                                  builder: (context) => Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: appStore.isDarkModeOn ? cardDarkColor : primaryColor.shade300,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image(
                                      height: 140,
                                      width: !(width > 450) ? (width / 2.2) : 220,
                                      image: AssetImage(observer.list_of_image[index]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text("Sedan Series", style: boldTextStyle()).paddingOnly(left: 8),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(Icons.star_half_rounded, color: context.iconColor),
                                    Text(listOfCarRating[index], style: primaryTextStyle()),
                                    Text(" | "),
                                    SizedBox(width: 8),
                                    Text(
                                      "Used",
                                      style: TextStyle(
                                        color: appStore.isDarkModeOn ? white : primaryBlackColor,
                                        fontSize: 10,
                                        background: Paint()
                                          ..color = appStore.isDarkModeOn ? cardDarkColor : primaryColor.shade300
                                          ..strokeWidth = 12
                                          ..strokeCap = StrokeCap.round
                                          ..strokeJoin = StrokeJoin.round
                                          ..style = PaintingStyle.stroke,
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(left: 8),
                                SizedBox(height: 6),
                                Text(listOfCarPrize[index], style: boldTextStyle()).paddingOnly(left: 8),
                                SizedBox(height: 8),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                icon: Observer(builder: (context) => businessLogic.IconList[index]),
                                onPressed: () {
                                  businessLogic.changeIconOfFavarite(index);
                                },
                              ),
                            ).paddingOnly(top: 8, right: 8),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24)
            ],
          ),
        ),
      ),
    );
  }
}
