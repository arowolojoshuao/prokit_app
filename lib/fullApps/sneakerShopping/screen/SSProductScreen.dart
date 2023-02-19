import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/component/SSBestODWidget.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/model/SneakerShoppingModel.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/screen/SSDetailScreen.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSDataGenerator.dart';

import '../../../main.dart';

class SSProductScreen extends StatefulWidget {
  final String? img;

  SSProductScreen({this.img});

  @override
  State<SSProductScreen> createState() => _SSProductScreenState();
}

class _SSProductScreenState extends State<SSProductScreen> {
  List<SneakerShoppingModel> data = getProductData();
  List<SneakerShoppingModel> list = getAllData();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Image(
          image: AssetImage('images/sneakerShopping/ic_sneaker_logo.png'),
          height: 30,
          width: 30,
          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
          fit: BoxFit.cover,
        ),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? white : black, size: 2),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                commonCachedNetworkImage(
                  widget.img.validate(),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Container(height: 250, decoration: BoxDecoration(color: Colors.black12.withOpacity(0.3)))
              ],
            ),
            SizedBox(height: 16, width: 16),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("45 items", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                  Icon(Icons.sort, color: appStore.isDarkModeOn ? white : black, size: 24),
                ],
              ),
            ),
            SizedBox(height: 16, width: 16),
            Container(
              height: 35,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 8, right: 8),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      decoration: BoxDecoration(
                        color: currentIndex == index ? Color(0xff000000) : context.cardColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                      ),
                      child: Text(
                        data[index].name!,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: boldTextStyle(size: 12, color: currentIndex == index ? Colors.white : Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                runSpacing: 16,
                spacing: 16,
                children: list.map(
                  (e) {
                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        SSDetailScreen(img: e.img).launch(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        width: context.width() / 2 - 24,
                        child: SSBestODWidget(
                          title: e.name,
                          img: e.img,
                          subtitle: e.subtitle,
                          amount: e.amount,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
