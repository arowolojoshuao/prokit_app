import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/model/DashBoard2DataModel.dart';

List<DashBoard2DataModel> menuDrawerList() {
  List<DashBoard2DataModel> _drawerList = [
    DashBoard2DataModel(
      name: 'Overview',
      icon: Feather.home,
      onTap: () {},
    ),
    DashBoard2DataModel(
      name: 'E-book',
      icon: Feather.book,
      onTap: () {},
    ),
    DashBoard2DataModel(
      name: 'My Courses',
      icon: MaterialCommunityIcons.table_heart,
      onTap: () {},
    ),
    DashBoard2DataModel(
      name: 'Purchase Course',
      icon: AntDesign.pluscircleo,
      onTap: () {},
    ),
    DashBoard2DataModel(
      name: 'Completed Courses',
      icon: MaterialCommunityIcons.sticker_check_outline,
      onTap: () {},
    ),
    DashBoard2DataModel(
      name: 'Community',
      icon: Ionicons.chatbubble_ellipses_outline,
      onTap: () {},
    ),
  ];
  return _drawerList;
}

List<DashBoard2DataModel> settingDrawerList() {
  List<DashBoard2DataModel> _drawerList = [
    DashBoard2DataModel(
      name: 'Profile',
      icon: Feather.user,
      onTap: () {},
    ),
    DashBoard2DataModel(
      name: 'Setting',
      icon: AntDesign.setting,
      onTap: () {},
    ),
    DashBoard2DataModel(
      name: 'Logout',
      icon: Feather.log_out,
      onTap: () {},
    ),
  ];
  return _drawerList;
}

List<DashBoard2DataModel> courseInProgressList() {
  List<DashBoard2DataModel> _courseInProgressList = [
    DashBoard2DataModel(
      name: 'App Design',
      date: 'Dec 15,2020',
      color: const Color(0xFFF4F2FF),
      textColor: const Color(0xFFB7B1D3),
      progressbarColor: const Color(0xFF7D7698),
      image: 'images/webDashboard2/app_design.jpg',
      progress: 20,
    ),
    DashBoard2DataModel(
      name: 'Web Design',
      date: 'Oct 15,2020',
      color: const Color(0xFFFFF3EB),
      textColor: const Color(0xFFD1A98F),
      progressbarColor: const Color(0xFFD1AB96),
      image: '$BaseUrl/images/webDashboard2/web_design.jpg',
      progress: 62,
    ),
    DashBoard2DataModel(
      name: 'UI Design',
      date: 'Nov 15,2020',
      color: const Color(0xFFECFBFF),
      textColor: const Color(0xFF82BBC4),
      progressbarColor: const Color(0xFF3E8D91),
      progress: 50,
      image: '$BaseUrl/images/webDashboard2/ui_design.jpg',
    ),
  ];
  return _courseInProgressList;
}

List<DashBoard2DataModel> categoryList() {
  List<DashBoard2DataModel> _categoryList = [
    DashBoard2DataModel(
      name: 'UI/UX Design',
      courseCount: 18,
      image: '$BaseUrl/images/webDashboard2/ui_category.jpg',
    ),
    DashBoard2DataModel(
      name: 'Marketing',
      courseCount: 34,
      image: '$BaseUrl/images/webDashboard2/marketing.jpg',
    ),
    DashBoard2DataModel(
      name: 'Development',
      courseCount: 126,
      image: 'images/webDashboard2/developing.jpg',
    ),
    DashBoard2DataModel(
      name: 'Business',
      courseCount: 213,
      image: '$BaseUrl/images/webDashboard2/business.jpg',
    ),
    DashBoard2DataModel(
      name: 'Game Development',
      courseCount: 69,
      image: '$BaseUrl/images/webDashboard2/marketing.jpg',
    ),
  ];
  return _categoryList;
}

List<DashBoard2DataModel> mentorList() {
  List<DashBoard2DataModel> _mentorList = [
    DashBoard2DataModel(
      name: 'Shino Smith',
      categoryName: 'UI/UX Design',
      courseCount: 18,
      followers: 1200,
      following: false,
      image: 'images/webDashboard2/mentor_1.jpg',
    ),
    DashBoard2DataModel(
      name: 'Mikel',
      categoryName: 'Marketer',
      courseCount: 24,
      followers: 900,
      following: false,
      image: 'images/webDashboard2/mentor_2.jpg',
    ),
    DashBoard2DataModel(
      name: 'Tohid Golkar',
      categoryName: 'Android Developer',
      courseCount: 640,
      followers: 1560,
      following: false,
      image: 'images/webDashboard2/mentor_3.jpg',
    ),
    DashBoard2DataModel(
      name: 'Mid Sakib',
      categoryName: 'Frontend Developer',
      courseCount: 85,
      followers: 3400,
      following: false,
      image: 'images/webDashboard2/mentor_4.jpg',
    ),
    DashBoard2DataModel(
      name: 'Wilson',
      categoryName: 'Game Developer',
      courseCount: 20,
      followers: 1180,
      following: false,
      image: 'images/webDashboard2/mentor_1.jpg',
    ),
  ];
  return _mentorList;
}
