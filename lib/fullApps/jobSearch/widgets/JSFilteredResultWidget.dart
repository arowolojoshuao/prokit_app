import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSJobDetailComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSRemoveJobComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSHomeScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';
import 'package:prokit_flutter/main.dart';

class JSFilteredResultWidget extends StatefulWidget {
  final JSPopularCompanyModel filteredResultsList;
  final String? city;
  final int? index;

  JSFilteredResultWidget({required this.filteredResultsList, this.city, this.index});

  @override
  State<JSFilteredResultWidget> createState() => _JSFilteredResultWidgetState();
}

class _JSFilteredResultWidgetState extends State<JSFilteredResultWidget> {
  List<JSPopularCompanyModel> removeJobsList = getRemoveJobsList();

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
    return !widget.filteredResultsList.isBlocked!
        ? Container(
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(spreadRadius: 0.6, blurRadius: 1, color: gray.withOpacity(0.5)),
              ],
              backgroundColor: context.scaffoldBackgroundColor,
            ),
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("new", style: primaryTextStyle(size: 14)),
                    Icon(
                      widget.filteredResultsList.selectSkill.validate() ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: widget.filteredResultsList.selectSkill.validate()
                          ? js_primaryColor
                          : appStore.isDarkModeOn
                              ? white
                              : black,
                    ).onTap(() {
                      widget.filteredResultsList.selectSkill = !widget.filteredResultsList.selectSkill.validate();
                      setState(() {});
                    }),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.filteredResultsList.companyName.validate(), style: boldTextStyle()),
                    8.width,
                    Icon(Icons.block, size: 20).onTap(() {
                      widget.filteredResultsList.isBlocked = !widget.filteredResultsList.isBlocked.validate();
                      setState(() {});
                    }),
                  ],
                ),
                4.height,
                Text(widget.filteredResultsList.totalReview.validate(), style: primaryTextStyle()),
                4.height,
                Text("Remote in ${widget.city.validate()}", style: primaryTextStyle()),
                8.height,
                Container(
                  decoration: boxDecorationRoundedWithShadow(
                    8,
                    backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : js_backGroundColor,
                  ),
                  padding: EdgeInsets.all(8),
                  //width: 165,
                  child: Row(
                    children: [
                      Icon(Icons.payment, size: 18),
                      4.width,
                      Text(
                        widget.filteredResultsList.companyImage.validate(),
                        style: boldTextStyle(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ).flexible(),
                    ],
                  ),
                ),
                16.height,
                Row(
                  children: [
                    Icon(Icons.send, size: 18, color: js_primaryColor),
                    4.width,
                    Text("Apply with your Indeed CV", style: secondaryTextStyle()),
                  ],
                ),
                8.height,
                Row(
                  children: [
                    Icon(Icons.person_add_alt_1, size: 18, color: Colors.red),
                    4.width,
                    Text("Hiring multiple candidates", style: secondaryTextStyle()),
                  ],
                ),
                8.height,
                Row(
                  children: [
                    Icon(Icons.timer, size: 18, color: gray.withOpacity(0.8)),
                    4.width,
                    Text("Urgently needed", style: secondaryTextStyle()),
                  ],
                ),
                16.height,
                Text(widget.filteredResultsList.totalDays.validate(), style: secondaryTextStyle()),
              ],
            ),
          ).onTap(() {
            // Add BottomSheet Code
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              builder: (context) {
                return FractionallySizedBox(
                  heightFactor: 0.90,
                  child: Stack(
                    children: [
                      JSJobDetailComponent(filteredResultsList: widget.filteredResultsList),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 8,
                        child: AppButton(
                          onTap: () {
                            JSHomeScreen().launch(context);
                          },
                          width: context.width(),
                          margin: EdgeInsets.all(16),
                          color: js_primaryColor,
                          child: Text("Apply Now", style: boldTextStyle(color: white)),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          })
        : Container(
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(spreadRadius: 0.5, blurRadius: 1, color: gray.withOpacity(0.5)),
              ],
              backgroundColor: context.scaffoldBackgroundColor,
            ),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(16),
            width: context.width(),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.block, size: 20),
                    8.width,
                    Text("Job Remove", style: boldTextStyle()),
                  ],
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                          ),
                          builder: (context) {
                            return FractionallySizedBox(
                              heightFactor: 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {
                                        finish(context);
                                      },
                                      padding: EdgeInsets.all(16),
                                      icon: Icon(Icons.close, size: 20),
                                      alignment: Alignment.topRight,
                                    ),
                                  ),
                                  Text("Why did you removw this job?", style: boldTextStyle()).paddingSymmetric(horizontal: 16),
                                  8.height,
                                  Text(
                                    "Selecting what could be improved will make your search results more relevant.",
                                    style: primaryTextStyle(size: 14),
                                  ).paddingSymmetric(horizontal: 16),
                                  JSRemoveJobComponent(),
                                  Divider(),
                                  AppButton(
                                    onTap: () {
                                      finish(context);
                                      snackBar(context, title: 'Thanks for a feedback');
                                    },
                                    width: context.width(),
                                    margin: EdgeInsets.all(16),
                                    color: js_primaryColor,
                                    child: Text("Send feedback", style: boldTextStyle(color: white)),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: OutlinedButton.styleFrom(side: BorderSide(width: 1.0, color: js_primaryColor)),
                      child: Text("Give feedBack", style: boldTextStyle(color: js_primaryColor)),
                    ),
                    16.width,
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(side: BorderSide(width: 1.0, color: js_primaryColor)),
                      child: Text("Undo", style: boldTextStyle(color: js_primaryColor)),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
