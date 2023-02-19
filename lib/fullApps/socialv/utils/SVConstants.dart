import 'package:google_fonts/google_fonts.dart';

const double SVAppContainerRadius = 32;
const double SVAppCommonRadius = 12;
const svAppName = "SocialV";

class SVNotificationType {
  static String like = 'like';
  static String request = 'request';
  static String birthday = 'birthday';
  static String newPost = 'newPost';
}

class SVPostType {
  static String video = 'video';
  static String camera = 'camera';
  static String voice = 'voice';
  static String location = 'location';
  static String text = 'text';
}

var svFontRoboto = GoogleFonts.roboto().fontFamily;
