import 'package:flutter/material.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/model/Dashboard1Model.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Constants.dart';

List<DashBoard1Model> getSideDrawerList() {
  List<DashBoard1Model> list = [];
  list.add(DashBoard1Model(title: 'DashBoard', img: menuIcon));
  list.add(DashBoard1Model(title: 'Transaction', img: menuTransactionIcon));
  list.add(DashBoard1Model(title: 'Task', img: menuTaskIcon));
  list.add(DashBoard1Model(title: 'Document', img: menuDocumentIcon));
  list.add(DashBoard1Model(title: 'Store', img: menuStoreIcon));
  list.add(DashBoard1Model(title: 'Notification', img: menuNotificationIcon));
  list.add(DashBoard1Model(title: 'Profile', img: menuProfileIcon));
  list.add(DashBoard1Model(title: 'Settings', img: menuSettingIcon));
  return list;
}

List<DashBoard1Model> getMyFilesList() {
  List<DashBoard1Model> list = [];
  list.add(
    DashBoard1Model(
      img: documentIcon,
      title: 'Documents',
      noOfFiles: 1328,
      totalSize: '1.9 GB',
      color: WDPrimaryColor,
      percentage: 35,
    ),
  );
  list.add(
    DashBoard1Model(
      img: googleDriveIcon,
      title: 'Google Drive',
      noOfFiles: 1328,
      totalSize: '2.9 GB',
      percentage: 35,
      color: Color(0xFFFFA113),
    ),
  );
  list.add(
    DashBoard1Model(
      img: oneDriveIcon,
      title: 'One Drive',
      noOfFiles: 1328,
      totalSize: '1 GB',
      percentage: 10,
      color: Color(0xFFA4CDFF),
    ),
  );
  list.add(
    DashBoard1Model(
      img: documentIcon,
      title: 'Documents',
      noOfFiles: 1328,
      totalSize: '1.9 GB',
      percentage: 78,
      color: Color(0xFF007EE5),
    ),
  );

  return list;
}

List<DashBoard1Model> getRecentFileList() {
  List<DashBoard1Model> list = [];
  list.add(
    DashBoard1Model(
      title: 'XD File',
      img: xdFileIcon,
      date: '01-03-2021',
      totalSize: '3.5 MB',
    ),
  );
  list.add(
    DashBoard1Model(
      title: 'Figma File',
      img: figmaFileIcon,
      date: '27-02-2021',
      totalSize: '19.0 MB',
    ),
  );
  list.add(
    DashBoard1Model(
      title: 'Document',
      img: documentIcon,
      date: '23-02-2021',
      totalSize: '32.5 MB',
    ),
  );
  list.add(
    DashBoard1Model(
      title: 'Sound File',
      img: soundFileIcon,
      date: '21-02-2021',
      totalSize: '3.5 MB',
    ),
  );
  list.add(
    DashBoard1Model(
      title: 'Media File',
      img: soundFileIcon,
      date: '21-02-2021',
      totalSize: '2.5 GB',
    ),
  );
  list.add(
    DashBoard1Model(
      title: 'Sales PDF',
      img: pdfFileIcon,
      date: '21-02-2021',
      totalSize: '3.5 MB',
    ),
  );
  list.add(
    DashBoard1Model(
      title: 'Excel File',
      img: excelFileIcon,
      date: '21-02-2021',
      totalSize: '34.5 MB',
    ),
  );

  return list;
}

List<DashBoard1Model> getStorageDetailList() {
  List<DashBoard1Model> list = [];
  list.add(
    DashBoard1Model(
      title: 'Document Files',
      img: documentIcon,
      noOfFiles: 1328,
      totalSize: '1.3 GB',
    ),
  );
  list.add(
    DashBoard1Model(
      title: 'Media Files',
      img: mediaIcon,
      noOfFiles: 1328,
      totalSize: '15.3 GB',
    ),
  );
  list.add(
    DashBoard1Model(
      title: 'Other Files',
      img: folderICon,
      noOfFiles: 1328,
      totalSize: '15.3 GB',
    ),
  );
  list.add(
    DashBoard1Model(
      title: 'Unknown',
      img: unknownIcon,
      noOfFiles: 1328,
      totalSize: '1.3 GB',
    ),
  );

  return list;
}
