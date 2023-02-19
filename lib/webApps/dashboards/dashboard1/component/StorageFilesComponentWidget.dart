import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/component/ChartComponenentWidget.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/model/Dashboard1Model.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/DashBoard1DataProvider.dart';

class StorageFilesDataComponent extends StatefulWidget {
  const StorageFilesDataComponent({Key? key}) : super(key: key);

  @override
  _StorageFilesDataComponentState createState() => _StorageFilesDataComponentState();
}

class _StorageFilesDataComponentState extends State<StorageFilesDataComponent> {
  List<DashBoard1Model> storageDataList = getStorageDetailList();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Storage Details', style: boldTextStyle(size: 18, color: white)),
            16.height,
            ChartComponentWidget(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: storageDataList.length,
              shrinkWrap: true,
              itemBuilder: (_, int index) {
                DashBoard1Model data = storageDataList[index];
                return HoverWidget(
                  builder: (BuildContext context, bool isHovering) {
                    return SettingItemWidget(
                      title: data.title.validate(),
                      titleTextStyle: boldTextStyle(color: white),
                      subTitle: '${data.noOfFiles.validate()} Files',
                      trailing: Text(
                        data.totalSize.validate(),
                        style: boldTextStyle(color: white),
                      ),
                      leading: SvgPicture.asset(data.img.validate(), color: data.color, fit: BoxFit.cover, height: 20, width: 20),
                      decoration: BoxDecoration(
                        color: isHovering ? Colors.white54 : null,
                        border: Border.all(width: 2, color: isHovering ? Colors.white54 : WDPrimaryColor.withOpacity(0.15)),
                        borderRadius: radius(16),
                      ),
                      onTap: () {},
                    ).paddingAll(8);
                  },
                );
              },
            )
          ],
        ),
      ),
      web: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Storage Details', style: boldTextStyle(size: 18, color: white)),
            16.height,
            ChartComponentWidget(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: storageDataList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                DashBoard1Model data = storageDataList[index];
                return HoverWidget(
                  builder: (BuildContext context, bool isHovering) {
                    return SettingItemWidget(
                      title: data.title.validate(),
                      subTitle: data.totalSize.validate(),
                      titleTextStyle: boldTextStyle(color: white),
                      subTitleTextStyle: secondaryTextStyle(),
                      decoration: BoxDecoration(
                        color: isHovering ? Colors.white54 : Colors.red,
                        border: Border.all(width: 2, color: isHovering ? Colors.white54 : WDPrimaryColor.withOpacity(0.15)),
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                      ),
                      leading: SvgPicture.asset(data.img.validate(), color: data.color, fit: BoxFit.cover, height: 20, width: 20),
                      onTap: () {
                        selectedIndex = index;
                      },
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
      tablet: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Storage Details', style: boldTextStyle(size: 18, color: white)),
            16.height,
            ChartComponentWidget(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: storageDataList.length,
              shrinkWrap: true,
              itemBuilder: (_, int index) {
                DashBoard1Model data = storageDataList[index];
                return HoverWidget(
                  builder: (BuildContext context, bool isHovering) {
                    return SettingItemWidget(
                      title: data.title.validate(),
                      subTitle: data.totalSize.validate(),
                      titleTextStyle: boldTextStyle(color: white),
                      subTitleTextStyle: secondaryTextStyle(),
                      decoration: BoxDecoration(
                        color: isHovering ? Colors.white54 : null,
                        border: Border.all(
                          width: 2,
                          color: isHovering ? Colors.white54 : WDPrimaryColor.withOpacity(0.15),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                      ),
                      leading: SvgPicture.asset(data.img.validate(), color: data.color, fit: BoxFit.cover, height: 20, width: 20),
                      onTap: () {
                        selectedIndex = index;
                      },
                    ).paddingAll(8);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
