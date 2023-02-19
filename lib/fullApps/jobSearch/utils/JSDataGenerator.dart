import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSJobCompanies.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSJobSearchScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSProfileScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSReviewAndSaveScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSSearchResultScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSSettingScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSImage.dart';

List<JSPopularCompanyModel> getPopularCompanyData() {
  List<JSPopularCompanyModel> list = [];
  list.add(JSPopularCompanyModel(companyImage: js_google, companyName: "Google", companyRatting: 5.0, totalReview: "120 Reviews"));
  list.add(JSPopularCompanyModel(companyImage: js_infosys, companyName: "Infosys", companyRatting: 4.2, totalReview: "60 Reviews"));
  list.add(JSPopularCompanyModel(companyImage: js_itc, companyName: "ITC Ltd", companyRatting: 3.0, totalReview: "100 Reviews"));
  list.add(JSPopularCompanyModel(companyImage: js_hcl, companyName: "HCL Technologies", companyRatting: 4.5, totalReview: "100 Reviews"));
  list.add(JSPopularCompanyModel(companyImage: js_wipro, companyName: "Wipro", companyRatting: 2.5, totalReview: "50 Reviews"));

  return list;
}

List<JSPopularCompanyModel> getSkillData() {
  List<JSPopularCompanyModel> skillList = [];
  skillList.add(JSPopularCompanyModel(companyName: "Adobe", selectSkill: false));
  skillList.add(JSPopularCompanyModel(companyName: "Axure", selectSkill: false));
  skillList.add(JSPopularCompanyModel(companyName: "Azure", selectSkill: false));
  skillList.add(JSPopularCompanyModel(companyName: "Javascript", selectSkill: false));
  skillList.add(JSPopularCompanyModel(companyName: "Sketch", selectSkill: false));
  skillList.add(JSPopularCompanyModel(companyName: "UX", selectSkill: false));
  skillList.add(JSPopularCompanyModel(companyName: "User Experience", selectSkill: false));
  skillList.add(JSPopularCompanyModel(companyName: "Wireframe", selectSkill: false));

  return skillList;
}

List<JSPopularCompanyModel> getDrawerList1() {
  List<JSPopularCompanyModel> drawerList = [];
  drawerList.add(JSPopularCompanyModel(companyName: "Find Jobs", widget: JSJobSearchScreen()));
  drawerList.add(JSPopularCompanyModel(companyName: "Company Review", widget: JSReviewAndSaveScreen()));
  drawerList.add(JSPopularCompanyModel(companyName: "Salary Search", widget: JSSearchResultScreen()));

  return drawerList;
}

List<JSPopularCompanyModel> getDrawerList2() {
  List<JSPopularCompanyModel> drawerList = [];
  drawerList.add(JSPopularCompanyModel(selectSkill: false, companyName: "Profile", widget: JSProfileScreen()));
  drawerList.add(JSPopularCompanyModel(selectSkill: false, companyName: "My Jobs", widget: JSJobCompanies()));
  drawerList.add(JSPopularCompanyModel(selectSkill: false, companyName: "My Reviews", widget: JSReviewAndSaveScreen()));
  drawerList.add(JSPopularCompanyModel(selectSkill: false, companyName: "Email Settings"));
  drawerList.add(JSPopularCompanyModel(selectSkill: false, companyName: "Settings", widget: JSSettingScreen()));
  drawerList.add(JSPopularCompanyModel(selectSkill: true, companyName: "Country and Language", companyImage: js_usFlag, totalReview: "united Kingdom"));
  drawerList.add(JSPopularCompanyModel(selectSkill: false, companyName: "Help Center"));
  drawerList.add(
    JSPopularCompanyModel(
      selectSkill: false,
      companyName: "Sign Out",
      totalReview: "nd15n545lnz@privaterelay.applied.com",
      widget: SizedBox(),
    ),
  );

  return drawerList;
}

List<JSPopularCompanyModel> getPopularSearchList() {
  List<JSPopularCompanyModel> popularSearchList = [];
  popularSearchList.add(JSPopularCompanyModel(companyName: "Supermarket"));
  popularSearchList.add(JSPopularCompanyModel(companyName: "Healthcare"));
  popularSearchList.add(JSPopularCompanyModel(companyName: "Call Center"));
  popularSearchList.add(JSPopularCompanyModel(companyName: "Delivery Driver"));
  popularSearchList.add(JSPopularCompanyModel(companyName: "Customer Service"));
  popularSearchList.add(JSPopularCompanyModel(companyName: "Work From Home"));
  popularSearchList.add(JSPopularCompanyModel(companyName: "Temporary"));
  popularSearchList.add(JSPopularCompanyModel(companyName: "Full Time"));
  popularSearchList.add(JSPopularCompanyModel(companyName: "Warehouse"));

  return popularSearchList;
}

