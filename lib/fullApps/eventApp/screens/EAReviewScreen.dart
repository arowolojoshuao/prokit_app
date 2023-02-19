import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/model/EAReviewModel.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';

class EAReviewScreen extends StatefulWidget {
  const EAReviewScreen({Key? key}) : super(key: key);

  @override
  _EAReviewScreenState createState() => _EAReviewScreenState();
}

class _EAReviewScreenState extends State<EAReviewScreen> {
  List<EAReviewModel> list = reviewList();
  TextEditingController reviewController = TextEditingController();

  Widget slideLeftBackground() {
    return Container(
      color: primaryColor1,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.arrow_back, color: Colors.white),
            10.width,
            Icon(Icons.info_outline, color: Colors.white),
            20.width,
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget SlideRight() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Reviews",
          backWidget: Icon(Icons.close, color: white).onTap(() {
            finish(context);
          }),
          center: true),
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              EAReviewModel data = list[index];
              return Dismissible(
                key: ValueKey<EAReviewModel>(list[index]),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    list.removeAt(index);
                  });
                },
                background: SlideRight(),
                secondaryBackground: slideLeftBackground(),
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      commonCachedNetworkImage(
                        data.image,
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ).cornerRadiusWithClipRRect(35),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name!, style: boldTextStyle()),
                          4.height,
                          RatingBarWidget(
                            onRatingChanged: (rating) {},
                            rating: data.rating!,
                            allowHalfRating: true,
                            itemCount: 5,
                            size: 16,
                            disable: true,
                            activeColor: primaryColor1,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_border_outlined,
                          ),
                          4.height,
                          data.msg == null
                              ? SizedBox()
                              : Text(
                                  data.msg.validate(),
                                  style: secondaryTextStyle(),
                                ).visible(data.msg!.isNotEmpty),
                          4.height,
                          Text(data.time!, style: secondaryTextStyle()),
                        ],
                      ).expand(),
                      Row(
                        children: [
                          Text(data.like!.toString(), style: secondaryTextStyle()).visible(data.like != null),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border, size: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationRoundedWithShadow(0, backgroundColor: context.cardColor),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RatingBarWidget(
                    onRatingChanged: (rating) {},
                    rating: 4.2,
                    allowHalfRating: true,
                    itemCount: 5,
                    size: 30,
                    activeColor: primaryColor1,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border_outlined,
                  ),
                  Divider(),
                  TextFormField(
                    controller: reviewController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Write a reviews",
                      suffixIcon: Icon(Icons.send, size: 30, color: primaryColor1).onTap(
                        () {
                          reviewController.clear();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
