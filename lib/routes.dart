import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/screens/ProKitScreenListing.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ASplashScreen.dart';
import 'package:prokit_flutter/fullApps/banking/screen/BankingSplash.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMSplashScreen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/splash_screen.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/model/CSDataModel.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSSplashScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPSplashScreen.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DASplashScreen.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/ev_splash_screen.dart';
import 'package:prokit_flutter/fullApps/eventApp/screens/EASplashScreen.dart';
import 'package:prokit_flutter/fullApps/food/screen/FoodWalkThrough.dart';
import 'package:prokit_flutter/fullApps/grocery/screen/GrocerySplash.dart';
import 'package:prokit_flutter/fullApps/hairSalon/screens/BHSplashScreen.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/splash_screen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSSplashScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBSplashScreen.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSWalkThroughScreen.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerWalkThrough.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIASplashScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLSplashScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MSplashScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSplashScreen.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_splash_screen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBSplashScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPSplashScreen.dart';
import 'package:prokit_flutter/fullApps/orapay/screens/op_splash_screen.dart';
import 'package:prokit_flutter/fullApps/qibus/screen/QIBusSplash.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizSignIn.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCSplashScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFSplashScreen.dart';
import 'package:prokit_flutter/fullApps/shopHop/screens/ShSplashScreen.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDSplashScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHSplashScreen.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/screen/SSSplashScreen.dart';
import 'package:prokit_flutter/fullApps/social/screen/SocialWalkThrough.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/SVSplashScreen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/screens/splash_screen.dart';
import 'package:prokit_flutter/fullApps/walletApp/screen/WASplashScreen.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ProKitScreenListing.tag: (context) => ProKitScreenListing(ProTheme()),
    SMSplashScreen.tag: (context) => SMSplashScreen(),
    EVSplashScreen.tag: (context) => EVSplashScreen(),
    SplashScreen.tag: (context) => SplashScreen(),
    CareaSplashScreen.tag: (context) => CareaSplashScreen(),
    RFSplashScreen.tag: (context) => RFSplashScreen(),
    ASplashScreen.tag: (context) => ASplashScreen(),
    NMPSplashScreen.tag: (context) => NMPSplashScreen(),
    JSSplashScreen.tag: (context) => JSSplashScreen(),
    JCBSplashScreen.tag: (context) => JCBSplashScreen(),
    SVSplashScreen.tag: (context) => SVSplashScreen(),
    BMSplashScreen.tag: (context) => BMSplashScreen(),
    LSWalkThroughScreen.tag: (context) => LSWalkThroughScreen(),
    MIASplashScreen.tag: (context) => MIASplashScreen(),
    RCSplashScreen.tag: (context) => RCSplashScreen(),
    CPSplashScreen.tag: (context) => CPSplashScreen(),
    SSSplashScreen.tag: (context) => SSSplashScreen(),
    SHSplashScreen.tag: (context) => SHSplashScreen(),
    WASplashScreen.tag: (context) => WASplashScreen(),
    EASplashScreen.tag: (context) => EASplashScreen(),
    MLSplashScreen.tag: (context) => MLSplashScreen(),
    DASplashScreen.tag: (context) => DASplashScreen(),
    MSplashScreen.tag: (context) => MSplashScreen(),
    CSSplashScreen.tag: (context) => CSSplashScreen(),
    NBSplashScreen.tag: (context) => NBSplashScreen(),
    SDSplashScreen.tag: (context) => SDSplashScreen(),
    MPSplashScreen.tag: (context) => MPSplashScreen(),
    BankingSplash.tag: (context) => BankingSplash(),
    BHSplashScreen.tag: (context) => BHSplashScreen(),
    LearnerWalkThrough.tag: (context) => LearnerWalkThrough(),
    QuizSignIn.tag: (context) => QuizSignIn(),
    ShSplashScreen.tag: (context) => ShSplashScreen(),
    FoodWalkThrough.tag: (context) => FoodWalkThrough(),
    GrocerySplashScreen.tag: (context) => GrocerySplashScreen(),
    OPSplashScreen.tag: (context) => OPSplashScreen(),
    MuviSplashScreen.tag: (context) => MuviSplashScreen(),
    SocialWalkThrough.tag: (context) => SocialWalkThrough(),
    QIBusSplash.tag: (context) => QIBusSplash(),
  };
}