List<JSPopularCompanyModel> getFilteredResultsData() {
  List<JSPopularCompanyModel> filteredResultsList = [];
  filteredResultsList
      .add(JSPopularCompanyModel(totalDays: "Today", companyName: "UX DESIGNER - REMOTE", selectSkill: false, totalReview: "dnvod25", companyImage: "\$350 - \$400 a year", isBlocked: false));
  filteredResultsList
      .add(JSPopularCompanyModel(totalDays: "6 days ago", companyName: "UX/UI Designer", selectSkill: false, totalReview: "65jhbsd", companyImage: "\$500 - \$600 a year", isBlocked: false));
  filteredResultsList
      .add(JSPopularCompanyModel(totalDays: "10 days ago ", companyName: "Senior UX Designer ", selectSkill: false, totalReview: "Red Cloud", companyImage: "\$100 - \$250 a year", isBlocked: false));
  filteredResultsList.add(
      JSPopularCompanyModel(totalDays: "2 days ago ", companyName: "Junior UI/UX Designer", selectSkill: false, totalReview: "Bench Samuels", companyImage: "\$300 - \$350 a year", isBlocked: false));
  filteredResultsList
      .add(JSPopularCompanyModel(totalDays: "4 days ago ", companyName: "Android Developer", selectSkill: false, totalReview: "Jack Smit", companyImage: "\$600 - \800 a year", isBlocked: false));
  filteredResultsList
      .add(JSPopularCompanyModel(totalDays: "5 days ago ", companyName: "Flutter Developer", selectSkill: false, totalReview: "dnvod25", companyImage: "\$200 - \$250 a year", isBlocked: false));
  filteredResultsList
      .add(JSPopularCompanyModel(totalDays: "11 days ago ", companyName: "Java Developer", selectSkill: false, totalReview: "Denni Jhon", companyImage: "\$350 - \$500 a year", isBlocked: false));
  filteredResultsList
      .add(JSPopularCompanyModel(totalDays: "6 days ago ", companyName: "Php Developer", selectSkill: false, totalReview: "Devid Bettely", companyImage: "\$350 - \$400 a year", isBlocked: false));

  return filteredResultsList;
}

List<JSPopularCompanyModel> getSkillList() {
  List<JSPopularCompanyModel> skillList = [];
  skillList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Wireframe"));
  skillList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Axure"));
  skillList.add(JSPopularCompanyModel(isBlocked: false, companyName: "JavaScript"));
  skillList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Azure"));
  skillList.add(JSPopularCompanyModel(isBlocked: false, companyName: "UI"));

  return skillList;
}

List<JSPopularCompanyModel> getRemoveJobsList() {
  List<JSPopularCompanyModel> removeJobsList = [];
  removeJobsList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Company", totalDays: "Not interested in 'Imperial Ventures'"));
  removeJobsList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Not a match", totalDays: "Doesn't match 'graphics designer'"));
  removeJobsList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Wrong location", totalDays: "Doesn't match"));
  removeJobsList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Repetitive", totalDays: "Already seen or applied to this job"));
  removeJobsList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Pay or salary", totalDays: "Not listed or not accurate for 'graphics designer'"));
  removeJobsList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Other", totalDays: ""));

  return removeJobsList;
}

List<JSPopularCompanyModel> getRemoteList() {
  List<JSPopularCompanyModel> remoteList = [];
  remoteList.add(JSPopularCompanyModel(index: 0, companyName: "All jobs"));
  remoteList.add(JSPopularCompanyModel(index: 1, companyName: "Remote jobs only"));

  return remoteList;
}

List<JSPopularCompanyModel> getSortByList() {
  List<JSPopularCompanyModel> sortByList = [];
  sortByList.add(JSPopularCompanyModel(index: 0, companyName: "Relevance"));
  sortByList.add(JSPopularCompanyModel(index: 1, companyName: "Date"));

  return sortByList;
}

List<JSPopularCompanyModel> getDatePostedList() {
  List<JSPopularCompanyModel> datePostedList = [];
  datePostedList.add(JSPopularCompanyModel(index: 0, companyName: "All jobs"));
  datePostedList.add(JSPopularCompanyModel(index: 1, companyName: "Last 24 hours"));
  datePostedList.add(JSPopularCompanyModel(index: 2, companyName: "Last 3 days"));
  datePostedList.add(JSPopularCompanyModel(index: 3, companyName: "Last 14 days"));

  return datePostedList;
}

List<JSPopularCompanyModel> getDesireJobTypeList() {
  List<JSPopularCompanyModel> desireJobTypeList = [];
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Full Time"));
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Part-Time"));
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Permanent"));
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Fixed term"));
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Temporary"));

  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Freelance"));
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Temp to prem"));
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Zero hours"));
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Volunteer"));
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Apprenticeship"));
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Internship"));
  desireJobTypeList.add(JSPopularCompanyModel(isBlocked: false, companyName: "Graduate"));

  return desireJobTypeList;
}

