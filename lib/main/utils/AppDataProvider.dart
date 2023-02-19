import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/customPaint/card/CardScreen.dart';
import 'package:prokit_flutter/customPaint/chatBubble/ChatBubbleScreen.dart';
import 'package:prokit_flutter/customPaint/clock/ClockCustomPaintScreen.dart';
import 'package:prokit_flutter/customPaint/customCard/CustomCardScreen.dart';
import 'package:prokit_flutter/customPaint/customLoader/CustomLoaderScreen.dart';
import 'package:prokit_flutter/customPaint/customRoundBubbleAnimation/CustomRoundBubbleAnimationScreen.dart';
import 'package:prokit_flutter/customPaint/customTemperatureWidget/TemperatureWidgetScreen.dart';
import 'package:prokit_flutter/customPaint/shape/ShapeScreen.dart';
import 'package:prokit_flutter/dashboard/analytics/screens/analytics_dashboard.dart';
import 'package:prokit_flutter/dashboard/banking/screens/banking_dashboard.dart';
import 'package:prokit_flutter/dashboard/health_medical/screens/health_medical_dashboard.dart';
import 'package:prokit_flutter/dashboard/screen/Dashboard1.dart';
import 'package:prokit_flutter/dashboard/screen/Dashboard2.dart';
import 'package:prokit_flutter/dashboard/screen/Dashboard3.dart';
import 'package:prokit_flutter/dashboard/screen/Dashboard4.dart';
import 'package:prokit_flutter/dashboard/screen/Dashboard5.dart';
import 'package:prokit_flutter/dashboard/screen/Dashboard6.dart';
import 'package:prokit_flutter/dashboard/screen/Dashboard7.dart';
import 'package:prokit_flutter/dashboard/screen/Dashboard8.dart';
import 'package:prokit_flutter/dashboard/smart_home/screens/smart_home_dashboard.dart';
import 'package:prokit_flutter/dashboard/split_bill/screens/split_bill_dashboard.dart';
import 'package:prokit_flutter/dashboard/utility_tracker/screens/utility_tracker_dashboard.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ASplashScreen.dart';
import 'package:prokit_flutter/fullApps/banking/screen/BankingSplash.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMSplashScreen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/splash_screen.dart';
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
import 'package:prokit_flutter/integrations/screens/BarChart1Screen.dart';
import 'package:prokit_flutter/integrations/screens/BarChart2Screen.dart';
import 'package:prokit_flutter/integrations/screens/FingerprintAuthentication.dart';
import 'package:prokit_flutter/integrations/screens/GenerateQRCodeScreen.dart';
import 'package:prokit_flutter/integrations/screens/ImagePickerScreen.dart';
import 'package:prokit_flutter/integrations/screens/LikeButton/LBHomePage.dart';
import 'package:prokit_flutter/integrations/screens/LineChartScreen.dart';
import 'package:prokit_flutter/integrations/screens/LocalNotificationScreen.dart';
import 'package:prokit_flutter/integrations/screens/Marquee/MHomePage.dart';
import 'package:prokit_flutter/integrations/screens/MonthlySale1Screen.dart';
import 'package:prokit_flutter/integrations/screens/MonthlySale2Screen.dart';
import 'package:prokit_flutter/integrations/screens/PaymetGatways/FlutterWaveScreen.dart';
import 'package:prokit_flutter/integrations/screens/PaymetGatways/razorpay_screen.dart';
import 'package:prokit_flutter/integrations/screens/PieChartScreen.dart';
import 'package:prokit_flutter/integrations/screens/Shimmer/SHomePage.dart';
import 'package:prokit_flutter/integrations/screens/ShowViewCase/SVCHomePage.dart';
import 'package:prokit_flutter/integrations/screens/StackedChart1Screen.dart';
import 'package:prokit_flutter/integrations/screens/StackedChart2Screen.dart';
import 'package:prokit_flutter/integrations/screens/StackedChart3Screen.dart';
import 'package:prokit_flutter/integrations/screens/StackedChart4Screen.dart';
import 'package:prokit_flutter/integrations/screens/StackedChart5Screen.dart';
import 'package:prokit_flutter/integrations/screens/StackedChart6Screen.dart';
import 'package:prokit_flutter/integrations/screens/StickyHeader/AnimatedHeaders.dart';
import 'package:prokit_flutter/integrations/screens/StickyHeader/OverLappingHeaders.dart';
import 'package:prokit_flutter/integrations/screens/StickyHeader/SimpleHeaders.dart';
import 'package:prokit_flutter/integrations/screens/TransactionScreen.dart';
import 'package:prokit_flutter/integrations/screens/VideoPickerScreen.dart';
import 'package:prokit_flutter/integrations/screens/api/get_method_api_integration.dart';
import 'package:prokit_flutter/integrations/screens/api/post_method_api_integration.dart';
import 'package:prokit_flutter/integrations/screens/before_after_image_screen.dart';
import 'package:prokit_flutter/integrations/screens/button_screen.dart';
import 'package:prokit_flutter/integrations/screens/confetti/CHomePage.dart';
import 'package:prokit_flutter/integrations/screens/firebaseCrud/FUserListScreen.dart';
import 'package:prokit_flutter/integrations/screens/fluid_slider_screen.dart';
import 'package:prokit_flutter/integrations/screens/flutterCalender/CalenderHomePage.dart';
import 'package:prokit_flutter/integrations/screens/flutterTinderCard/TinderHomePage.dart';
import 'package:prokit_flutter/integrations/screens/folding_cell_screen.dart';
import 'package:prokit_flutter/integrations/screens/google_signin_screen.dart';
import 'package:prokit_flutter/integrations/screens/liquid_pull_to_refresh_screen.dart';
import 'package:prokit_flutter/integrations/screens/liquid_swipe_screen.dart';
import 'package:prokit_flutter/integrations/screens/pdfReader/LocalPdfViewerScreen.dart';
import 'package:prokit_flutter/integrations/screens/pdfReader/OnlinePdfViewerScreen.dart';
import 'package:prokit_flutter/integrations/screens/picker_screen.dart';
import 'package:prokit_flutter/integrations/screens/shader_mask_screen.dart';
import 'package:prokit_flutter/integrations/screens/singature_screen.dart';
import 'package:prokit_flutter/integrations/screens/wave_screen.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/AllTaskDoneScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/AllTaskDoneScreen2.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/EmptyCartScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/EmptyCartScreen2.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/EmptyCartScreen3.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/EmptyCartScreen4.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/EmptyCartScreen5.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/InboxScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/InboxScreen2.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoBalanceScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoBalanceScreen2.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoBalanceScreen3.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoBalanceScreen4.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoBalanceScreen5.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoChatsScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoChatsScreen2.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoChatsScreen3.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoChatsScreen4.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoChatsScreen5.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoEventScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoEventScreen2.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoEventScreen3.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoEventScreen4.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoMailScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoNotificationScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoNotificationScreen2.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoNotificationScreen3.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoNotificationScreen4.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoNotificationScreen5.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoPhotosScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoPhotosScreen2.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoPhotosScreen3.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoPhotosScreen4.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoPhotosScreen5.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoSentMailScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoVideosScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoVideosScreen2.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoVideosScreen3.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoVideosScreen4.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/NoVideosScreen5.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/TaskDoneScreen.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/TaskDoneScreen2.dart';
import 'package:prokit_flutter/singleScreens/emptyScreens/TaskDoneScreen3.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/ConnectionFailedScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/DeadEndScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/ErrorScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/HangOnScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/HmmScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/LocationAccessScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/MissingArticleScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/NoConnectionScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/NoFilesScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/NoResultsScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/NotEnoughSpace.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/OhNoScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/OppsHomeScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/OppsScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/PageNotFoundScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/PaymentFailedScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/RouterOfflineScreen.dart';
import 'package:prokit_flutter/singleScreens/errrorScreens/SomethingsNotRightScreen.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/ChoosePlanScreen1.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/ChoosePlanScreen2.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/ChoosePlanScreen3.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/ChoosePlanScreen4.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/ChoosePlanScreen5.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/ChoosePlanScreen6.dart';
import 'package:prokit_flutter/singleScreens/pricingPlans/ChoosePlanScreen7.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1BottomNavigation.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1BottomSheet.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1Card.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1Dashboard.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1Dialog.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1ImageSlider.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1Listing.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1Login.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1Profile.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1Search.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1Sidemenu.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1Signup.dart';
import 'package:prokit_flutter/themes/theme1/screen/T1WalkThrough.dart';
import 'package:prokit_flutter/themes/theme10/screens/T10Cards.dart';
import 'package:prokit_flutter/themes/theme10/screens/T10Dashboard.dart';
import 'package:prokit_flutter/themes/theme10/screens/T10Description.dart';
import 'package:prokit_flutter/themes/theme10/screens/T10Dialog.dart';
import 'package:prokit_flutter/themes/theme10/screens/T10Listing.dart';
import 'package:prokit_flutter/themes/theme10/screens/T10Profile.dart';
import 'package:prokit_flutter/themes/theme10/screens/T10SideMenu.dart';
import 'package:prokit_flutter/themes/theme10/screens/T10SignIn.dart';
import 'package:prokit_flutter/themes/theme10/screens/T10SignUp.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11BottomNavigationScreen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11Card1Screen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11Card2Screen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11DashboardScreen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11DescriptionScreen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11ListingScreen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11ProfileScreen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11SearchScreen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11SettingScreen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11SignInScreen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11SignUpScreen.dart';
import 'package:prokit_flutter/themes/theme11/screens/T11WalkThroughScreen.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_bottom_sheet.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_cards.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_dashboard.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_dialog.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_listing.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_profile.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_search.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_signin.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_signup.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_walkthrough.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13BottomNavigationScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13CardScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13DashboardScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13DescriptionScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13DialogScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13FilterScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13ListingScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13ProfileScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13SearchScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13SettingScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13SignInScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13SignUpScreen.dart';
import 'package:prokit_flutter/themes/theme13/screens/T13WalkThroughScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14AllMessagesListScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14AutorisationScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14CalendarScreen1.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14CalendarScreen2.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14CommunicationScreen3.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14CommunicationScreen4.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14FinanceScreen1.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14FinanceScreen2.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14FinanceScreen3.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14FinanceScreen4.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14FinanceScreen5.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14ProfileScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14RateScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SignInScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SignInScreen2.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SignInScreen3.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SignInScreen4.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SignUpScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SignUpScreen2.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SubscriptionScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SubscriptionScreen2.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SubscriptionScreen4.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SubscriptionScreen5.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SubscriptionScreen7.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14SuccessAndFailScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14TravelDetailScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14TravelScreen.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14TravelScreen2.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14TravelScreen3.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14TravelScreen4.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14WalkThroughScreen1.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14WalkThroughScreen2.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14WalkThroughScreen3.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14WalkThroughScreen4.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14WalkThroughScreen5.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14WalkThroughScreen6.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14WalkThroughScreen7.dart';
import 'package:prokit_flutter/themes/theme14/screens/T14WalkThroughScreen8.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2BottomNavigation.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2BottomSheet.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2Cards.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2Dashboard.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2Dialog.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2ImageSlider.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2Listing.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2Profile.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2Search.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2SideMenu.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2SignIn.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2SignUp.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2Walkthrough.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3BottomNavigation.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3BottomSheet.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Cards.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Dashboard.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Description.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Dialog.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3ImageSlider.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Listing.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Profile.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Search.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Setting.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3SideMenu.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3SignIn.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3SignUp.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Tab.dart';
import 'package:prokit_flutter/themes/theme3/screen/T3Walkthrough.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4BottomNavigation.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4Cards.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4Dashboard.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4Detail.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4Dialog.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4ImageSlider.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4Listing.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4Profile.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4SignIn.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4SignUp.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4Walkthrough.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5BottomNavigation.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5BottomSheet.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5Cards.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5Dashboard.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5Dialog.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5ImageSlider.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5Listing.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5Profile.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5Search.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5Settings.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5SignIn.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5SignUp.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5Walkthrough.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6BottomNavigation.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6Cards.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6Dashboard.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6Dialog.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6ImageSlider.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6List.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6Setting.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6SignIn.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6SignUp.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6WalkThrough.dart';
import 'package:prokit_flutter/themes/theme7/screens/T7BottomSheet.dart';
import 'package:prokit_flutter/themes/theme7/screens/T7Dashboard.dart';
import 'package:prokit_flutter/themes/theme7/screens/T7HotelBooking.dart';
import 'package:prokit_flutter/themes/theme7/screens/T7HotelDetail.dart';
import 'package:prokit_flutter/themes/theme7/screens/T7HotelList.dart';
import 'package:prokit_flutter/themes/theme7/screens/T7PlaceDetail.dart';
import 'package:prokit_flutter/themes/theme7/screens/T7Search.dart';
import 'package:prokit_flutter/themes/theme7/screens/T7SignIn.dart';
import 'package:prokit_flutter/themes/theme7/screens/T7SocialLogin.dart';
import 'package:prokit_flutter/themes/theme7/screens/T7WalkThrough.dart';
import 'package:prokit_flutter/themes/theme8/screen/T8BottomNavigation.dart';
import 'package:prokit_flutter/themes/theme8/screen/T8Cards.dart';
import 'package:prokit_flutter/themes/theme8/screen/T8Dashboard.dart';
import 'package:prokit_flutter/themes/theme8/screen/T8Listing.dart';
import 'package:prokit_flutter/themes/theme8/screen/T8Result.dart';
import 'package:prokit_flutter/themes/theme8/screen/T8Search.dart';
import 'package:prokit_flutter/themes/theme8/screen/T8Settings.dart';
import 'package:prokit_flutter/themes/theme8/screen/T8SignIn.dart';
import 'package:prokit_flutter/themes/theme8/screen/T8SignUp.dart';
import 'package:prokit_flutter/themes/theme9/screens/T9BottomNavigation.dart';
import 'package:prokit_flutter/themes/theme9/screens/T9Cards.dart';
import 'package:prokit_flutter/themes/theme9/screens/T9Dashboard.dart';
import 'package:prokit_flutter/themes/theme9/screens/T9Description.dart';
import 'package:prokit_flutter/themes/theme9/screens/T9List.dart';
import 'package:prokit_flutter/themes/theme9/screens/T9Profile.dart';
import 'package:prokit_flutter/themes/theme9/screens/T9Search.dart';
import 'package:prokit_flutter/themes/theme9/screens/T9SignIn.dart';
import 'package:prokit_flutter/themes/theme9/screens/T9SingUp.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/Dashboard1Screen.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/screens/HomeScreen.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/screens/HomeScreenMobile.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/screens/HomeScreenTablet.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/HomeScreen.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio1/Portfolio1Screen.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio2/Portfolio2Screen.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio3/Portfolio3Screen.dart';
import 'package:prokit_flutter/widgets/animationAndMotionWidgets/AMAnimatedBuilderScreen.dart';
import 'package:prokit_flutter/widgets/animationAndMotionWidgets/AMAnimatedContainerScreen.dart';
import 'package:prokit_flutter/widgets/animationAndMotionWidgets/AMAnimatedCrossFadeScreen.dart';
import 'package:prokit_flutter/widgets/animationAndMotionWidgets/AMAnimatedOpacityScreen.dart';
import 'package:prokit_flutter/widgets/animationAndMotionWidgets/AMAnimatedPositionedScreen.dart';
import 'package:prokit_flutter/widgets/animationAndMotionWidgets/AMAnimatedSizeScreen.dart';
import 'package:prokit_flutter/widgets/animationAndMotionWidgets/AMFadeTransitionScreen.dart';
import 'package:prokit_flutter/widgets/animationAndMotionWidgets/AMHeroScreen.dart';
import 'package:prokit_flutter/widgets/animationAndMotionWidgets/AMScaleTransitionScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWActionSheetScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWActivityIndicatorScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWAlertDialogScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWButtonScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWContextMenuScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWDialogScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWNavigationBarScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWPickerScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWSegmentedControlScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWSliderScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWSlidingSegmentedControlScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWSwitchScreen.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWTabBarWidgets/CWTabBarScreen1.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWTabBarWidgets/CWTabBarScreen2.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWTabBarWidgets/CWTabBarScreen3.dart';
import 'package:prokit_flutter/widgets/cupertinoWidgets/CWTextFieldScreen.dart';
import 'package:prokit_flutter/widgets/interactionModelWidgets/IMGestureDetectorScreen.dart';
import 'package:prokit_flutter/widgets/interactionModelWidgets/imDismissibleWidgets/IMDismissibleScreen1.dart';
import 'package:prokit_flutter/widgets/interactionModelWidgets/imDismissibleWidgets/IMDismissibleScreen2.dart';
import 'package:prokit_flutter/widgets/interactionModelWidgets/imDraggableWidgets/IMDraggableScreen1.dart';
import 'package:prokit_flutter/widgets/interactionModelWidgets/imDraggableWidgets/IMDraggableScreen2.dart';
import 'package:prokit_flutter/widgets/interactionModelWidgets/imLongPressDraggableWidgets/IMLongPressDraggableScreen1.dart';
import 'package:prokit_flutter/widgets/interactionModelWidgets/imLongPressDraggableWidgets/IMLongPressDraggableScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWAppBarScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWDrawerWidgets/MWDrawerScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWDrawerWidgets/MWDrawerScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWDrawerWidgets/MWDrawerScreen3.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWDrawerWidgets/MWDrawerScreen4.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWDrawerWidgets/MWDrawerScreen5.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWNavigationRailWidget/MWNavigationRailScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWNavigationRailWidget/MWNavigationRailScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWNavigationRailWidget/MWNavigationRailScreen3.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWSliverAppBarWidgets/MWSliverAppBarScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWSliverAppBarWidgets/MWSliverAppBarScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWTabBarWidgets/MWTabBarScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWTabBarWidgets/MWTabBarScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWTabBarWidgets/MWTabBarScreen3.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWTabBarWidgets/MWTabBarScreen4.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/mwBottomNavigationWidgets/MWBottomNavigationScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/mwBottomNavigationWidgets/MWBottomNavigationScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/mwBottomNavigationWidgets/MWBottomNavigationScreen3.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/mwBottomNavigationWidgets/MWBottomNavigationScreen4.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/mwBottomNavigationWidgets/MWBottomNavigationScreen5.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/mwBottomNavigationWidgets/MWBottomNavigationScreen6.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/mwBottomNavigationWidgets/MWBottomNavigationScreen7.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwButtonWidgets/MWDropDownButtonScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwButtonWidgets/MWFlatButtonScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwButtonWidgets/MWFloatingActionButtonScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwButtonWidgets/MWIconButtonScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwButtonWidgets/MWMaterialButtonScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwButtonWidgets/MWOutlineButtonScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwButtonWidgets/MWPopupMenuButtonScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwButtonWidgets/MWRaisedButtonScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWAlertDialogScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWBottomSheetScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWExpansionPannelWidgets/MWExpansionPanelScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWExpansionPannelWidgets/MWExpansionPanelScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWExpansionPannelWidgets/MWExpansionPanelScreen4.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWExpansionPannelWidgets/MWExpansionPanelScreen5.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWExpansionPannelWidgets/MWExpansionPanelScreen6.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWExpansionPannelWidgets/MWExpansionPanelScreen7.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWSimpleDialogScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWSnackBarScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWToastScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWCardScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWChipScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWDataTableScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWGridViewScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWIconScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWImageScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWListViewWidget/MWListViewScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWListViewWidget/MWListViewScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWListViewWidget/MWListViewScreen3.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWListViewWidget/MWListViewScreen4.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWListViewWidget/MWListViewScreen5.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWMaterialBanner.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWProgressBarScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWRichTextScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInformationDisplayWidgets/MWTooltipScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInputSelectionWidgets/MWCheckboxScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInputSelectionWidgets/MWDatetimePickerScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInputSelectionWidgets/MWRadioScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInputSelectionWidgets/MWSliderScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInputSelectionWidgets/MWSwitchScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInputSelectionWidgets/MWTextFieldWidgets/MWTextFieldScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInputSelectionWidgets/MWTextFieldWidgets/MWTextFieldScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwInputSelectionWidgets/MWTextFormFieldScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWDividerScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWListTileScreen.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWStepperWidget/MWStepperScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWStepperWidget/MWStepperScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWStepperWidget/MWStepperScreen3.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWStepperWidget/MWStepperScreen4.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/MWUserAccountDrawerHeaderScreen1.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/MWUserAccountDrawerHeaderScreen2.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/MWUserAccountDrawerHeaderScreen3.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/MWUserAccountDrawerHeaderScreen4.dart';
import 'package:prokit_flutter/widgets/otherWidgets/InteractiveViewerScreen.dart';
import 'package:prokit_flutter/widgets/otherWidgets/OpenContainerTransformScreen.dart';
import 'package:prokit_flutter/widgets/paintingAndEffectWidgets/PEBackdropFilterScreen.dart';
import 'package:prokit_flutter/widgets/paintingAndEffectWidgets/PEClipOvalScreen.dart';
import 'package:prokit_flutter/widgets/paintingAndEffectWidgets/PEOpacityScreen.dart';
import 'package:prokit_flutter/widgets/paintingAndEffectWidgets/PERotatedBoxScreen.dart';
import 'package:prokit_flutter/widgets/paintingAndEffectWidgets/PETransformScreen.dart';

