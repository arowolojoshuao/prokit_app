import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';

class EAPurchaseScreen extends StatefulWidget {
  const EAPurchaseScreen({Key? key}) : super(key: key);

  @override
  _EAPurchaseScreenState createState() => _EAPurchaseScreenState();
}

class _EAPurchaseScreenState extends State<EAPurchaseScreen> {
  TextEditingController applyController = TextEditingController();
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              centerTitle: true,
              pinned: true,
              backgroundColor: primaryColor1,
              title: Text('Purchase Detail', style: boldTextStyle(color: white)),
              expandedHeight: context.height() * 0.5,
              iconTheme: IconThemeData(color: white),
              automaticallyImplyLeading: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryColor1,
                            primaryColor2,
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(22),
                      decoration: boxDecorationWithShadow(
                        backgroundColor: context.cardColor,
                        borderRadius: radius(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text("Quiet Clubbing VIP Heated RoofTop Party", style: boldTextStyle(size: 18)),
                              16.height,
                              Row(
                                children: [
                                  Icon(Icons.timelapse_rounded, size: 20),
                                  8.width,
                                  Text("SUN MAR.25-4:30 PM EST", style: primaryTextStyle()),
                                ],
                              ),
                              16.height,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Entypo.location, size: 16),
                                  8.width,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Stage 48", style: secondaryTextStyle()),
                                      6.height,
                                      Text("605 W 48th street, Manhattan, 1008 ", style: secondaryTextStyle()),
                                    ],
                                  ).expand(),
                                ],
                              ),
                              16.height,
                              Row(
                                children: [
                                  Icon(Icons.local_activity_outlined, size: 20),
                                  8.width,
                                  Text("2 vip Tickets - \$160", style: primaryTextStyle()),
                                ],
                              ),
                            ],
                          ).paddingAll(16),
                          Container(
                            decoration: boxDecorationWithRoundedCorners(backgroundColor: grey.withOpacity(0.1)),
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Price', style: primaryTextStyle()),
                                Text('\$160', style: boldTextStyle(color: primaryColor1)),
                              ],
                            ),
                          ),
                          20.height,
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              TextFormField(
                controller: applyController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Discount code",
                  isDense: true,
                  focusColor: grey.withOpacity(0.4),
                  focusedBorder: OutlineInputBorder(borderRadius: radius(8)),
                  border: OutlineInputBorder(borderRadius: radius(8)),
                  suffixIcon: Text('Apply', style: primaryTextStyle(color: primaryColor1))
                      .onTap(
                        () {},
                      )
                      .paddingOnly(top: 12, right: 8),
                ),
              ).paddingSymmetric(horizontal: 22, vertical: 8),
              HorizontalList(
                padding: EdgeInsets.only(left: 22, right: 22),
                itemCount: cardList.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationWithRoundedCorners(
                      border: Border.all(width: 1, color: isSelected == i ? primaryColor1 : white),
                      backgroundColor: context.cardColor,
                    ),
                    height: 110,
                    width: 110,
                    child: Image.network(cardList[i].image!, fit: BoxFit.fitWidth).paddingOnly(top: 8, bottom: 8),
                  ).onTap(
                    () {
                      isSelected = i;
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: commonButton(width: context.width(), btnText: "Get it").paddingAll(18),
    );
  }
}