List<JSPopularCompanyModel> getQuestionList() {
  List<JSPopularCompanyModel> questionList = [];
  questionList.add(
    JSPopularCompanyModel(
        totalReview: "See 56 answers",
        companyName: "Tell me about a challenge or conflict you’ve faced at work, and how you dealt with it.",
        companyImage: "Asked 10 "
            "May "
            "2017",
        dateAnswere: "Answered 10 May 2017",
        totalDays: "You’re "
            "probably "
            "not "
            "eager to talk about "
            "conflicts you’ve had at work during a job interview. But if you’re asked directly, don’t pretend you’ve never had one."),
  );
  questionList.add(JSPopularCompanyModel(
      totalReview: "See 26 answers",
      companyName: "Tell me about a time you demonstrated leadership skills",
      companyImage: "Asked 15 June 2018",
      dateAnswere: "Answered 15 June 2018",
      totalDays: "You don’t "
          "have "
          "to "
          "have a fancy title "
          "to "
          "act "
          "like"
          " a "
          "leader or demonstrate "
          "leadership skills. Think about a time when you headed up a project, took the initiative to propose."));
  questionList.add(JSPopularCompanyModel(
      totalReview: "See 40 answers",
      companyName: "How do you deal with pressure or stressful situations?",
      companyImage: "Asked 20 January 2018",
      dateAnswere: "Answered 20 January 2018",
      totalDays: "Here’s "
          "another "
          "question you may feel "
          "the "
          "urge "
          "to "
          "sidestep in an effort to"
          " prove you’re the perfect candidate who can handle anything."));
  questionList.add(JSPopularCompanyModel(
      totalReview: "See 25 answers",
      companyName: "What other companies are you interviewing with?",
      companyImage: "Asked 30 july 2019",
      dateAnswere: "Answered 30 july 2019",
      totalDays: "Companies might "
          "ask "
          "you "
          "who "
          "else you’re "
          "interviewing "
          "with "
          "for a"
          " few reasons. "
          "Maybe they want to see how serious you are about this role and team."));
  questionList.add(JSPopularCompanyModel(
      totalReview: "See 45 answers",
      companyName: "What should I know that’s not on your resume?",
      companyImage: "Asked 22 May 2019",
      dateAnswere: "Answered 22 May 2019",
      totalDays: "It’s a good sign if"
          " a "
          "recruiter "
          "or hiring "
          "manager "
          "is "
          "interested "
          "in more than just "
          "what’s on your resume. "));
  questionList.add(JSPopularCompanyModel(
      totalReview: "See 60 answers",
      companyName: "What do you think we could do better or differently?",
      companyImage: "Asked 27 october 2020",
      dateAnswere: "Answered 27 october 2020",
      totalDays: "This "
          "question can really do a number on "
          "you. "
          "How "
          "do "
          "you "
          "give a meaty answer"
          " without insulting the company or, worse, the person you’re speaking with? Well first, take a deep breath."));

  return questionList;
}

List<JSPopularCompanyModel> getReviewDraftList() {
  List<JSPopularCompanyModel> reviewDraftList = [];
  reviewDraftList.add(
    JSPopularCompanyModel(
        companyName: "Smit Jhon",
        companyImage: "London",
        totalDays: "smit@gmail.com",
        index: 1234567890,
        dateAnswere: "UX Designer",
        jobLocation: "Premier Inn -London",
        totalReview: 'August 2021 to present',
        jobDescription: "This is my Description",
        deegryName: "BCA",
        deegryCompleteYear: 'August 2021',
        deegryDescription: "I am Completed BCA in 2021"),
  );

  reviewDraftList.add(
    JSPopularCompanyModel(
        companyName: "Sam Patel",
        companyImage: "USA",
        totalDays: "sam@gmail.com",
        index: 1489413162,
        dateAnswere: "UI/UX Designer",
        jobLocation: "Premier Inn -USA",
        totalReview: 'August 2022 to present',
        jobDescription: "This is my Description",
        deegryName: "CSC",
        deegryCompleteYear: 'August 2021',
        deegryDescription: "I am Completed CSC in 2021"),
  );

  reviewDraftList.add(
    JSPopularCompanyModel(
        companyName: "Denial Patel",
        companyImage: "London",
        totalDays: "smit@gmail.com",
        index: 1234567890,
        dateAnswere: "Flutter Developer",
        jobLocation: "Premier Inn -London",
        totalReview: 'August 2021 to present',
        jobDescription: "This is my Description",
        deegryName: "CSC",
        deegryCompleteYear: 'August 2021',
        deegryDescription: "I am Completed CSC in 2021"),
  );

  return reviewDraftList;
}
