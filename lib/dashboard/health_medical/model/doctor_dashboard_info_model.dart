import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/health_medical/utils/colors.dart';
import 'package:prokit_flutter/dashboard/health_medical/utils/images.dart';

class DoctorDashboardInfoModel {
  String? title;
  String? amount;
  String? actionText;
  Color? containerColor;
  String? docName;
  String? docCourse;
  String? docDateMonth;
  String? docTime;
  String? docImg;
  String? articlesText;
  String? articlesImg;

  DoctorDashboardInfoModel({
    this.title,
    this.amount,
    this.actionText,
    this.containerColor,
    this.docName,
    this.docCourse,
    this.docDateMonth,
    this.docTime,
    this.docImg,
    this.articlesText,
    this.articlesImg,
  });
}

List<DoctorDashboardInfoModel> getDoctorDataList() {
  List<DoctorDashboardInfoModel> tempDoctorData = [];

  tempDoctorData.add(
    DoctorDashboardInfoModel(
      title: 'Online Consultation',
      amount: '\$49',
      actionText: 'Find Doctor',
      containerColor: lightSkyBlueColor,
    ),
  );

  tempDoctorData.add(
    DoctorDashboardInfoModel(
      title: 'Visit a Doctor Offline',
      amount: '\$49',
      actionText: 'Appointment',
      containerColor: lightYellowColor,
    ),
  );

  return tempDoctorData;
}

DoctorDashboardInfoModel doctorData = DoctorDashboardInfoModel(
  docName: 'Dr. Asgard',
  docCourse: 'Dental Specialist',
  docDateMonth: 'Monday, june 22',
  docTime: 'At 08pm',
  docImg: img_doctor,
);

List<DoctorDashboardInfoModel> getArticlesDataList() {
  List<DoctorDashboardInfoModel> tempArticlesData = [];

  tempArticlesData.add(
    DoctorDashboardInfoModel(
      articlesText: 'How to make your teeth stronger naturally',
      articlesImg: img_person,
    ),
  );

  tempArticlesData.add(
    DoctorDashboardInfoModel(
      articlesText: 'How to make your teeth stronger naturally',
      articlesImg: img_person,
    ),
  );
  tempArticlesData.add(
    DoctorDashboardInfoModel(
      articlesText: 'How to make your teeth stronger naturally',
      articlesImg: img_person,
    ),
  );
  tempArticlesData.add(
    DoctorDashboardInfoModel(
      articlesText: 'How to make your teeth stronger naturally',
      articlesImg: img_person,
    ),
  );

  return tempArticlesData;
}
