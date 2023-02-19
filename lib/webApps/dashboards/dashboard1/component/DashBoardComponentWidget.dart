import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/component/AppBarComponentWidget.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/component/MyFilesComponentWidget.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/component/RecentFilesComponentWidget.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/component/StorageFilesComponentWidget.dart';

class DashBoardComponentWidget extends StatelessWidget {
  const DashBoardComponentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              16.height,
              Column(
                children: [
                  MyFilesComponentWidget(),
                  16.height,
                  RecentFilesComponentWidget(),
                  16.height,
                  StorageFilesDataComponent(),
                ],
              ),
              8.width,
            ],
          ),
        ),
      ),
      tablet: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // AppBarComponent(),
              16.height,
              SingleChildScrollView(
                child: Column(
                  children: [
                    MyFilesComponentWidget(),
                    16.height,
                    RecentFilesComponentWidget(),
                    16.height,
                    StorageFilesDataComponent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      web: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              AppBarComponent(),
              16.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      MyFilesComponentWidget(),
                      16.height,
                      RecentFilesComponentWidget(),
                    ],
                  ).expand(flex: 5),
                  8.width,
                  StorageFilesDataComponent().expand(flex: 2)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
