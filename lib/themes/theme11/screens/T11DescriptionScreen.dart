import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme11/model/T11Model.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11DataGenerator.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Images.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Strings.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Widget.dart';

class T11DescriptionScreen extends StatefulWidget {
  static String tag = '/T11DescriptionScreen';

  @override
  T11DescriptionScreenState createState() => T11DescriptionScreenState();
}

class T11DescriptionScreenState extends State<T11DescriptionScreen> {
  late List<Music> musicList;

  @override
  void initState() {
    super.initState();
    setStatusBarColor(Colors.transparent);
    musicList = generateAlbumMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                commonCacheImageWidget(t11_ic_singer4, 500, width: context.width(), fit: BoxFit.cover),
                Container(
                  alignment: Alignment.topCenter,
                  height: 500,
                  decoration: gradientBoxDecoration(
                    gradientColor1: Colors.transparent,
                    gradientColor2: Colors.white,
                    radius: 0,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 16,
                  right: 16,
                  child: Text(
                    t11_lbl_sample_long,
                    style: secondaryTextStyle(color: black),
                    maxLines: 10,
                  ),
                )
              ],
            ),
            16.height,
            Text('Similar Artist', style: boldTextStyle(size: 18)).paddingLeft(16),
            16.height,
            musicSimilarArtistList(musicList),
            musicSimilarArtistList(musicList),
          ],
        ),
      ),
    );
  }
}