import '../../integrations/screens/audioPicker/audio_picker.dart';

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(id: 1, name: 'English', languageCode: 'en', fullLanguageCode: 'en-US', flag: 'images/flag/ic_us.png'),
    LanguageDataModel(id: 2, name: 'Hindi', languageCode: 'hi', fullLanguageCode: 'hi-IN', flag: 'images/flag/ic_hi.png'),
    LanguageDataModel(id: 3, name: 'Arabic', languageCode: 'ar', fullLanguageCode: 'ar-AR', flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(id: 4, name: 'French', languageCode: 'fr', fullLanguageCode: 'fr-FR', flag: 'images/flag/ic_fr.png'),
  ];
}

Future<AppTheme> getAllAppsAndThemes() async {
  AppTheme appTheme = AppTheme();

  appTheme.themes = getThemes();
  appTheme.screenList = getScreenList();
  appTheme.dashboard = getDashboards();
  appTheme.fullApp = getFullApps();
  appTheme.widgets = getWidgets();
  appTheme.defaultTheme = getDefaultTheme();
  appTheme.integrations = getIntegrations();
  appTheme.webApps = getWebApps();

  return appTheme;
}

List<ProTheme> getThemes() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Diamond Kit', title_name: 'Theme 14 Screens', tag: '', show_cover: true, sub_kits: getDiamondKit(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Real State', title_name: 'Theme 13 Screens', type: '', show_cover: true, sub_kits: getRealState(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Digital Wallet', title_name: 'Theme 12 Screens', type: '', show_cover: true, sub_kits: getDigitalWallet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Music Streaming', title_name: 'Theme 11 Screens', tag: '', type: '', show_cover: true, sub_kits: getMusicStreaming(), darkThemeSupported: true));
  list.add(ProTheme(name: 'E-commerce', title_name: 'Theme 10 Screens', type: '', show_cover: true, sub_kits: getECommerce(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Learner', title_name: 'Theme 9 Screens', type: '', show_cover: true, sub_kits: getLearner(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Quiz', title_name: 'Theme 8 Screens', type: '', show_cover: true, sub_kits: getQuiz(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Hotel Booking', title_name: 'Theme 7 Screens', type: '', show_cover: true, sub_kits: getHotelBooking(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Gym', title_name: 'Theme 6 Screens', type: '', show_cover: true, sub_kits: getGymApp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'e-wallet', title_name: 'Theme 5 Screens', type: '', show_cover: true, sub_kits: getEWallet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Feed App', title_name: 'Theme 4 Screens', type: '', show_cover: true, sub_kits: getFeedApp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Food Recipe', title_name: 'Theme 3 Screens', type: '', show_cover: true, sub_kits: getFoodRecipe(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Exercise Tips', title_name: 'Theme 2 Screens', type: '', show_cover: true, sub_kits: getExerciseTips(), darkThemeSupported: true));
  list.add(ProTheme(name: 'File Manager', title_name: 'Theme 1 Screens', type: '', show_cover: true, sub_kits: getFileManageScreens(), darkThemeSupported: true));

  return list;
}

//region Screens
List<ProTheme> getDigitalWallet() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough', is_theme: true, type: '', widget: T12WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T12SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T12SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T12Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T12Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search', is_theme: true, type: '', widget: T12SearchScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T12TransactionList(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T12Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog', is_theme: true, type: '', widget: T12Dialog(), darkThemeSupported: true));
  list.add(ProTheme(name: 'BottomSheet', is_theme: true, type: '', widget: T12BottomSheet(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getRealState() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough', is_theme: true, type: '', widget: T13WalkThroughScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T13SignInScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T13SignUpScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T13ProfileScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T13DashboardScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search', is_theme: true, type: '', widget: T13SearchScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Description', is_theme: true, type: '', widget: T13DescriptionScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T13ListingScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Setting', is_theme: true, type: '', widget: T13SettingScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation', is_theme: true, type: '', widget: T13BottomNavigationScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T13CardScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog', is_theme: true, type: '', widget: T13DialogScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Filter', is_theme: true, type: '', widget: T13FilterScreen(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getDiamondKit() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough 1', is_theme: true, type: '', widget: T14WalkThroughScreen1(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 2', is_theme: true, type: '', widget: T14WalkThroughScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 3', is_theme: true, type: '', widget: T14WalkThroughScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 4', is_theme: true, type: '', widget: T14WalkThroughScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 5', is_theme: true, type: '', widget: T14WalkThroughScreen5(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 6', is_theme: true, type: '', widget: T14WalkThroughScreen6(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 7', is_theme: true, type: '', widget: T14WalkThroughScreen7(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 8', is_theme: true, type: '', widget: T14WalkThroughScreen8(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Calender 1', is_theme: true, type: '', widget: T14CalendarScreen1(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Calender 2', is_theme: true, type: '', widget: T14CalendarScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 1', is_theme: true, type: '', widget: T14SignInScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 2', is_theme: true, type: '', widget: T14SignInScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 3', is_theme: true, type: '', widget: T14SignInScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 4', is_theme: true, type: '', widget: T14SignInScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 1', is_theme: true, type: '', widget: T14SignUpScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 2', is_theme: true, type: '', widget: T14SignUpScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Authorization', is_theme: true, type: '', widget: T14AutorisationScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T14ProfileScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Finance 1', is_theme: true, type: '', widget: T14FinanceScreen1(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Finance 2', is_theme: true, type: '', widget: T14FinanceScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Finance 3', is_theme: true, type: '', widget: T14FinanceScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Finance 4', is_theme: true, type: '', widget: T14FinanceScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Finance 5', is_theme: true, type: '', widget: T14FinanceScreen5(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Travel', is_theme: true, type: '', widget: T14TravelScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Travel Description', is_theme: true, type: '', widget: T14TravelDetailScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Travel 2', is_theme: true, type: '', widget: T14TravelScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Travel 3', is_theme: true, type: '', widget: T14TravelScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Travel 4', is_theme: true, type: '', widget: T14TravelScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'SubScription 1', is_theme: true, type: '', widget: T14SubscriptionScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'SubScription 2', is_theme: true, type: '', widget: T14SubscriptionScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'SubScription 3', is_theme: true, type: '', widget: T14SubscriptionScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'SubScription 4', is_theme: true, type: '', widget: T14SubscriptionScreen5(), darkThemeSupported: true));
  list.add(ProTheme(name: 'SubScription 5', is_theme: true, type: '', widget: T14SubscriptionScreen7(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Success and Fail ', is_theme: true, type: '', widget: T14SuccessAndFailScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Rate the app', is_theme: true, type: '', widget: T14RateScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'AllMessagesList', is_theme: true, type: '', widget: T14AllMessagesListScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Communication 3', is_theme: true, type: '', widget: T14CommunicationScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Communication 4', is_theme: true, type: '', widget: T14CommunicationScreen4(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getMusicStreaming() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough', is_theme: true, type: '', widget: T11WalkThroughScreen()));
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T11SignInScreen()));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T11SignUpScreen()));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T11ProfileScreen()));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T11DashboardScreen()));
  list.add(ProTheme(name: 'Search', is_theme: true, type: '', widget: T11SearchScreen()));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T11ListingScreen()));
  list.add(ProTheme(name: 'Description', is_theme: true, type: '', widget: T11DescriptionScreen()));
  list.add(ProTheme(name: 'Setting', is_theme: true, type: '', widget: T11SettingScreen()));
  list.add(ProTheme(name: 'Card 1', is_theme: true, type: '', widget: T11Card1Screen()));
  list.add(ProTheme(name: 'Card 2', is_theme: true, type: '', widget: T11Card2Screen()));
  list.add(ProTheme(name: 'Bottom Navigation', is_theme: true, type: '', widget: T11BottomNavigationScreen()));

  return list;
}

List<ProTheme> getECommerce() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T10SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T10SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T10Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T10Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Side Menu', is_theme: true, type: '', widget: T10SideMenu(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Description', is_theme: true, type: '', widget: T10Description(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T10Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T10Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog', is_theme: true, type: '', widget: T10Dialog(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getLearner() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T9SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T9SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T9Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T9Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Description', is_theme: true, type: '', widget: T9Description(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation', is_theme: true, type: '', widget: T9BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T9Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T9List(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search', is_theme: true, type: '', widget: T9Search(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getQuiz() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T8SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T8SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T8Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation', is_theme: true, type: '', widget: T8BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T8Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T8Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Result', is_theme: true, type: '', widget: T8Result(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search', is_theme: true, type: '', widget: T8Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Setting', is_theme: true, type: '', widget: T8Setting(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getHotelBooking() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough', is_theme: true, type: '', widget: T7WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Social Login', is_theme: true, type: '', widget: T7SocialLogin(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T7SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T7Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Hotel Booking Home', is_theme: true, type: '', widget: T7HotelBooking(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Hotel Detail', is_theme: true, type: '', widget: T7HotelDetail(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Hotel List', is_theme: true, type: '', widget: T7HotelList(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Place Detail', is_theme: true, type: '', widget: T7PlaceDetail(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search', is_theme: true, type: '', widget: T7Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Sheet', is_theme: true, type: '', widget: T7BottomSheet(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getGymApp() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough', is_theme: true, type: '', widget: T6WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T6SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T6SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T6Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation', is_theme: true, type: '', widget: T6BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Setting', is_theme: true, type: '', widget: T6Setting(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider', is_theme: true, type: '', widget: T6ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T6List(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T6Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog', is_theme: true, type: '', widget: T6Dialog(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getEWallet() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough', is_theme: true, type: '', widget: T5WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T5SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T5SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T5Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T5Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Settings', is_theme: true, type: '', widget: T5Settings(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation', is_theme: true, type: '', widget: T5BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'BottomSheet', is_theme: true, type: '', widget: T5BottomSheet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider', is_theme: true, type: '', widget: T5ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search', is_theme: true, type: '', widget: T5Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T5Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T5Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog', is_theme: true, type: '', widget: T5Dialog(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getFeedApp() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough', is_theme: true, type: '', widget: T4WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T4SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T4SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T4Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T4Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Detail', is_theme: true, type: '', widget: T4Detail(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation', is_theme: true, type: '', widget: T4BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider', is_theme: true, type: '', widget: T4ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T4Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T4Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog', is_theme: true, type: '', widget: T4Dialog(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getFoodRecipe() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough', is_theme: true, type: '', widget: T3WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T3SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T3SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T3Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T3Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Description', is_theme: true, type: '', widget: T3Description(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Side Menu', is_theme: true, type: '', widget: T3SideMenu(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation', is_theme: true, type: '', widget: T3BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'BottomSheet', is_theme: true, type: '', widget: T3BottomSheet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider', is_theme: true, type: '', widget: T3ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search', is_theme: true, type: '', widget: T3Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Tabs', is_theme: true, type: '', widget: T3Tab(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T3Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T3Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Settings', is_theme: true, type: '', widget: T3Setting(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog', is_theme: true, type: '', widget: T3Dialog(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getExerciseTips() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough', is_theme: true, type: '', widget: T2WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T2SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T2SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T2Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T2Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Side Menu', is_theme: true, type: '', widget: T2SideMenu(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation', is_theme: true, type: '', widget: T2BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'BottomSheet', is_theme: true, type: '', widget: T2BottomSheet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider', is_theme: true, type: '', widget: T2ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search', is_theme: true, type: '', widget: T2Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T2Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T2Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog', is_theme: true, type: '', widget: T2Dialog(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getFileManageScreens() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'WalkThrough', is_theme: true, type: '', widget: T1WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In', is_theme: true, type: '', widget: T1Login(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', is_theme: true, type: '', widget: T1Signup(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', is_theme: true, type: '', widget: T1Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', is_theme: true, type: '', widget: T1Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Side Menu', is_theme: true, type: '', widget: T1SideMenu(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation', is_theme: true, type: '', widget: T1BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'BottomSheet', is_theme: true, type: '', widget: T1BottomSheet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider', is_theme: true, type: '', widget: T1ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search', is_theme: true, type: '', widget: T1Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', is_theme: true, type: '', widget: T1Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', is_theme: true, type: '', widget: T1Card(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog', is_theme: true, type: '', widget: T1Dialog(), darkThemeSupported: true));

  return list;
}
//endregion

//region ScreenList
List<ProTheme> getScreenList() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Empty Screens', title_name: 'Empty screens', tag: '', show_cover: true, sub_kits: getEmptyScreens(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Error Screens', title_name: 'Error Screens', tag: '', show_cover: true, sub_kits: getErrorScreens(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Custom Paint', title_name: 'Custom Paint Screens', tag: '', show_cover: true, sub_kits: getCustomPaints(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Pricing Plans', title_name: 'Pricing Plan Screens', tag: '', show_cover: true, sub_kits: getPricingPlans(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough', title_name: 'WalkThrough Screens', type: '', show_cover: true, sub_kits: getWalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In', title_name: 'Sign In Screens', type: '', show_cover: true, sub_kits: getSignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up', title_name: 'Sign Up Screens', type: '', show_cover: true, sub_kits: getSignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile', title_name: 'Profile Screens', type: '', show_cover: true, sub_kits: getProfile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard', title_name: 'Dashboard Screens', type: '', show_cover: true, sub_kits: getDashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Side Menu', title_name: 'Side Menu Screens', type: '', show_cover: true, sub_kits: getSideMenu(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation', title_name: 'Bottom Navigation Screens', type: '', show_cover: true, sub_kits: getBottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Detail Screen', title_name: 'Detail Screen Screens', type: '', show_cover: true, sub_kits: getDetailScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider', title_name: 'Image Slider Screens', type: '', show_cover: true, sub_kits: getImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Sheet', title_name: 'Bottom Sheet Screens', type: '', show_cover: true, sub_kits: getBottomSheet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search', title_name: 'Search Screens', type: '', show_cover: true, sub_kits: getSearch(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing', title_name: 'Listing Screens', type: '', show_cover: true, sub_kits: getListing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards', title_name: 'card Screens', type: '', show_cover: true, sub_kits: getCards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog', title_name: 'Dialog Screens', type: '', show_cover: true, sub_kits: getDialog(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Settings', title_name: 'Setting Screens', type: '', show_cover: true, sub_kits: getSettings(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getWalkThrough() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'WalkThrough 1', is_theme: true, type: '', widget: T1WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 2', is_theme: true, type: '', widget: T2WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 3', is_theme: true, type: '', widget: T3WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 4', is_theme: true, type: '', widget: T4WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 5', is_theme: true, type: '', widget: T5WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 6', is_theme: true, type: '', widget: T6WalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'WalkThrough 7', is_theme: true, type: '', widget: T7WalkThrough(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getPricingPlans() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Pricing Plan 1', is_theme: true, tag: 'New', widget: ChoosePlanScreen1(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Pricing Plan 2', is_theme: true, tag: 'New', widget: ChoosePlanScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Pricing Plan 3', is_theme: true, tag: 'New', widget: ChoosePlanScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Pricing Plan 4', is_theme: true, tag: 'New', widget: ChoosePlanScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Pricing Plan 5', is_theme: true, tag: 'New', widget: ChoosePlanScreen5(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Pricing Plan 6', is_theme: true, tag: 'New', widget: ChoosePlanScreen6(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Pricing Plan 7', is_theme: true, tag: 'New', widget: ChoosePlanScreen7(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getCustomPaints() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Clock', is_theme: true, tag: 'New', widget: ClockCustomPaintScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Shape', is_theme: true, tag: 'New', widget: ShapeScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Chat Bubble', is_theme: true, tag: 'New', widget: ChatBubbleScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Custom card', is_theme: true, tag: 'New', widget: CustomCardScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Custom Loader', is_theme: true, tag: 'New', widget: CustomLoaderScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Card Paint', is_theme: true, tag: 'New', widget: CardScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Custom Temperature', is_theme: true, tag: 'New', widget: TemperatureWidgetScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Custom Round Bubble', is_theme: true, tag: 'New', widget: CustomRoundBubbleAnimationScreen(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getEmptyScreens() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'All Task 1 ', is_theme: true, tag: 'New', widget: AllTaskDoneScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'All Task 2', is_theme: true, tag: 'New', widget: AllTaskDoneScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Empty Cart 1', is_theme: true, tag: 'New', widget: EmptyCartScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Empty Cart 2', is_theme: true, tag: 'New', widget: EmptyCartScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Empty Cart 3', is_theme: true, tag: 'New', widget: EmptyCartScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Empty Cart 4', is_theme: true, tag: 'New', widget: EmptyCartScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Empty Cart 5', is_theme: true, tag: 'New', widget: EmptyCartScreen5(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Inbox 1', is_theme: true, tag: 'New', widget: InboxScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Inbox 2', is_theme: true, tag: 'New', widget: InboxScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Balance 1', is_theme: true, tag: 'New', widget: NoBalanceScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Balance 2', is_theme: true, tag: 'New', widget: NoBalanceScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Balance 3', is_theme: true, tag: 'New', widget: NoBalanceScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Balance 4', is_theme: true, tag: 'New', widget: NoBalanceScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Balance 5', is_theme: true, tag: 'New', widget: NoBalanceScreen5(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Chat 1', is_theme: true, tag: 'New', widget: NoChatsScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Chat 2', is_theme: true, tag: 'New', widget: NoChatsScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Chat 3', is_theme: true, tag: 'New', widget: NoChatsScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Chat 4', is_theme: true, tag: 'New', widget: NoChatsScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Chat 5', is_theme: true, tag: 'New', widget: NoChatsScreen5(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Event 1', is_theme: true, tag: 'New', widget: NoEventScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Event 2', is_theme: true, tag: 'New', widget: NoEventScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Event 3', is_theme: true, tag: 'New', widget: NoEventScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Event 4', is_theme: true, tag: 'New', widget: NoEventScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Sent Mail 1', is_theme: true, tag: 'New', widget: NoMailScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Sent Mail 2', is_theme: true, tag: 'New', widget: NoSentMailScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Notification 1', is_theme: true, tag: 'New', widget: NoNotificationScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Notification 2', is_theme: true, tag: 'New', widget: NoNotificationScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Notification 3', is_theme: true, tag: 'New', widget: NoNotificationScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Notification 4', is_theme: true, tag: 'New', widget: NoNotificationScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Notification 5', is_theme: true, tag: 'New', widget: NoNotificationScreen5(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Photos 1', is_theme: true, tag: 'New', widget: NoPhotosScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Photos 2', is_theme: true, tag: 'New', widget: NoPhotosScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Photos 3', is_theme: true, tag: 'New', widget: NoPhotosScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Photos 4', is_theme: true, tag: 'New', widget: NoPhotosScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Photos 5', is_theme: true, tag: 'New', widget: NoPhotosScreen5(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Videos 1', is_theme: true, tag: 'New', widget: NoVideosScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Videos 2', is_theme: true, tag: 'New', widget: NoVideosScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Videos 3', is_theme: true, tag: 'New', widget: NoVideosScreen3(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Videos 4', is_theme: true, tag: 'New', widget: NoVideosScreen4(), darkThemeSupported: true));
  list.add(ProTheme(name: 'No Videos 5', is_theme: true, tag: 'New', widget: NoVideosScreen5(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Task Done 1', is_theme: true, tag: 'New', widget: TaskDoneScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Task Done 2', is_theme: true, tag: 'New', widget: TaskDoneScreen2(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Task Done 3', is_theme: true, tag: 'New', widget: TaskDoneScreen3(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getErrorScreens() {
  List<ProTheme> list = [];
  list.add(ProTheme(
    name: 'Connection Failed',
    is_theme: true,
    tag: 'New',
    widget: ConnectionFailedScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'Dead End Screen',
    is_theme: true,
    tag: 'New',
    widget: DeadEndScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(name: 'Error Screen', is_theme: true, tag: 'New', widget: ErrorScreen(), darkThemeSupported: true));
  list.add(ProTheme(
    name: 'Hang On Screen',
    is_theme: true,
    tag: 'New',
    widget: HangOnScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'Hmm Screen',
    is_theme: true,
    tag: 'New',
    widget: HmmScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'Location Access Screen',
    is_theme: true,
    tag: 'New',
    widget: LocationAccessScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'Missing Article Screen',
    is_theme: true,
    tag: 'New',
    widget: MissingArticleScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'No Connection Screen',
    is_theme: true,
    tag: 'New',
    widget: NoConnectionScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'No Files Screen',
    is_theme: true,
    tag: 'New',
    widget: NoFilesScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'No Results Screen',
    is_theme: true,
    tag: 'New',
    widget: NoResultsScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'Not Enough Space Screen',
    is_theme: true,
    tag: 'New',
    widget: NotEnoughSpaceScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'Oh No Screen',
    is_theme: true,
    tag: 'New',
    widget: OhNoScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(name: ' Opps Home Screen ', is_theme: true, tag: 'New', widget: OppsHomeScreen(), darkThemeSupported: true));
  list.add(ProTheme(
    name: 'Opps Screen',
    is_theme: true,
    tag: 'New',
    widget: OppsScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'Page Not Found Screen',
    is_theme: true,
    tag: 'New',
    widget: PageNotFoundScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'Payment Failed Screen',
    is_theme: true,
    tag: 'New',
    widget: PaymentFailedScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'Router Offline Screen',
    is_theme: true,
    tag: 'New',
    widget: RouterOfflineScreen(),
    darkThemeSupported: true,
  ));
  list.add(ProTheme(
    name: 'Somethings Not Right Screen',
    is_theme: true,
    tag: 'New',
    widget: SomethingsNotRightScreen(),
    darkThemeSupported: true,
  ));

  return list;
}

List<ProTheme> getSignIn() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Sign In 1', is_theme: true, type: '', widget: T1Login(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 2', is_theme: true, type: '', widget: T2SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 3', is_theme: true, type: '', widget: T3SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 4', is_theme: true, type: '', widget: T4SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 5', is_theme: true, type: '', widget: T5SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 6', is_theme: true, type: '', widget: T6SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 7', is_theme: true, type: '', widget: T7SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 8', is_theme: true, type: '', widget: T8SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 9', is_theme: true, type: '', widget: T9SignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 10', is_theme: true, type: '', widget: T11SignInScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign In 11', is_theme: true, type: '', widget: T10SignIn(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getSignUp() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Sign Up 1', is_theme: true, type: '', widget: T1Signup(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 2', is_theme: true, type: '', widget: T2SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 3', is_theme: true, type: '', widget: T3SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 4', is_theme: true, type: '', widget: T4SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 5', is_theme: true, type: '', widget: T5SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 6', is_theme: true, type: '', widget: T6SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 7', is_theme: true, type: '', widget: T8SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 8', is_theme: true, type: '', widget: T9SignUp(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 9', is_theme: true, type: '', widget: T11SignUpScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sign Up 10', is_theme: true, type: '', widget: T10SignUp(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getProfile() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Profile 1', is_theme: true, type: '', widget: T1Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile 2', is_theme: true, type: '', widget: T2Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile 3', is_theme: true, type: '', widget: T3Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile 4', is_theme: true, type: '', widget: T4Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile 5', is_theme: true, type: '', widget: T5Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile 6', is_theme: true, type: '', widget: T9Profile(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Profile 7', is_theme: true, type: '', widget: T10Profile(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getDashboard() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Dashboard 1', is_theme: true, type: '', widget: T1Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard 2', is_theme: true, type: '', widget: T2Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard 3', is_theme: true, type: '', widget: T3Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard 4', is_theme: true, type: '', widget: T4Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard 5', is_theme: true, type: '', widget: T5Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard 6', is_theme: true, type: '', widget: T6Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard 7', is_theme: true, type: '', widget: T7Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard 8', is_theme: true, type: '', widget: T8Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard 9', is_theme: true, type: '', widget: T9Dashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard 10', is_theme: true, type: '', widget: T11DashboardScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dashboard 11', is_theme: true, type: '', widget: T10Dashboard(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getSideMenu() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Side Menu 1', is_theme: true, type: '', widget: T1SideMenu(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Side Menu 2', is_theme: true, type: '', widget: T2SideMenu(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Side Menu 3', is_theme: true, type: '', widget: T3SideMenu(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Side Menu 4', is_theme: true, type: '', widget: T10SideMenu(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getBottomNavigation() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Bottom Navigation 1', is_theme: true, type: '', widget: T1BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation 2', is_theme: true, type: '', widget: T2BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation 3', is_theme: true, type: '', widget: T3BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation 4', is_theme: true, type: '', widget: T4BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation 5', is_theme: true, type: '', widget: T5BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation 6', is_theme: true, type: '', widget: T6BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation 7', is_theme: true, type: '', widget: T8BottomNavigation(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation 8', is_theme: true, type: '', widget: T9BottomNavigation(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getDetailScreen() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Detail Screen 1', is_theme: true, type: '', widget: T3Description(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Detail Screen 2', is_theme: true, type: '', widget: T4Detail(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Detail Screen 3', is_theme: true, type: '', widget: T7PlaceDetail(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Detail Screen 4', is_theme: true, type: '', widget: T9Description(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Detail Screen 5', is_theme: true, type: '', widget: T11DescriptionScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Detail Screen 6', is_theme: true, type: '', widget: T10Description(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getImageSlider() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Image Slider 1', is_theme: true, type: '', widget: T1ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider 2', is_theme: true, type: '', widget: T2ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider 3', is_theme: true, type: '', widget: T3ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider 4', is_theme: true, type: '', widget: T4ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider 5', is_theme: true, type: '', widget: T5ImageSlider(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Image Slider 6', is_theme: true, type: '', widget: T6ImageSlider(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getBottomSheet() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Bottom Sheet 1', is_theme: true, type: '', widget: T1BottomSheet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Sheet 2', is_theme: true, type: '', widget: T2BottomSheet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Sheet 3', is_theme: true, type: '', widget: T3BottomSheet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Sheet 4', is_theme: true, type: '', widget: T5BottomSheet(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Bottom Sheet 5', is_theme: true, type: '', widget: T7BottomSheet(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getSearch() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Search 1', is_theme: true, type: '', widget: T1Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search 2', is_theme: true, type: '', widget: T2Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search 3', is_theme: true, type: '', widget: T3Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search 4', is_theme: true, type: '', widget: T5Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search 5', is_theme: true, type: '', widget: T5Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search 6', is_theme: true, type: '', widget: T8Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search 7', is_theme: true, type: '', widget: T9Search(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Search 8', is_theme: true, type: '', widget: T11SearchScreen(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getListing() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Listing 1', is_theme: true, type: '', widget: T1Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing 2', is_theme: true, type: '', widget: T2Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing 3', is_theme: true, type: '', widget: T3Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing 4', is_theme: true, type: '', widget: T4Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing 5', is_theme: true, type: '', widget: T5Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing 6', is_theme: true, type: '', widget: T6List(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing 7', is_theme: true, type: '', widget: T7HotelList(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing 8', is_theme: true, type: '', widget: T8Listing(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing 9', is_theme: true, type: '', widget: T9List(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing 10', is_theme: true, type: '', widget: T11ListingScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Listing 11', is_theme: true, type: '', widget: T10Dashboard(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getCards() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Cards 1', is_theme: true, type: '', widget: T1Card(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards 2', is_theme: true, type: '', widget: T2Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards 3', is_theme: true, type: '', widget: T3Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards 4', is_theme: true, type: '', widget: T4Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards 5', is_theme: true, type: '', widget: T5Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards 6', is_theme: true, type: '', widget: T6Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards 7', is_theme: true, type: '', widget: T8Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards 8', is_theme: true, type: '', widget: T9Cards(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cards 9', is_theme: true, type: '', widget: T10Cards(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getDialog() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Dialog 1', is_theme: true, type: '', widget: T1Dialog(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog 2', is_theme: true, type: '', widget: T2Dialog(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog 3', is_theme: true, type: '', widget: T3Dialog(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog 4', is_theme: true, type: '', widget: T4Dialog(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog 5', is_theme: true, type: '', widget: T5Dialog(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog 6', is_theme: true, type: '', widget: T6Dialog(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog 7', is_theme: true, type: '', widget: T10Dialog(), darkThemeSupported: true));
  return list;
}

List<ProTheme> getSettings() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Dialog 1', is_theme: true, type: '', widget: T3Setting(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog 2', is_theme: true, type: '', widget: T5Settings(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog 3', is_theme: true, type: '', widget: T6Setting(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dialog 4', is_theme: true, type: '', widget: T8Setting(), darkThemeSupported: true));
  return list;
}
//endregion

//region Dashboard
ProTheme getDashboards() {
  ProTheme theme = ProTheme(sub_kits: [], name: 'Dashboards', title_name: 'Dashboard Screens', show_cover: true, tag: 'New');
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Banking Dashboard', tag: 'New', widget: BankingDashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Smart Home', tag: 'New', widget: SmartHomeDashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Analytics Dashboard', tag: 'New', widget: AnalyticsDashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Split Bill', tag: 'New', widget: SplitBillDashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Health Medical', tag: 'New', widget: HealthMedicalDashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Utility Tracker', tag: 'New', widget: UtilityTrackerDashboard(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Food', type: '', widget: Dashboard1()));
  list.add(ProTheme(name: 'E-Commerce', type: '', widget: Dashboard2()));
  list.add(ProTheme(name: 'Furniture', type: '', widget: Dashboard3()));
  list.add(ProTheme(name: 'e-Wallet', type: '', widget: Dashboard4()));
  list.add(ProTheme(name: 'Hotel Booking', type: '', widget: Dashboard5()));
  list.add(ProTheme(name: 'Laundry', type: '', widget: Dashboard6()));
  list.add(ProTheme(name: 'Medical', type: '', widget: Dashboard7()));
  list.add(ProTheme(name: 'Home automation', type: '', widget: Dashboard8()));

  theme.sub_kits!.addAll(list);
  return theme;
}

// endregion

//region FullApps
ProTheme getFullApps() {
  ProTheme theme = ProTheme(name: "Full Apps", tag: 'New', show_cover: true, sub_kits: []);

  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Invester', tag: 'New', widget: SMSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'EV Spot', tag: 'New', widget: EVSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Home Service', tag: 'New', widget: SplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Carea', widget: CareaSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Room Finder', tag: '', widget: RFSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Appetit', tag: '', widget: ASplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'NFT Market Place', tag: '', widget: NMPSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Snagajob', tag: '', widget: JSSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Juber Taxi', tag: '', widget: JCBSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'SocialV', tag: '', widget: SVSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Beauty Master', tag: '', widget: BMSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Laundry Service', tag: '', widget: LSWalkThroughScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Mealime', tag: '', widget: MIASplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Recipe and Cooking', tag: '', widget: RCSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Coin Pro', tag: '', widget: CPSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Sneaker Shopping', tag: '', widget: SSSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Smart Home', tag: '', widget: SHSplashScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Wallet', tag: '', widget: WASplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Event', tag: '', widget: EASplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'MediLab', tag: '', widget: MLSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Dating', tag: '', widget: DASplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Medium', type: '', widget: MSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Cloud Storage', type: '', widget: CSSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'NewsBlog', type: '', widget: NBSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Smart Deck', type: '', widget: SDSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Music PodCast', type: '', widget: MPSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Banking', type: '', widget: BankingSplash(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Hair Salon', type: '', widget: BHSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Learner', type: '', widget: LearnerWalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Online Quiz', type: '', widget: QuizSignIn(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Shop hop', type: '', widget: ShSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Food', type: '', widget: FoodWalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Grocery', type: '', widget: GrocerySplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Orapay', type: '', widget: OPSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Flix', type: '', widget: MuviSplashScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Social', type: '', widget: SocialWalkThrough(), darkThemeSupported: true));
  list.add(ProTheme(name: 'QiBus', type: '', widget: QIBusSplash(), darkThemeSupported: true));

  theme.sub_kits!.addAll(list);
  return theme;
}

//endregion

//region Widgets
ProTheme getWidgets() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Material Widgets', tag: '', show_cover: false, sub_kits: getMaterialWidgets(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Widgets', type: '', show_cover: false, sub_kits: getCupertinoWidgets(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Painting and effect Widgets', type: '', show_cover: false, sub_kits: getPaintingAndEffectWidgets(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Animation and motion Widgets', type: '', show_cover: false, sub_kits: getAnimationAndMotionWidgets(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Interaction Model Widgets', type: '', show_cover: false, sub_kits: getInteractionModelWidgets(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Other Widgets', type: '', show_cover: false, sub_kits: getOtherWidgets(), darkThemeSupported: true, isWebSupported: true));

  return ProTheme(name: 'Widgets', title_name: 'Widgets', tag: 'New', type: '', show_cover: false, sub_kits: list);
}

//region Material

List<ProTheme> getMaterialWidgets() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'App Structure', show_cover: false, type: '', tag: '', sub_kits: getAppStructure(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Buttons', show_cover: false, type: '', sub_kits: getButtons(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Input & Selection', show_cover: false, type: '', sub_kits: getInputSelection(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Dialogs, Alerts & Panels', tag: '', show_cover: false, type: '', sub_kits: getDialogs(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Information Display', show_cover: false, type: '', tag: '', sub_kits: getInformationDisplay(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Layout', show_cover: false, type: '', sub_kits: getLayout(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

//region subMaterialWidgets
List<ProTheme> getAppStructure() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'AppBar', show_cover: false, type: '', widget: MWAppBarScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Bottom Navigation Bar', show_cover: false, type: '', tag: '', sub_kits: getBottomNavigationBar(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Drawer', show_cover: false, type: '', sub_kits: getDrawer(), tag: '', darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'SliverAppBar', show_cover: false, type: '', sub_kits: getSliverAppBar(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'TabBar', show_cover: false, type: '', sub_kits: getTabBar(), tag: '', darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Navigation Rail Widget', show_cover: false, type: '', tag: '', sub_kits: getNavigationRailWidgetList(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getBottomNavigationBar() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'With Icon and Label', show_cover: false, type: '', widget: MWBottomNavigationScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'With Custom Image', show_cover: false, type: '', widget: MWBottomNavigationScreen2(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'With Shifting Label', show_cover: false, type: '', widget: MWBottomNavigationScreen3(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'BottomNavigation 4', show_cover: false, type: '', tag: '', widget: MWBottomNavigationScreen4(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'BottomNavigation 5', show_cover: false, type: '', tag: '', widget: MWBottomNavigationScreen5(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'BottomNavigation 6', show_cover: false, type: '', tag: '', widget: MWBottomNavigationScreen6(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'BottomNavigation 7', show_cover: false, type: '', tag: '', widget: MWBottomNavigationScreen7(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getDrawer() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'With Multiple Account Selection ', show_cover: false, type: '', widget: MWDrawerScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'With Custom Shape ', show_cover: false, type: '', widget: MWDrawerScreen2(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Drawer 3', show_cover: false, type: '', tag: '', widget: MWDrawerScreen3(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Drawer 4', show_cover: false, type: '', tag: '', widget: MWDrawerScreen4(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Drawer 5', show_cover: false, type: '', tag: '', widget: MWDrawerScreen5(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getSliverAppBar() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Sliver AppBar with ListView', show_cover: false, type: '', widget: MWSliverAppBarScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Parallax Sliver AppBar', show_cover: false, type: '', widget: MWSliverAppBarScreen2(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getTabBar() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Simple TabBar', show_cover: false, type: '', widget: MWTabBarScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'TabBar with Title and Icon', show_cover: false, type: '', widget: MWTabBarScreen2(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'TabBar with Icon', show_cover: false, type: '', widget: MWTabBarScreen3(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Scrollable Tab', show_cover: false, type: '', widget: MWTabBarScreen4(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getButtons() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'DropDownButton', show_cover: false, type: '', widget: MWDropDownButtonScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'MaterialButton', show_cover: false, type: '', widget: MWMaterialButtonScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'FlatButton', show_cover: false, type: '', widget: MWFlatButtonScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'FloatingActionButton', show_cover: false, type: '', widget: MWFloatingActionButtonScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'IconButton', show_cover: false, type: '', widget: MWIconButtonScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'OutlineButton', show_cover: false, type: '', widget: MWOutlineButtonScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'PopupMenuButton', show_cover: false, type: '', widget: MWPopupMenuButtonScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'RaisedButton', show_cover: false, type: '', widget: MWRaisedButtonScreen(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getInputSelection() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Checkbox', show_cover: false, type: '', widget: MWCheckboxScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Datetime Picker', show_cover: false, type: '', widget: MWDatetimePickerScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Radio', show_cover: false, type: '', widget: MWRadioScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Slider', show_cover: false, type: '', widget: MWSliderScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Switch', show_cover: false, type: '', widget: MWSwitchScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'TextField', show_cover: false, type: '', sub_kits: getTextField(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'TextFormField', show_cover: false, type: '', widget: MWTextFormFieldScreen(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getTextField() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Simple TextField ', show_cover: false, type: '', widget: MWTextFieldScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Rounded Border TextField ', show_cover: false, type: '', widget: MWTextFieldScreen2(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getDialogs() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'AlertDialog', show_cover: false, type: '', widget: MWAlertDialogScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'BottomSheet', show_cover: false, type: '', tag: '', widget: MWBottomSheetScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'ExpansionPanel', show_cover: false, type: '', tag: '', sub_kits: getExpansionPanelList(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Simple Dialog', show_cover: false, type: '', widget: MWSimpleDialogScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'SnackBar', show_cover: false, type: '', widget: MWSnackBarScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Toast', show_cover: false, type: '', widget: MWToastScreen(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getInformationDisplay() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Material Banner', show_cover: false, tag: '', widget: MWMaterialBanner(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Card', show_cover: false, type: '', tag: '', widget: MWCardScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Chip', show_cover: false, type: '', widget: MWChipScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Progress Bar', show_cover: false, type: '', widget: MWProgressBarScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Data Table', show_cover: false, type: '', widget: MWDataTableScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Grid View', show_cover: false, type: '', widget: MWGridViewScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'List View', show_cover: false, type: '', sub_kits: getListView(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Rich Text', show_cover: false, type: '', widget: MWRichTextScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Icon', show_cover: false, type: '', widget: MWIconScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Image (assets, Network, Placeholders)', show_cover: false, type: '', widget: MWImageScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Tooltip', show_cover: false, type: '', widget: MWTooltipScreen(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getListView() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Simple List View', show_cover: false, type: '', widget: MWListViewScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'List Wheel ScrollView', show_cover: false, type: '', widget: MWListViewScreen2(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Horizontal List View', show_cover: false, type: '', widget: MWListViewScreen3(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Bouncing Scroll List View', show_cover: false, type: '', widget: MWListViewScreen4(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Reorderable List View', show_cover: false, type: '', widget: MWListViewScreen5(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getLayout() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Divider', show_cover: false, type: '', widget: MWDividerScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'ListTile', show_cover: false, type: '', widget: MWListTileScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Stepper', show_cover: false, type: '', sub_kits: getStepper(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'User Accounts Drawer Header', show_cover: false, type: '', sub_kits: getUserAccountsDrawerHeader(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getNavigationRailWidgetList() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Navigation Rail 1', show_cover: false, tag: '', type: '', widget: MWNavigationRailScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Navigation Rail 2', show_cover: false, tag: '', type: '', widget: MWNavigationRailScreen2(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Navigation Rail 3', show_cover: false, tag: '', type: '', widget: MWNavigationRailScreen3(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getStepper() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Horizontal Stepper with Form', show_cover: false, type: '', widget: MWStepperScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Vertical Stepper', show_cover: false, type: '', widget: MWStepperScreen2(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Vertical Stepper with Form', show_cover: false, type: '', widget: MWStepperScreen3(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Simple Horizontal Stepper', show_cover: false, type: '', widget: MWStepperScreen4(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getUserAccountsDrawerHeader() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'With Custom UI', show_cover: false, type: '', widget: MWUserAccountDrawerHeaderScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Simple User Account Drawer Header', show_cover: false, type: '', widget: MWUserAccountDrawerHeaderScreen2(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'With Multiple Account Selection', show_cover: false, type: '', widget: MWUserAccountDrawerHeaderScreen3(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'With Custom Background', show_cover: false, type: '', widget: MWUserAccountDrawerHeaderScreen4(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

//endregion
List<ProTheme> getExpansionPanelList() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Expansion Panel 1', show_cover: false, type: '', widget: MWExpansionPanelScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Expansion Panel 2', show_cover: false, tag: '', type: '', widget: MWExpansionPanelScreen2(), darkThemeSupported: true, isWebSupported: true));

  list.add(ProTheme(name: 'Expansion Panel 3', show_cover: false, tag: '', type: '', widget: MWExpansionPanelScreen4(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Expansion Panel 4', show_cover: false, tag: '', type: '', widget: MWExpansionPanelScreen5(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Expansion Panel 5', show_cover: false, tag: '', type: '', widget: MWExpansionPanelScreen6(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Expansion Panel 6', show_cover: false, tag: '', type: '', widget: MWExpansionPanelScreen7(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

//endregion
//region Cupertino
List<ProTheme> getCupertinoWidgets() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Cupertino Action Sheet', show_cover: false, type: '', widget: CWActionSheetScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Activity Indicator', show_cover: false, type: '', widget: CWActivityIndicatorScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Alert Dialog', show_cover: false, type: '', widget: CWAlertDialogScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Button', show_cover: false, type: '', widget: CWButtonScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Context Menu', show_cover: false, type: '', widget: CWContextMenuScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Dialog', show_cover: false, type: '', widget: CWDialogScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Navigation Bar', show_cover: false, type: '', widget: CWNavigationBarScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Picker', show_cover: false, type: '', widget: CWPickerScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Segmented Control', show_cover: false, type: '', widget: CWSegmentedControlScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Slider', show_cover: false, type: '', widget: CWSliderScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Sliding Segmented Control', show_cover: false, type: '', widget: CWSlidingSegmentedControlScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino Switch', show_cover: false, type: '', widget: CWSwitchScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino TabBar', show_cover: false, type: '', sub_kits: getCupertinoTabBar(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Cupertino TextField', show_cover: false, type: '', widget: CWTextFieldScreen(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getCupertinoTabBar() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Tab Bar with Icon ', show_cover: false, type: '', widget: CWTabBarScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Tab Bar with Icon and Label ', show_cover: false, type: '', widget: CWTabBarScreen2(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Tab Bar with Custom Image ', show_cover: false, type: '', widget: CWTabBarScreen3(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

//endregion,isWebSupported: true
//region PaintingAndEffectWidgets
List<ProTheme> getPaintingAndEffectWidgets() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Backdrop Filter', show_cover: false, type: '', widget: PEBackdropFilterScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Clip Widget Demo', show_cover: false, type: '', widget: PEClipOvalScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Opacity', show_cover: false, type: '', widget: PEOpacityScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Rotated Box', show_cover: false, type: '', widget: PERotatedBoxScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Transform', show_cover: false, type: '', widget: PETransformScreen(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

//endregion
//region AnimationAndMotionWidgets
List<ProTheme> getAnimationAndMotionWidgets() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Animated Builder', show_cover: false, type: '', widget: AMAnimatedBuilderScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Animated Container', show_cover: false, type: '', widget: AMAnimatedContainerScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Animated Cross Fade', show_cover: false, type: '', widget: AMAnimatedCrossFadeScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Animated Opacity', show_cover: false, type: '', widget: AMAnimatedOpacityScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Fade Transition', show_cover: false, type: '', widget: AMFadeTransitionScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Hero Transition', show_cover: false, type: '', widget: AMHeroScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Scale Transition', show_cover: false, type: '', widget: AMScaleTransitionScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Animated Size', show_cover: false, type: '', widget: AMAnimatedSizeScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Animated Positioned', show_cover: false, type: '', widget: AMAnimatedPositionedScreen(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

//endregion
//region interaction
List<ProTheme> getInteractionModelWidgets() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Dismissible', show_cover: false, type: '', sub_kits: getDismissible(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Gesture Detector', show_cover: false, type: '', widget: IMGestureDetectorScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Draggable', show_cover: false, type: '', sub_kits: getDraggable(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Long Press Draggable', show_cover: false, type: '', sub_kits: getLongPressDraggable(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getDismissible() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Dismissible with Both Side ', show_cover: false, type: '', widget: IMDismissibleScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Dismissible with One Side', show_cover: false, type: '', widget: IMDismissibleScreen2(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getDraggable() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Simple Draggable', show_cover: false, type: '', widget: IMDraggableScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Draggable with Target', show_cover: false, type: '', widget: IMDraggableScreen2(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

List<ProTheme> getLongPressDraggable() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Simple Long Press Draggable ', show_cover: false, type: '', widget: IMLongPressDraggableScreen1(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Long Press Draggable with Target', show_cover: false, type: '', widget: IMLongPressDraggableScreen2(), darkThemeSupported: true, isWebSupported: true));
  return list;
}

//endregion

//region Other Widgets
List<ProTheme> getOtherWidgets() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Interactive Viewer', show_cover: false, type: '', widget: InteractiveViewerScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Open Container Transform Demo', show_cover: false, type: '', widget: OpenContainerTransformScreen(), darkThemeSupported: true, isWebSupported: true));
  return list;
}
//endregion,isWebSupported: true

//endregion

//region Default Theme
ProTheme getDefaultTheme() {
  return ProTheme(name: "Default Theme", title_name: 'Default Theme', type: '', show_cover: false, darkThemeSupported: true, isWebSupported: true);
}
//endregion

//region Interactions
ProTheme getIntegrations() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Generate QR Code', title_name: 'Integrations', show_cover: false, widget: GenerateQRCodeScreen(), darkThemeSupported: true, tag: ''));
  list.add(ProTheme(name: 'PDF Viewer', title_name: 'Integrations', show_cover: false, sub_kits: getPdfListScreen(), darkThemeSupported: true, tag: ''));
  list.add(ProTheme(name: 'Firebase CRUD', title_name: 'Integrations', show_cover: false, widget: FUserListScreen(), darkThemeSupported: true, type: ''));
  list.add(ProTheme(name: 'Chart', title_name: 'Integrations', show_cover: false, sub_kits: getChartList(), darkThemeSupported: true, type: ''));
  list.add(ProTheme(name: 'Third Party Integration', title_name: 'Integrations', type: '', show_cover: false, sub_kits: getIntegration(), darkThemeSupported: true));
  list.add(ProTheme(name: 'UI Interactions', title_name: 'Integrations', type: '', show_cover: false, sub_kits: getUI(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Lists', title_name: 'Integrations', type: '', show_cover: false, sub_kits: getLists(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Maps', title_name: 'Integrations', type: '', show_cover: false, sub_kits: getMaps(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Payment Gateways', title_name: 'Integrations', type: '', show_cover: false, sub_kits: getPayment(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Rest API Integration', title_name: 'Integrations', type: '', show_cover: false, sub_kits: getRestAPi(), darkThemeSupported: true));
  return ProTheme(name: 'Integrations', title_name: 'Integration', type: '', show_cover: false, sub_kits: list);
}

List<ProTheme> getIntegration() {
  List<ProTheme> list = [];

  // list.add(ProTheme(name: 'File Picker', show_cover: false, type: '', widget: FilePickerScreen(), darkThemeSupported: true, isWebSupported: false));
  list.add(ProTheme(name: 'Image Picker', show_cover: false, type: '', widget: ImagePickerScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Video Picker', show_cover: false, type: '', widget: VideoPickerScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Audio Picker', show_cover: false, type: '', widget: AudioPickerScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Local Notification', show_cover: false, type: '', widget: LocalNotificationScreen(), darkThemeSupported: true, isWebSupported: false));
  list.add(ProTheme(name: 'Fingerprint Authentication', show_cover: false, type: '', widget: FingerprintAuthentication(), darkThemeSupported: true, isWebSupported: false));
  list.add(ProTheme(name: 'Before After Image', show_cover: false, type: '', widget: BeforeAfterImageScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Google Sign In', show_cover: false, type: '', widget: GoogleSignInScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Wave Widget', show_cover: false, type: '', widget: WaveScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Signature Pad', show_cover: false, type: '', widget: SignatureScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Liquid Swipe WalkThrough', show_cover: false, type: '', widget: LiquidSwipeScreen(), darkThemeSupported: true, isWebSupported: false));
  list.add(ProTheme(name: 'Calender', show_cover: false, type: '', widget: CalenderHomePage(), darkThemeSupported: true, isWebSupported: false));
  list.add(ProTheme(name: 'Confetti', show_cover: false, type: '', widget: CHomePage(), darkThemeSupported: true, isWebSupported: false));
  list.add(ProTheme(name: 'TinderCard', show_cover: false, type: '', widget: TinderHomePage(), darkThemeSupported: true, isWebSupported: false));
  list.add(ProTheme(name: 'Show Case View', show_cover: false, type: '', widget: SVCHomePage(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getUI() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Custom Buttons', type: '', show_cover: false, widget: ButtonScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Pickers', type: '', show_cover: false, widget: PickerScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Slider', type: '', show_cover: false, widget: FluidSliderScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'ShaderMask', type: '', show_cover: false, widget: ShaderMaskScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Marquee', type: '', show_cover: false, widget: MHomePage(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Like Button', type: '', show_cover: false, widget: LBHomePage(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getLists() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Liquid Pull to Refresh', type: '', show_cover: false, widget: LiquidPullToRefreshScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Folding Cell in ListView', type: '', show_cover: false, widget: FoldingCellScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Shimmer', type: '', show_cover: false, widget: SHomePage(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Sticky Header', type: '', show_cover: false, sub_kits: getSubStickyHeader(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getSubStickyHeader() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Header and Content', type: '', show_cover: false, widget: SimpleHeaders(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Animated Headers with Content', type: '', show_cover: false, widget: AnimatedHeaders(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Headers overlapping the Content', type: '', show_cover: false, widget: OverLappingHeaders(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getMaps() {
  List<ProTheme> list = [];

  //list.add(ProTheme(name: 'Google Maps with Clustering', type: '', show_cover: false, widget: GoogleMapScreen(), darkThemeSupported: true));
  //list.add(ProTheme(name: 'Google Maps with Slipping Panel', type: '', show_cover: false, widget: SlidingPanelScreen(), darkThemeSupported: true));

  return list;
}

List<ProTheme> getPayment() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'RazorPay Payment', type: '', show_cover: false, widget: RazorPayScreen(), darkThemeSupported: true, isWebSupported: false));
  /*list.add(
    ProTheme(
      name: 'Stripe Payment',
      type: '',
      show_cover: false,
      widget: StripePaymentScreen(),
      darkThemeSupported: true,
      isWebSupported: false,
      tag: 'New',
    ),
  );*/
  list.add(
    ProTheme(
      name: 'Flutter Wave',
      type: '',
      show_cover: false,
      widget: FlutterWaveScreen(),
      darkThemeSupported: true,
      isWebSupported: false,
    ),
  );
  /* list.add(
    ProTheme(
      name: 'Pay Stack',
      type: '',
      show_cover: false,
      widget: PayStackScreen(),
      darkThemeSupported: true,
      isWebSupported: false,
      tag: "New",
    ),
  );*/
  /*if (!isIos)
    list.add(
      ProTheme(
        name: 'Google Pay',
        type: '',
        show_cover: false,
        widget: GoogleAndApplePayScreen(),
        darkThemeSupported: true,
        isWebSupported: false,
        tag: "New",
      ),
    );*/
  return list;
}

List<ProTheme> getRestAPi() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Get example with FutureBuilder', type: '', show_cover: false, widget: GETMethodExampleScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Post example', type: '', show_cover: false, widget: PostMethodExampleScreen(), darkThemeSupported: true, isWebSupported: true));

  return list;
}
//endregion

//region Flutter Web

ProTheme getWebApps() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Portfolio', title_name: 'Single Page Websites', tag: 'New', show_cover: false, sub_kits: getPortfolioSites(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Dashboards', title_name: 'Multiple Useful Dashboard', tag: 'New', show_cover: false, sub_kits: getWebDashboard(), darkThemeSupported: false, isWebSupported: true));

  return ProTheme(name: 'Web', title_name: 'Flutter Web Apps', type: '', show_cover: false, sub_kits: list, isWebSupported: true);
}

List<ProTheme> getPortfolioSites() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Portfolio 1', tag: 'New', show_cover: false, widget: Portfolio1Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Portfolio 2', tag: 'New', show_cover: false, widget: Portfolio2Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Portfolio 3', tag: 'New', show_cover: false, widget: Portfolio3Screen(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getWebDashboard() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Dashboard 1', tag: 'New', show_cover: false, widget: Dashboard1Screen(), darkThemeSupported: false, isWebSupported: true));
  list.add(ProTheme(name: 'Dashboard 2', tag: 'New', show_cover: false, widget: Responsive(web: HomeScreen(), mobile: HomeScreenMobile(), tablet: HomeScreenTablet()), darkThemeSupported: false, isWebSupported: true));
  list.add(ProTheme(name: 'Dashboard 3', tag: 'New', show_cover: false, widget: Dashboard3HomeScreen(), darkThemeSupported: false, isWebSupported: true));

  return list;
}

List<ProTheme> getChartList() {
  List<ProTheme> list = [];
  list.add(ProTheme(name: 'Pie Chart', tag: '', show_cover: false, widget: PieChartScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Line Chart', tag: '', show_cover: false, widget: LineChartScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Monthly Sale Chart1', tag: '', show_cover: false, widget: MonthlySale1Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Monthly Sale Chart2', tag: '', show_cover: false, widget: MonthlySale2Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Bar Chart 1', tag: '', show_cover: false, widget: BarChart1Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Bar Chart 2', tag: '', show_cover: false, widget: BarChart2Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Transaction Chart', tag: '', show_cover: false, widget: TransactionScreen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Stacked Chart 1', tag: '', show_cover: false, widget: StackedChart1Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Stacked Chart 2', tag: '', show_cover: false, widget: StackedChart2Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Stacked Chart 3', tag: '', show_cover: false, widget: StackedChart3Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Stacked Chart 4', tag: '', show_cover: false, widget: StackedChart4Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Stacked Chart 5', tag: '', show_cover: false, widget: StackedChart5Screen(), darkThemeSupported: true, isWebSupported: true));
  list.add(ProTheme(name: 'Stacked Chart 6', tag: '', show_cover: false, widget: StackedChart6Screen(), darkThemeSupported: true, isWebSupported: true));

  return list;
}

List<ProTheme> getPdfListScreen() {
  List<ProTheme> list = [];

  list.add(ProTheme(name: 'Online PDF Viewer', tag: '', widget: OnlinePdfViewerScreen(), darkThemeSupported: true));
  list.add(ProTheme(name: 'Local PDF Viewer', tag: '', widget: LocalPdfViewerScreen(), darkThemeSupported: true));

  return list;
}

//endregion
