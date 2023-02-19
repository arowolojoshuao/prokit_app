import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/health_medical/components/articles_component.dart';
import 'package:prokit_flutter/dashboard/health_medical/components/doctor_info_component.dart';
import 'package:prokit_flutter/dashboard/health_medical/model/doctor_dashboard_info_model.dart';
import 'package:prokit_flutter/dashboard/health_medical/utils/colors.dart';
import 'package:prokit_flutter/dashboard/health_medical/utils/common.dart';
import 'package:prokit_flutter/dashboard/health_medical/utils/constant.dart';
import 'package:prokit_flutter/dashboard/health_medical/utils/images.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/main.dart';

class HealthMedicalDashboard extends StatefulWidget {
  @override
  _HealthMedicalDashboardState createState() => _HealthMedicalDashboardState();
}

class _HealthMedicalDashboardState extends State<HealthMedicalDashboard> {
  double? txtWidthSize;
  double? txtHeightSize;

  List<DoctorDashboardInfoModel> setDoctorInfoList = getDoctorDataList();
  List<DoctorDashboardInfoModel> setArticlesList = getArticlesDataList();

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(ic_menu, height: 32, width: 32, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    ),
                  ),
                  Expanded(flex: 2, child: Image.asset(img_woman, height: 60, width: 60)),
                  SizedBox(
                    height: 60,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(ic_chat, height: 32, width: 32, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                              20.width,
                              Image.asset(ic_notification, height: 32, width: 32, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: -5,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: boxDecoration(),
                            child: Text('3', style: primaryTextStyle(color: Colors.white)),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 6,
                          child: Container(padding: EdgeInsets.all(6), decoration: boxDecoration()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              30.height,
              richText(
                text1: 'Hello, ',
                style1: secondaryTextStyle(size: 24),
                text2: 'Krishna',
                style2: boldTextStyle(size: 24),
              ),
              15.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, size: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                  Text(' Mumbai, India', style: primaryTextStyle()),
                ],
              ),
              15.height,
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.cardColor,
                  borderRadius: radius(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ic_search, height: 22, width: 22, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    10.width,
                    Text('Search Doctors, Health Issues', style: secondaryTextStyle(size: 16)),
                  ],
                ),
              ),
              20.height,
              Wrap(
                spacing: 16,
                children: List.generate(setDoctorInfoList.length, (index) {
                  DoctorDashboardInfoModel doctorData = setDoctorInfoList[index];
                  return DoctorInfoComponent(doctorData: doctorData);
                }),
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Upcoming Appointment', style: boldTextStyle(size: 18)),
                  Text('See All', style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : primaryHealthMedicalColor)),
                ],
              ),
              15.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizeListener(
                    onSizeChange: (size) {
                      txtWidthSize = size.width.toDouble();
                      txtHeightSize = size.height.toDouble();
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: txtHeightSize,
                          decoration: BoxDecoration(
                            color: context.cardColor,
                            borderRadius: radius(DEFAULT_CONTAINER_RADIUS),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: radius(10),
                                      child: Image.asset(doctorData.docImg!, height: 100, width: 80, fit: BoxFit.cover),
                                    ),
                                    10.width,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${doctorData.docName}', style: boldTextStyle(size: 20)),
                                        10.height,
                                        Text('${doctorData.docCourse}', style: secondaryTextStyle()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: txtWidthSize,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: primaryHealthMedicalColor.withOpacity(0.1),
                                  borderRadius: radiusOnly(bottomLeft: DEFAULT_CONTAINER_RADIUS, bottomRight: DEFAULT_CONTAINER_RADIUS),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_month, size: 16, color: primaryHealthMedicalColor),
                                        5.width,
                                        Text('${doctorData.docDateMonth}', style: primaryTextStyle(color: primaryHealthMedicalColor)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(ic_clock, height: 16, width: 16, color: primaryHealthMedicalColor),
                                        5.width,
                                        Text('${doctorData.docTime}', style: primaryTextStyle(color: primaryHealthMedicalColor)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 6,
                          top: 6,
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: appStore.isDarkModeOn ? Colors.white.withOpacity(0.3) : primaryHealthMedicalColor.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ).expand(),
                  ),
                  16.width,
                  RotatedBox(
                    quarterTurns: 3,
                    child: DottedBorderWidget(
                      radius: defaultRadius,
                      color: appStore.isDarkModeOn ? dividerMedicalDarkColor : Colors.black,
                      padding: EdgeInsets.all(8),
                      child: Text('Make A New', style: primaryTextStyle(), textAlign: TextAlign.center),
                    ),
                  ).withHeight(172),
                ],
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Articles', style: boldTextStyle(size: 18)),
                  Text('See All', style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : primaryHealthMedicalColor)),
                ],
              ),
              15.height,
              Wrap(
                spacing: 16,
                direction: Axis.vertical,
                children: List.generate(setArticlesList.length, (index) {
                  DoctorDashboardInfoModel articlesData = setArticlesList[index];
                  return ArticlesComponent(articlesData: articlesData);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
