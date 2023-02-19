import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/screens/top_deals_screen.dart';
import 'package:prokit_flutter/fullApps/carea/store/logicprovider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SpacialOfferScreen extends StatefulWidget {
  const SpacialOfferScreen({Key? key}) : super(key: key);

  @override
  State<SpacialOfferScreen> createState() => _SpacialOfferScreenState();
}

class _SpacialOfferScreenState extends State<SpacialOfferScreen> {
  LogicProvider logi = LogicProvider();

  final List<PageController> _controller = List.generate(
    ListOfCarImg.length,
    (i) {
      return PageController(initialPage: i);
    },
  );

  @override
  void dispose() {
    super.dispose();
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
          titleText: "Special Offer",
          actionWidget: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'top_deal_screen');
            },
            icon: Icon(Icons.more_horiz_rounded),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Wrap(
              children: List.generate(
                ListOfCarImg.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TopDealsScreen()),
                    );
                  },
                  child: SizedBox(
                    width: 550,
                    height: 200,
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _controller[index],
                          itemCount: ListOfCarImg.length,
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                            margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
                            decoration: BoxDecoration(
                              color: appStore.isDarkModeOn ? cardDarkColor : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text.rich(
                                    TextSpan(
                                      text: '20%\n\n',
                                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                                      children: [
                                        TextSpan(text: 'Weak Deals\n\n', style: TextStyle(fontSize: 20)),
                                        TextSpan(
                                          text: 'Get a new car discount, only valid \nthis week',
                                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(flex: 2, child: Image(image: AssetImage(ListOfCarImg[index])))
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          right: MediaQuery.of(context).size.width * 0.42,
                          child: SmoothPageIndicator(
                            controller: _controller[index],
                            count: 5,
                            effect: CustomizableEffect(
                              activeDotDecoration: DotDecoration(
                                color: appStore.isDarkModeOn ? white : Colors.black,
                                borderRadius: BorderRadius.circular(20),
                                width: 20,
                              ),
                              dotDecoration: DotDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
