import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/colors.dart';
import 'package:prokit_flutter/fullApps/carea/commons/data_provider.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';
import 'package:prokit_flutter/main.dart';

class CompletedComponent extends StatefulWidget {
  @override
  _CompletedComponentState createState() => _CompletedComponentState();
}

class _CompletedComponentState extends State<CompletedComponent> {
  List<CallingModel> activeData = activeDataList();
  TextEditingController? reviewController;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: activeData.length,
      padding: EdgeInsets.only(left: 16, bottom: 16, right: 16, top: 24),
      itemBuilder: (context, index) {
        CallingModel data = activeData[index];

        return Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            backgroundColor: context.cardColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : editTextBgColor,
                ),
                child: Image.asset(data.imageUrl.validate(), width: 50, height: 50, fit: BoxFit.fill),
              ),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.userName.validate(), style: boldTextStyle(size: 16)),
                  12.height,
                  Row(
                    children: [
                      Container(
                        decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: data.colorValue!),
                        height: 10,
                        width: 10,
                      ),
                      8.width,
                      Text(data.subTitle.validate(), style: secondaryTextStyle()),
                      8.width,
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: boxDecorationWithRoundedCorners(
                          backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : gray.withOpacity(0.3),
                        ),
                        child: Text('Completed', style: primaryTextStyle(size: 12)),
                      ),
                    ],
                  ),
                  12.height,
                  Row(
                    children: [
                      Text(data.countNumber.validate(), style: boldTextStyle()),
                      16.width,
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(32), topLeft: Radius.circular(32)),
                            ),
                            backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : editTextBgColor,
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    8.height,
                                    Container(height: 2, width: 30, color: gray.withOpacity(0.6)),
                                    16.height,
                                    Text('Leave a Review', style: boldTextStyle()),
                                    16.height,
                                    Divider(color: gray.withOpacity(0.4), height: 0, endIndent: 24, indent: 24),
                                    16.height,
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 16),
                                      padding: EdgeInsets.all(16),
                                      decoration: boxDecorationWithRoundedCorners(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        backgroundColor: context.cardColor,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: boxDecorationWithRoundedCorners(
                                              borderRadius: BorderRadius.all(Radius.circular(8)),
                                              backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : editTextBgColor,
                                            ),
                                            child: Image.asset(data.imageUrl.validate(), width: 50, height: 50, fit: BoxFit.fill),
                                          ),
                                          16.width,
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(data.userName.validate(), style: boldTextStyle(size: 16)),
                                              12.height,
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: boxDecorationWithRoundedCorners(
                                                      boxShape: BoxShape.circle,
                                                      backgroundColor: data.colorValue!,
                                                    ),
                                                    height: 10,
                                                    width: 10,
                                                  ),
                                                  8.width,
                                                  Text(data.subTitle.validate(), style: secondaryTextStyle()),
                                                  8.width,
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                    decoration: boxDecorationWithRoundedCorners(
                                                      backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : gray.withOpacity(0.3),
                                                    ),
                                                    child: Text('Completed', style: primaryTextStyle(size: 12)),
                                                  ),
                                                ],
                                              ),
                                              12.height,
                                              Text(data.countNumber.validate(), style: boldTextStyle()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    24.height,
                                    Text('How is your car?', style: boldTextStyle(size: 18)),
                                    Text('Please give your rating & also your review.', style: secondaryTextStyle()),
                                    16.height,
                                    RatingBarWidget(
                                      allowHalfRating: true,
                                      rating: 3,
                                      itemCount: 5,
                                      size: 26,
                                      inActiveColor: Colors.black,
                                      activeColor: appStore.isDarkModeOn ? editTextBgColor : black,
                                      onRatingChanged: (rating) {
                                        //
                                      },
                                    ),
                                    24.height,
                                    TextFormField(
                                      controller: reviewController,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: 16, right: 16),
                                        suffixIconConstraints: BoxConstraints(minHeight: 15, minWidth: 15),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: radius(defaultRadius),
                                          borderSide: BorderSide(color: context.iconColor, width: 0.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: radius(defaultRadius),
                                          borderSide: BorderSide(color: context.iconColor, width: 0.0),
                                        ),
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.only(right: 8),
                                          child: Image.asset("images/carea/ic_gallery.png", fit: BoxFit.fill, width: 14, height: 10),
                                        ),
                                      ),
                                    ).paddingSymmetric(horizontal: 16),
                                    16.height,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppButton(
                                          onTap: () {
                                            finish(context);
                                          },
                                          width: context.width(),
                                          elevation: 0.0,
                                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                                          color: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.5),
                                          child: Text('Cancel', style: boldTextStyle(), textAlign: TextAlign.center),
                                        ).expand(),
                                        16.width,
                                        AppButton(
                                          onTap: () {
                                            finish(context);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Your Review Added successfully', style: boldTextStyle()),
                                                backgroundColor: context.scaffoldBackgroundColor,
                                              ),
                                            );
                                          },
                                          width: context.width(),
                                          elevation: 0.0,
                                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                                          color: appStore.isDarkModeOn ? cardDarkColor : black,
                                          child: Text('Submit', style: boldTextStyle(color: white), textAlign: TextAlign.center),
                                        ).expand()
                                      ],
                                    ).paddingOnly(left: 16, right: 16, bottom: 24),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : black,
                          ),
                          child: Text('Leave Review', style: primaryTextStyle(size: 12, color: white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
