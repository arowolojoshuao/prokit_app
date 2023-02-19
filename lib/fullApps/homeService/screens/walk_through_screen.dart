import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';
import 'package:prokit_flutter/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../custom_widget/space.dart';
import '../models/walk_through_model.dart';
import '../utils/colors.dart';
import 'sign_in_screen.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final controller = PageController();
  List<WalkThroughModel> list = [];
  int currentPosition = 0;
  double aspectRatio = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    list.add(
      WalkThroughModel(
        "Give your home a makeover",
        "The best services that you could find for your home, as we have everything that you are in need",
        room,
      ),
    );
    list.add(
      WalkThroughModel(
        "Qualified Professionals",
        "Search From the list of Qualified Professionals around you as we bring the best one for you",
        workerNew,
      ),
    );
    list.add(
      WalkThroughModel(
        "Easy & Fast Services",
        "Book your services at your convenient time and enjoy the hassle free process",
        contractor,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Image(
                  image: AssetImage(list[index].imagePath),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                );
              },
              onPageChanged: (value) {
                currentPosition = value;
                setState(() {});
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: MediaQuery.of(context).size.width,
              height: aspectRatio < 0.48 ? MediaQuery.of(context).size.height * 0.25 : MediaQuery.of(context).size.height * 0.40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.hardEdge,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SmoothPageIndicator(
                              controller: controller,
                              count: 3,
                              effect: ExpandingDotsEffect(
                                dotHeight: 10,
                                dotWidth: 10,
                                activeDotColor: activeDot,
                                expansionFactor: 2,
                              ),
                            ),
                          ),
                        ),
                        Space(16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              list[currentPosition].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                            Space(16),
                            Text(
                              list[currentPosition].subTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: whiteColor, fontSize: 16),
                            ),
                          ],
                        ),
                        Space(16),
                        Visibility(
                          visible: currentPosition == list.length - 1 ? true : false,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: appStore.isDarkModeOn ? Colors.black : whiteColor,
                              onPrimary: blackColor,
                              shape: StadiumBorder(),
                              fixedSize: Size(360, 50),
                            ),
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignInScreen()),
                              );
                            },
                          ),
                        ),
                        Visibility(
                          visible: currentPosition == list.length - 1 ? false : true,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: IconButton(
                                onPressed: () {
                                  controller.animateToPage(currentPosition++, duration: Duration(milliseconds: 500), curve: Curves.linear);
                                },
                                icon: Icon(Icons.arrow_circle_right_rounded, color: whiteColor, size: 50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
