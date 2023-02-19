import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/components/APopularRecipesComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ACategoryListScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ALiveCookingListScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ATopChefListScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../screens/ALiveCookingRecipeScreen.dart';
import '../utils/ADataProvider.dart';

class AHomeFragment extends StatefulWidget {
  const AHomeFragment({Key? key}) : super(key: key);

  @override
  State<AHomeFragment> createState() => _AHomeFragmentState();
}

class _AHomeFragmentState extends State<AHomeFragment> {
  var bookmarkSelection = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: commonCachedNetworkImage('$BaseUrl/images/appetit/a_face.jpeg', height: 30, width: 30, fit: BoxFit.cover),
          ),
        ),
        title: Align(alignment: Alignment.center, child: Text('Appetit', style: TextStyle(fontSize: 20))),
        actions: [
          Padding(padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.search, size: 27, color: context.iconColor)),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('What do you want to cook today?', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ACategoryListScreen())),
                    child: Text('View all', style: TextStyle(color: appStore.isDarkModeOn ? Colors.grey : Colors.black.withOpacity(0.4))),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Row(
                    children: categorymodal.getRange(0, 4).map((e) {
                      return Container(
                        margin: EdgeInsets.only(right: 16.0),
                        width: 120,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            commonCachedNetworkImage(e.categoryicon.toString(), width: 30, height: 30, fit: BoxFit.cover),
                            SizedBox(width: 4),
                            Text(e.data.toString(), style: TextStyle(fontWeight: FontWeight.w400, color: context.iconColor))
                          ],
                        ),
                        decoration: BoxDecoration(color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor, borderRadius: BorderRadius.circular(15)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Live Cooking', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(height: 8),
                      Container(
                        width: 100,
                        height: 32,
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.adjust_outlined, color: Colors.red, size: 20),
                            Text(' 500 live', style: TextStyle(fontWeight: FontWeight.w400, color: context.iconColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ALiveCookingListScreen())),
                    child: Text('View all', style: TextStyle(color: appStore.isDarkModeOn ? Colors.grey : Colors.black.withOpacity(0.4))),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: cookingmodal.take(4).map((e) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ALiveCookingRecipeScreen())),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Stack(
                          children: [
                            commonCachedNetworkImage(
                              e.image.toString(),
                              height: 180,
                              width: 270,
                              color: Colors.black.withOpacity(0.4),
                              colorBlendMode: BlendMode.darken,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 16,
                              left: 16,
                              child: SizedBox(
                                height: 40,
                                width: 156,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.white24.withOpacity(0.25), shape: StadiumBorder()),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          child: ClipOval(
                                            child: commonCachedNetworkImage(
                                              e.chefpic.toString(),
                                              height: 70,
                                              width: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          radius: 15,
                                        ),
                                        SizedBox(width: 8),
                                        Text(e.chefname.toString(), style: TextStyle(color: Colors.white)),
                                      ],
                                    )),
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              right: 16,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 110,
                                    height: 30,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          child: commonCachedNetworkImage('$BaseUrl/images/appetit/user7.jpg', height: 30, width: 30, fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        Positioned(
                                          left: 15,
                                          child: ClipRRect(
                                            child: commonCachedNetworkImage('$BaseUrl/images/appetit/topchef6.jpg', height: 30, width: 30, fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                                              borderRadius: radiusOnly(bottomRight: 20, topRight: 20),
                                            ),
                                            height: 30,
                                            padding: EdgeInsets.only(left: 14, right: 8),
                                            child: Text('+ 99 k', style: TextStyle(fontWeight: FontWeight.bold, color: context.iconColor)).center(),
                                          ),
                                        ),
                                        Positioned(
                                          left: 30,
                                          child: ClipRRect(
                                            child: commonCachedNetworkImage('$BaseUrl/images/appetit/a_face.jpeg', height: 30, width: 30, fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.crop_free_outlined, color: Colors.white),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 16,
                              top: 80,
                              right: 16,
                              child: Text(e.data.toString(), style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                      borderRadius: radius(35),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Chef', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ATopChefListScreen())),
                    child: Text('View all', style: TextStyle(color: appStore.isDarkModeOn ? Colors.grey : Colors.black.withOpacity(0.4))),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 16),
              child: Row(
                children: topchefmodal.getRange(2, 6).map((e) {
                  return Container(
                    height: 180,
                    width: 106,
                    padding: EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(child: ClipRRect(borderRadius: BorderRadius.circular(25), child: commonCachedNetworkImage(e.image.toString(), width: 90, height: 120, fit: BoxFit.cover))),
                        SizedBox(height: 8),
                        Text(e.name.toString()),
                        Text(e.recipe.toString()),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Recipes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ACategoryListScreen())),
                    child: Text('View all', style: TextStyle(color: appStore.isDarkModeOn ? Colors.grey : Colors.black.withOpacity(0.4))),
                  ),
                ],
              ),
            ),
            APopularRecipesComponent(),
          ],
        ),
      ),
    );
  }
}
