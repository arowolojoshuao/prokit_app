import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/screens/details_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/search_delageate.dart';
import 'package:prokit_flutter/fullApps/carea/store/logicprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  late LogicProvider observer;

  @override
  void initState() {
    super.initState();
    observer = LogicProvider();
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
          titleText: "My Wishlist",
          actionWidget: IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate.initialize(""),
              );
            },
            icon: Icon(Icons.search, color: context.iconColor, size: 20),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 16,
            spacing: 16,
            children: List.generate(
              ListOfCarImg.length,
              (index) {
                return Container(
                  width: (context.width() - 48) / 2,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(image: ListOfCarImg[index]),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: appStore.isDarkModeOn ? cardDarkColor : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  icon: Observer(builder: (context) => observer.IconList[index]),
                                  onPressed: () {
                                    observer.changeIconOfFavarite(index);
                                  },
                                ),
                              ),
                              Center(child: Image.asset(height: 90, width: 120, ListOfCarImg[index])),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('BMW M4 Series', style: boldTextStyle()),
                      SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star_half, color: context.iconColor, size: 18),
                          SizedBox(width: 5),
                          Text('4.5', style: secondaryTextStyle()),
                          SizedBox(width: 10),
                          Text("|"),
                          SizedBox(width: 15),
                          Text(
                            "New",
                            style: TextStyle(
                              fontSize: 10,
                              background: Paint()
                                ..color = appStore.isDarkModeOn ? cardDarkColor : Colors.grey.shade300
                                ..strokeWidth = 16.5
                                ..strokeJoin = StrokeJoin.round
                                ..strokeCap = StrokeCap.round
                                ..style = PaintingStyle.stroke,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(listOfCarPrize[index], style: boldTextStyle()),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
