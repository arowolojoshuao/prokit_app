import 'package:flutter/material.dart';

abstract class BaseLanguage {
  static BaseLanguage of(BuildContext context) => Localizations.of<BaseLanguage>(context, BaseLanguage)!;

  String get lblDocumentation;

  String get lblChangeLog;

  String get lblShareApp;

  String get lblRateUs;

  String get lblDarkMode;

  String get lblSettings;

  String get lblLanguage;

  String get lblSupportLanguage;

  String get lblDefaultTheme;

  String get lblWidgets;

  String get lblFullApps;

  String get lblDashboard;

  String get lblIntegration;

  String get lblThemeList;

  String get lblScreenList;

  String get lblFileManagerApp;

  String get lblTheme1Screen;

  String get lblExerciseTipsApp;

  String get lblTheme2Screen;

  String get lblFoodRecipeApp;

  String get lblTheme3Screen;

  String get lblFeedApp;

  String get lblTheme4ScreenApp;

  String get lblEWalletApp;

  String get lblTheme5Screen;

  String get lblGYMApp;

  String get lblTheme6Screen;

  String get lblHotelBookingApp;

  String get lblTheme7Screen;

  String get lblQuizApp;

  String get lblTheme8Screen;

  String get lblLearnerApp;

  String get lblTheme9Screen;

  String get lblECommerceApp;

  String get lblTheme10Screen;

  String get lblMusicStreamingApp;

  String get lblTheme11Screen;

  String get lblDigitalWalletApp;

  String get lblTheme12Screen;

  String get lblRealStateApp;

  String get lblTheme13Screen;

  String get lblDiamondKitApp;

  String get lblTheme14Screen;

  String get lblSetupConfiguration;

  String get lblVersionHistory;

  String get lblShareWithFriends;

  String get lblRateGooglePlayStore;

  String get lblContactUs;

  String get lblGetInTouchWithUs;

  String get lblAboutUs;

  String get lblVersion;

  String get lblProkitUIDesignKit;

  String get lblAboutUsDescription;
}
