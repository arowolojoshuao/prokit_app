import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/model/Dashboard1Model.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Constants.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/DashBoard1DataProvider.dart';

class RecentFilesComponentWidget extends StatefulWidget {
  const RecentFilesComponentWidget({Key? key}) : super(key: key);

  @override
  _RecentFilesComponentWidgetState createState() => _RecentFilesComponentWidgetState();
}

class _RecentFilesComponentWidgetState extends State<RecentFilesComponentWidget> {
  List<DashBoard1Model> recentFileList = getRecentFileList();

  DataRow recentFileDataRow(DashBoard1Model fileInfo) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              SvgPicture.asset(fileInfo.img.validate(), height: 30, width: 30, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(fileInfo.title.validate(), style: boldTextStyle(color: white, size: 14)),
              ),
            ],
          ),
        ),
        DataCell(Text(fileInfo.date.validate(), style: boldTextStyle(color: white, size: 14))),
        DataCell(Text(fileInfo.totalSize.validate(), style: boldTextStyle(color: white, size: 14))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Files', style: boldTextStyle(color: white)),
          Container(
            width: double.infinity,
            child: DataTable(
              columnSpacing: 16,
              columns: [
                DataColumn(
                  label: Text('File Name', style: boldTextStyle(color: white)),
                ),
                DataColumn(
                  label: Text('Date', style: boldTextStyle(color: white)),
                ),
                DataColumn(
                  label: Text('Size', style: boldTextStyle(color: white)),
                )
              ],
              rows: List.generate(
                recentFileList.length,
                (index) {
                  return recentFileDataRow(recentFileList[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
