import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/locale/AppLocalizations.dart';
import 'package:prokit_flutter/locale/Languages.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../main.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isGoogleSignedIn = false;

  @observable
  String googleUserName = '';

  @observable
  String googleUserEmail = '';

  @observable
  String googleUserPhotoUrl = '';

  @observable
  bool isDarkModeOn = false;

  @observable
  bool isHover = false;

  @observable
  List<ProTheme> webListingList = [];

  @observable
  Color? scaffoldBackground;

  @observable
  Color? backgroundColor;

  @observable
  Color? backgroundSecondaryColor;

  @observable
  Color? textPrimaryColor;

  @observable
  Color? appColorPrimaryLightColor;

  @observable
  Color? textSecondaryColor;

  @observable
  Color? appBarColor;

  @observable
  Color? iconColor;

  @observable
  Color? iconSecondaryColor;

  @observable
  String selectedLanguageCode = defaultLanguage;

  @observable
  var selectedDrawerItem = -1;

  @action
  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value ?? !isDarkModeOn;

    if (isDarkModeOn) {
      scaffoldBackground = appBackgroundColorDark;

      appBarColor = appBackgroundColorDark;
      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white;
      appColorPrimaryLightColor = cardBackgroundBlackDark;

      iconColor = iconColorPrimary;
      iconSecondaryColor = iconColorSecondary;

      textPrimaryColor = whiteColor;
      textSecondaryColor = Colors.white54;

      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;
      shadowColorGlobal = appShadowColorDark;
    } else {
      scaffoldBackground = whiteColor;

      appBarColor = Colors.white;
      backgroundColor = Colors.black;
      backgroundSecondaryColor = appSecondaryBackgroundColor;
      appColorPrimaryLightColor = appColorPrimaryLight;

      iconColor = iconColorPrimaryDark;
      iconSecondaryColor = iconColorSecondaryDark;

      textPrimaryColor = appTextColorPrimary;
      textSecondaryColor = appTextColorSecondary;

      textPrimaryColorGlobal = appTextColorPrimary;
      textSecondaryColorGlobal = appTextColorSecondary;
      shadowColorGlobal = appShadowColor;
    }
    setStatusBarColor(scaffoldBackground!);

    setValue(isDarkModeOnPref, isDarkModeOn);
  }

  @action
  void toggleHover({bool value = false}) => isHover = value;

  @action
  Future<void> setLanguage(String val, {BuildContext? context}) async {
    selectedLanguageCode = val;

    await setValue(SELECTED_LANGUAGE_CODE, selectedLanguageCode);
    selectedLanguageDataModel = getSelectedLanguageModel();

    if (context != null) language = BaseLanguage.of(context);
    language = await AppLocalizations().load(Locale(selectedLanguageCode));
  }

  @action
  Future setWebListing(List<ProTheme> data) async {
    webListingList = data;
  }

  @action
  Future clearWebListing() async {
    webListingList.clear();
  }

  @action
  void setDrawerItemIndex(int aIndex) {
    selectedDrawerItem = aIndex;
  }

  @action
  Future<void> setValueGoogleSignIn({bool? val}) async {
    isGoogleSignedIn = val ?? !isGoogleSignedIn;

    setValue(isGoogleSignedInOnPref, isGoogleSignedIn);
  }

  @action
  Future<void> setGoogleUserName({String? name}) async {
    googleUserName = name!;

    setValue(USER_NAME, googleUserName);
  }

  @action
  Future<void> setGoogleUserEmail({String? email}) async {
    googleUserEmail = email!;

    setValue(USER_EMAIL, googleUserEmail);
  }

  @action
  Future<void> setGoogleUserPhotoUrl({String? photoUrl}) async {
    googleUserPhotoUrl = photoUrl!;

    setValue(USER_IMAGE, googleUserPhotoUrl);
  }
}
