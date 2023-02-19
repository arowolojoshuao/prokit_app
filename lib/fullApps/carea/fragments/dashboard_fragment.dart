import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/app_component.dart';
import 'package:prokit_flutter/fullApps/carea/commons/colors.dart';
import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/screens/details_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/notification_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/profile_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/search_delageate.dart';
import 'package:prokit_flutter/fullApps/carea/screens/special_offer_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/top_deals_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/wish_list_screen.dart';
import 'package:prokit_flutter/fullApps/carea/store/logicprovider.dart';
import 'package:prokit_flutter/fullApps/carea/store/search_delagete_ob.dart';
import 'package:prokit_flutter/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashBoardFragment extends StatefulWidget {
  @override
  _DashBoardFragmentState createState() => _DashBoardFragmentState();
}

class _DashBoardFragmentState extends State<DashBoardFragment> {
  TextEditingController searchController = TextEditingController();
  PageController pageController = PageController(initialPage: 0);
  late double width;
  FocusNode searchFocus = FocusNode();

  LogicProvider businessLogic = LogicProvider();
  SearchDelegateOb observer = SearchDelegateOb();

  List textColor = List.generate(
    listOfCarName.length,
    (index) => primaryBlackColor,
  ).toList();

  List bgColor = List.generate(
    listOfCarName.length,
    (index) => primaryWhiteColor,
  ).toList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.of(context).size.width;
  }

  void changeColor(Color bgColor, Color textColor, int index) {
    for (int i = 0; i < this.bgColor.length; i++) {
      this.bgColor[i] = primaryWhiteColor;
      this.textColor[i] = primaryBlackColor;
    }
    this.bgColor[index] = primaryBlackColor;
    this.textColor[index] = primaryWhiteColor;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning 👋", style: secondaryTextStyle()),
            SizedBox(height: 5),
            Text("Andrew Desuza", style: boldTextStyle()),
          ],
        ),
        leading: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(top: 8, right: 8, bottom: 8, left: 16),
            child: Image.asset("images/carea/userImage.jpg", fit: BoxFit.cover).cornerRadiusWithClipRRect(60),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none_rounded, size: 22, color: context.iconColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border_rounded, size: 22, color: context.iconColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishListScreen()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                focusNode: searchFocus,
                controller: searchController,
                style: primaryTextStyle(),
                onFieldSubmitted: (val) {
                  showSearch(
                    query: searchController.text,
                    context: context,
                    delegate: CustomSearchDelegate.initialize(searchController.text),
                  );
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Search',
                  hintStyle: secondaryTextStyle(),
                  fillColor: appStore.isDarkModeOn ? cardDarkColor : editTextBgColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: radius(defaultRadius),
                    borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: radius(defaultRadius),
                    borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, size: 20, color: appStore.isDarkModeOn ? white : gray.withOpacity(0.5)),
                    onPressed: () {
                      showSearch(
                        query: searchController.text,
                        context: context,
                        delegate: CustomSearchDelegate.initialize(searchController.text),
                      );
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      size: 20,
                      color: appStore.isDarkModeOn ? white : gray.withOpacity(0.5),
                    ),
                    onPressed: () {
                      showSearch(
                        query: searchController.text,
                        context: context,
                        delegate: CustomSearchDelegate.initialize(searchController.text),
                      );
                    },
                  ),
                ),
              ),
            ).paddingSymmetric(horizontal: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Special Offer", style: boldTextStyle(size: 18)),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SpacialOfferScreen()));
                  },
                  child: Text('See All', style: Theme.of(context).textTheme.bodyText2),
                ),
              ],
            ).paddingOnly(left: 16, right: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TopDealsScreen()));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      itemCount: ListOfCarImg.length,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn ? cardDarkColor : primaryColor.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text.rich(
                                TextSpan(
                                  text: '20%\n\n',
                                  style: boldTextStyle(size: 26),
                                  children: [
                                    TextSpan(text: 'Week Deals!\n\n', style: boldTextStyle(size: 16)),
                                    TextSpan(
                                      text: 'Get a new car discount, \nonly valid this week',
                                      style: secondaryTextStyle(size: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Image(image: AssetImage(ListOfCarImg[index])),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.75),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 5,
                        effect: CustomizableEffect(activeDotDecoration: LightActiveDecoration, dotDecoration: LightDecoration),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: List.generate(
                listOfCarImage.length,
                (index) => GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => WishListScreen()));
                  },
                  child: SizedBox(
                    width: (width / 4),
                    height: 80,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: boxDecorationWithRoundedCorners(
                            boxShape: BoxShape.circle,
                            backgroundColor: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.2),
                          ),
                          child: Image.asset(
                            listOfCarImage[index],
                            fit: BoxFit.cover,
                            width: 30,
                            height: 30,
                            color: appStore.isDarkModeOn ? white : black,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(listOfCarBrandName[index], style: primaryTextStyle()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Top Deals", style: boldTextStyle(size: 18)),
              trailing: TextButton(
                child: Text('See All', style: primaryTextStyle()),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TopDealsScreen()));
                },
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 45,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      padding: EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 8),
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
                            ).paddingRight(8),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 16,
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
                          alignment: Alignment.topCenter,
                          width: context.width() * 0.5 - 20,
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
          ],
        ),
      ),
    );
  }
}
