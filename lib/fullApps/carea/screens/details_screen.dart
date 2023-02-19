import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/commons/images.dart';
import 'package:prokit_flutter/fullApps/carea/screens/registration_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/wish_list_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/zoom_image_screen.dart';
import 'package:prokit_flutter/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../commons/colors.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.image}) : super(key: key);
  String image;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TabController? tabController;
  PageController pageController = PageController(viewportFraction: 1);

  List carname = ["Mercedes", "Tesla", "BMW", "Honda", "Toyata", "Volvo", "Bugatti", "More"];

  List<String> carList = [car1, car2, car3, car4, car5, car6, car7, car8, car9, car10, car11, car12, car13];

  String? imageaddr;

  @override
  void didChangeDependencies() {
    tabController;
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
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: context.iconColor),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border_rounded, size: 20, color: context.iconColor),
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
          child: Container(
            color: context.scaffoldBackgroundColor,
            padding: EdgeInsets.only(bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.65,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: carname.length,
                    itemBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.55,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: Image.asset((widget.image.isNotEmpty) ? widget.image : ListOfCarImg[0], alignment: Alignment.topCenter),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        height: 8,
                        width: 8,
                        color: appStore.isDarkModeOn ? white : primaryBlackColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      dotDecoration: DotDecoration(
                        height: 8,
                        width: 8,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(padding: EdgeInsets.only(left: 16), child: Text("BMW M5 Series", style: boldTextStyle(size: 20))),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(6)),
                        child: Text("Used", style: TextStyle(color: Colors.black, fontSize: 12)),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.star_half_rounded, color: context.iconColor),
                      SizedBox(width: 8),
                      Text('4.9 (86 reviews)', style: secondaryTextStyle()),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Align(alignment: Alignment.topLeft, child: Text("Description", style: boldTextStyle())),
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    style: secondaryTextStyle(),
                    text: "Loream ipsu dolor sit amet consecteture adipiscing elit, sed"
                        "do eiusmod tempor incident ut labor",
                    children: [
                      TextSpan(text: ' view more ...', style: primaryTextStyle()),
                    ],
                  ),
                ).paddingOnly(right: 16, left: 16),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Align(alignment: Alignment.topLeft, child: Text("Gallery photo", style: boldTextStyle())),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: ListOfCarImg.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SizedBox(width: 16);
                      }
                      return GestureDetector(
                        onTap: () {
                          ZoomImageScreen(galleryImages: carList, index: index).launch(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 16),
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            backgroundColor: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.2),
                          ),
                          padding: EdgeInsets.all(4),
                          child: Image(image: AssetImage(carList[index]), height: 50, width: 50),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 16),
                  leading: Image(image: AssetImage("images/carea/bmw.png"), height: 50, width: 50),
                  title: Text("BMW Store", style: boldTextStyle()),
                  subtitle: Text("Official Accont of BMW ✔", style: secondaryTextStyle()),
                  trailing: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegistrationScreen()),
                            );
                          },
                          icon: Icon(Icons.message_rounded, size: 20),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegistrationScreen()),
                            );
                          },
                          icon: Icon(Icons.call, size: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.015),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price', style: secondaryTextStyle()),
                          SizedBox(height: 5),
                          Text('\$175000', style: boldTextStyle(size: 18)),
                        ],
                      ),
                      SizedBox(width: 50),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegistrationScreen()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 42),
                          margin: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: appStore.isDarkModeOn ? cardDarkColor : Colors.black,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Text('Make an Offer', style: boldTextStyle(color: white)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
