import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/model/Dashboard1Model.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Constants.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/DashBoard1DataProvider.dart';

class MyFilesComponentWidget extends StatefulWidget {
  const MyFilesComponentWidget({Key? key}) : super(key: key);

  @override
  _MyFilesComponentWidgetState createState() => _MyFilesComponentWidgetState();
}

class _MyFilesComponentWidgetState extends State<MyFilesComponentWidget> {
  List<DashBoard1Model> myFilesList = getMyFilesList();
  int selectedIndex = 0;

  Widget mobileDeviceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('My Files', style: boldTextStyle(color: white)),
            AppButton(
              padding: EdgeInsets.all(12),
              onTap: () {},
              color: Colors.blue,
              child: TextIcon(
                text: 'Add New',
                prefix: Icon(Icons.add, color: white),
                textStyle: boldTextStyle(color: white),
              ),
            )
          ],
        ),
        16.height,
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: myFilesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            DashBoard1Model data = myFilesList[index];
            bool isMyIndex = selectedIndex == index;
            return HoverWidget(
              builder: (BuildContext context, bool isHovering) {
                return AnimatedContainer(
                  duration: 1000.milliseconds,
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: isHovering ? Colors.white54 : secondaryColor,
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: data.color!.withOpacity(0.5),
                            ),
                            child: SvgPicture.asset(data.img.validate(), color: data.color, fit: BoxFit.cover),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(iconTheme: IconThemeData(color: Colors.white)),
                            child: PopupMenuButton<int>(
                              color: secondaryColor,
                              itemBuilder: (context) => [
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Text("Edit", style: primaryTextStyle(color: white)),
                                ),
                                PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: Text("Delete", style: primaryTextStyle(color: white)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(data.title.validate(), maxLines: 1, overflow: TextOverflow.ellipsis, style: boldTextStyle(color: white)),
                      ProgressLine(color: data.color, percentage: data.percentage),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${data.noOfFiles} Files", style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white70)),
                          Text(data.totalSize.validate(), style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget desktopDeviceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Files',
              style: boldTextStyle(color: white),
            ),
            AppButton(
              padding: EdgeInsets.all(12),
              onTap: () {},
              color: Colors.blue,
              child: TextIcon(
                text: 'Add New',
                prefix: Icon(Icons.add, color: white),
                textStyle: boldTextStyle(color: white),
              ),
            )
          ],
        ),
        16.height,
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: myFilesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            DashBoard1Model data = myFilesList[index];
            return HoverWidget(
              builder: (BuildContext context, bool isHovering) {
                return AnimatedContainer(
                  // margin: isHovering?EdgeInsets.all(4):null,
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: isHovering ? Colors.white54 : secondaryColor,
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  duration: 1000.milliseconds,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: data.color!.withOpacity(0.5),
                            ),
                            padding: EdgeInsets.all(16),
                            child: SvgPicture.asset(
                              data.img.validate(),
                              color: data.color,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(iconTheme: IconThemeData(color: Colors.white)),
                            child: PopupMenuButton<int>(
                              color: secondaryColor,
                              itemBuilder: (context) => [
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Text(
                                    "Edit",
                                    style: primaryTextStyle(color: white),
                                  ),
                                ),
                                PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: Text(
                                    "Delete",
                                    style: primaryTextStyle(color: white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        data.title.validate(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: boldTextStyle(color: white),
                      ),
                      ProgressLine(
                        color: data.color,
                        percentage: data.percentage,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${data.noOfFiles} Files",
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white70),
                          ),
                          Text(
                            data.totalSize.validate(),
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget tabletDeviceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Files',
              style: boldTextStyle(color: white),
            ),
            AppButton(
              padding: EdgeInsets.all(12),
              onTap: () {},
              color: Colors.blue,
              child: TextIcon(
                text: 'Add New',
                prefix: Icon(Icons.add, color: white),
                textStyle: boldTextStyle(color: white),
              ),
            )
          ],
        ),
        16.height,
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: myFilesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            DashBoard1Model data = myFilesList[index];
            return HoverWidget(
              builder: (BuildContext context, bool isHovering) {
                return AnimatedContainer(
                  // margin: isHovering?EdgeInsets.all(4):null,
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: isHovering ? Colors.white54 : secondaryColor,
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  duration: 1000.milliseconds,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: data.color!.withOpacity(0.5),
                            ),
                            padding: EdgeInsets.all(16),
                            child: SvgPicture.asset(
                              data.img.validate(),
                              color: data.color,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(iconTheme: IconThemeData(color: Colors.white)),
                            child: PopupMenuButton<int>(
                              color: secondaryColor,
                              itemBuilder: (context) => [
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Text(
                                    "Edit",
                                    style: primaryTextStyle(color: white),
                                  ),
                                ),
                                PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: Text(
                                    "Delete",
                                    style: primaryTextStyle(color: white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        data.title.validate(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: boldTextStyle(color: white),
                      ),
                      ProgressLine(
                        color: data.color,
                        percentage: data.percentage,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${data.noOfFiles} Files",
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white70),
                          ),
                          Text(
                            data.totalSize.validate(),
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: mobileDeviceWidget(),
      tablet: tabletDeviceWidget(),
      web: desktopDeviceWidget(),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = WDPrimaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
