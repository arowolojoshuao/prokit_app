import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/eventApp/screens/EANewsDetailScreen.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';

class EANewsList extends StatefulWidget {
  @override
  EANewsListState createState() => EANewsListState();
}

class EANewsListState extends State<EANewsList> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 300.0,
              forceElevated: innerBoxIsScrolled,
              title: Text(innerBoxIsScrolled ? "Fashions Finest AW18 During New York Fashion Week" : ""),
              iconTheme: IconThemeData(color: white),
              automaticallyImplyLeading: false,
              backgroundColor: primaryColor1,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: pageController,
                      itemCount: imageList.length,
                      itemBuilder: (context, i) {
                        return commonCachedNetworkImage(imageList[i].image!, fit: BoxFit.cover);
                      },
                      onPageChanged: (value) {
                        setState(() => currentIndexPage = value);
                      },
                    ),
                    Positioned(
                      bottom: 30,
                      left: 12,
                      right: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('#dance #music', style: secondaryTextStyle(color: white)),
                          8.height,
                          Text(
                            'Fashions Finest AW18 During New York Fashion Week',
                            style: boldTextStyle(size: 18, color: white),
                          ),
                        ],
                      ),
                    ),
                    DotIndicator(
                      pageController: pageController,
                      pages: walkThroughList,
                      indicatorColor: white,
                      unselectedIndicatorColor: grey,
                    ).paddingBottom(8),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 12, right: 12, top: 8),
          itemCount: eventList.length,
          itemBuilder: (context, i) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonCachedNetworkImage(
                  eventList[i].image!,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 100,
                ).cornerRadiusWithClipRRect(8),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(eventList[i].name!, style: boldTextStyle()),
                    20.height,
                    Text(eventList[i].date!, style: secondaryTextStyle()),
                  ],
                ).expand()
              ],
            ).onTap(
              () {
                EANewsDetailScreen().launch(context);
              },
            ).paddingSymmetric(vertical: 8);
          },
        ),
      ),
    );
  }
}
