import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/model/SneakerShoppingModel.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/screen/SSDetailScreen.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSDataGenerator.dart';

class SSFavoriteFragment extends StatelessWidget {
  final List<SneakerShoppingModel> list = getAllFavorite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("WishList", style: boldTextStyle()),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                SSDetailScreen(img: list[index].img).launch(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white12, width: 1),
                    ),
                    child: commonCachedNetworkImage(list[index].img!, height: 80, width: 140, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                  ),
                  SizedBox(height: 16, width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(list[index].name!, textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                      SizedBox(height: 4),
                      Text(list[index].subtitle!, textAlign: TextAlign.start, overflow: TextOverflow.clip, style: secondaryTextStyle()),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(list[index].amount!, textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle(size: 14)),
                          SizedBox(height: 16, width: 16),
                          Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xa9ffffff),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(160.0),
                              border: Border.all(color: Color(0xed000000), width: 1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Align(
                                alignment: Alignment(0.0, -0.1),
                                child: Text(
                                  "Buy Now",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: 12, color: Color(0xff000000)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
