import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/component/SSBestODWidget.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/model/SneakerShoppingModel.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/screen/SSDetailScreen.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/screen/SSViewAllScreen.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSDataGenerator.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSWidgets.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../main.dart';

class SSHomeFragment extends StatefulWidget {
  @override
  State<SSHomeFragment> createState() => _SSHomeFragmentState();
}

class _SSHomeFragmentState extends State<SSHomeFragment> {
  final List<SneakerShoppingModel> list = getAllData();
  final List<SneakerShoppingModel> data = getSearchData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    afterBuildCreated(() {
      dialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image(
          image: AssetImage('images/sneakerShopping/ic_sneaker_logo.png'),
          height: 30,
          width: 30,
          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
          fit: BoxFit.cover,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Responsive(
              web: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Image(image: NetworkImage('$BaseUrl/images/sneakerShopping/ic_banner1.jpg'), height: 600, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
              ),
              mobile: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: commonCachedNetworkImage(
                  '$BaseUrl/images/sneakerShopping/ic_banner1.jpg',
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Best of OD", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                  TextButton(
                    onPressed: () {
                      SSViewAllScreen().launch(context);
                    },
                    child: Text("Show all", style: secondaryTextStyle()),
                  ),
                ],
              ),
            ),
            HorizontalList(
              padding: EdgeInsets.only(left: 16, right: 16),
              itemCount: list.length,
              itemBuilder: (_, index) {
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    SSDetailScreen(img: list[index].img).launch(context);
                  },
                  child: SSBestODWidget(title: list[index].name, img: list[index].img, subtitle: list[index].subtitle, amount: list[index].amount),
                );
              },
            ),
            SizedBox(height: 16, width: 16),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Text("New Arrivals", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
            ),
            Responsive(
              mobile: ListView.builder(
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return arrivalWidget(context: context, img: data[index].img);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> dialog() async {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: 300,
            width: 300,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image(image: NetworkImage('$BaseUrl/images/sneakerShopping/ic_arrivals_2.jpg'), height: 200, width: context.width(), fit: BoxFit.cover),
                    IconButton(
                      onPressed: () {
                        finish(context);
                      },
                      icon: Icon(Icons.close, color: Colors.black),
                    )
                  ],
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.all(16),
                  width: context.width(),
                  color: context.cardColor,
                  child: sSAppButton(
                    textColor: Colors.white,
                    title: 'Shop Now',
                    context: context,
                    onPressed: () {
                      finish(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
