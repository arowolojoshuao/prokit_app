import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme11/model/T11Model.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11DataGenerator.dart';

class T11WalkThroughScreen extends StatefulWidget {
  static String tag = '/T11WalkThroughScreen';

  @override
  T11WalkThroughScreenState createState() => T11WalkThroughScreenState();
}

class T11WalkThroughScreenState extends State<T11WalkThroughScreen> {
  List<Music> walkThroughList = generateWalkThroughMusic();

  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: context.width(),
                  height: context.height(),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: walkThroughList.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          SizedBox(height: context.statusBarHeight + 50),
                          Image.asset(walkThroughList[i].image, fit: BoxFit.cover, width: context.width()),
                          16.height,
                          Text(walkThroughList[currentIndexPage].title, style: boldTextStyle(size: 24)),
                          16.height,
                          Text(
                            walkThroughList[currentIndexPage].subtitle,
                            style: secondaryTextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                    onPageChanged: (value) {
                      setState(() => currentIndexPage = value);
                    },
                  ),
                ),
                Positioned(
                  bottom: 200,
                  child: DotIndicator(pageController: pageController, pages: walkThroughList, indicatorColor: Colors.blue),
                ),
                Positioned(
                  top: context.statusBarHeight + 10,
                  right: 10,
                  child: TextButton(
                    child: Text('Skip', style: boldTextStyle(size: 14, color: Colors.grey)),
                    onPressed: () {
                      finish(context);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: radius(40)),
                  child: Icon(Icons.arrow_forward, color: Colors.blue, size: 40),
                ).onTap(() {
                  if (currentIndexPage == 2) {
                    finish(context);
                  }
                  pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                  setState(() {});
                }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
