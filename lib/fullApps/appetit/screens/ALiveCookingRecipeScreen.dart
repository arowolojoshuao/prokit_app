import 'package:prokit_flutter/fullApps/appetit/components/ADiscussionComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ACategoryListScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ADiscussionScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/AReviewScreen.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';

// ignore: must_be_immutable
class ALiveCookingRecipeScreen extends StatefulWidget {
  @override
  State<ALiveCookingRecipeScreen> createState() => _ALiveCookingRecipeScreenState();
}

class _ALiveCookingRecipeScreenState extends State<ALiveCookingRecipeScreen> {
  var image = commonCachedNetworkImage('$BaseUrl/images/appetit/p3.jpg', fit: BoxFit.cover, color: Colors.black.withOpacity(0.5), colorBlendMode: BlendMode.darken);

  bool isLiked = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),

            //Top 3 button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                      child: Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor),
                    ),
                  ),
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                          child: IconButton(
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                              color: isLiked ? Colors.red : appetitBrownColor,
                            ),
                            onPressed: () {
                              isLiked = !isLiked;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                          child: IconButton(
                            icon: Icon(
                              isSaved ? Icons.bookmark : Icons.bookmark_border_outlined,
                              color: isSaved ? Colors.amber : appetitBrownColor,
                            ),
                            onPressed: () {
                              isSaved = !isSaved;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            //Profile row information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: commonCachedNetworkImage('$BaseUrl/images/appetit/topchef1.jpg', height: 40, width: 40, fit: BoxFit.cover),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jeff Mcinnis', style: TextStyle(fontWeight: FontWeight.w700)),
                        SizedBox(height: 4),
                        Text('23 Recipes', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
                      ],
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AReviewScreen())),
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 40,
                      width: 80,
                      color: Colors.orange.shade600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star_outlined, color: Colors.white),
                          SizedBox(width: 4),
                          Text('4.5', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 16),

            //Image
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Stack(
                children: [
                  commonCachedNetworkImage('$BaseUrl/images/appetit/p1.jpg', width: MediaQuery.of(context).size.width, height: 250, fit: BoxFit.cover),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Text(
                      'Sandwich with boiled eggs',
                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            //Food information
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonCachedNetworkImage('$BaseUrl/images/appetit/info1.png', height: 30, width: 30, fit: BoxFit.cover),
                          SizedBox(height: 4),
                          Text('23', style: TextStyle(fontWeight: FontWeight.w600, color: context.iconColor)),
                          Text('Calories', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: context.iconColor)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonCachedNetworkImage('$BaseUrl/images/appetit/info2.png', height: 30, width: 30, fit: BoxFit.cover),
                          SizedBox(height: 4),
                          Text('Low', style: TextStyle(fontWeight: FontWeight.w600, color: context.iconColor)),
                          Text('Salt', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: context.iconColor)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonCachedNetworkImage('$BaseUrl/images/appetit/info3.png', height: 30, width: 50, fit: BoxFit.cover),
                          SizedBox(height: 4),
                          Text('Low', style: TextStyle(fontWeight: FontWeight.w600, color: context.iconColor)),
                          Text('Sugar', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: context.iconColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            //Ingredients title line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ingredients', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    child: Container(
                      height: 30,
                      width: 100,
                      color: Color(0xFF462F4B),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sorting', style: TextStyle(color: Colors.white)),
                          Icon(Icons.arrow_drop_down_outlined, color: Colors.deepOrange),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            //Ingredients details
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ingredientsmodal.map((e) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    child: Container(
                      height: 150,
                      width: context.width() / 3 - 16,
                      color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: commonCachedNetworkImage(
                              e.image.toString(),
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(e.data.toString(), style: TextStyle(fontSize: 12, color: context.iconColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ).center(),

            SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: Text('Directions', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ),

            SizedBox(height: 16),

            ListView.builder(
              itemCount: directionmodal.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                        child: Row(
                          children: [
                            Text((index + 1).toString(), style: TextStyle(color: Colors.orange.shade600, fontSize: 20, fontWeight: FontWeight.w700)),
                            SizedBox(width: 8),
                            Expanded(child: Text(directionmodal[index].data.toString(), style: TextStyle(fontSize: 14, color: context.iconColor))),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 8),

            //Gallery text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Gallery', style: TextStyle(fontWeight: FontWeight.w600)),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ACategoryListScreen())),
                  child: Text('View all', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),

            SizedBox(height: 16),

            //Gallery Scroll

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 60,
                      width: 60,
                      child: commonCachedNetworkImage('$BaseUrl/images/appetit/soup.jpg', fit: BoxFit.cover, color: Colors.black.withOpacity(0.2), colorBlendMode: BlendMode.darken),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 60,
                      width: 60,
                      child: commonCachedNetworkImage('$BaseUrl/images/appetit/category4.jpg', fit: BoxFit.cover, color: Colors.black.withOpacity(0.2), colorBlendMode: BlendMode.darken),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 60,
                      width: 60,
                      child: commonCachedNetworkImage('$BaseUrl/images/appetit/p1.jpg', fit: BoxFit.cover, color: Colors.black.withOpacity(0.2), colorBlendMode: BlendMode.darken),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 60,
                      width: 60,
                      child: commonCachedNetworkImage('$BaseUrl/images/appetit/p2.jpg', fit: BoxFit.cover, color: Colors.black.withOpacity(0.2), colorBlendMode: BlendMode.darken),
                    ),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: commonCachedNetworkImage('$BaseUrl/images/appetit/p3.jpg', fit: BoxFit.cover, color: Colors.black.withOpacity(0.2), colorBlendMode: BlendMode.darken),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("+23", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            //Discussion title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discussion', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ADiscussionScreen())),
                  child: Text('View all', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),

            SizedBox(height: 16),

            Column(
              children: [
                //List of elements

                ADiscussionComponent(),
                SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                      filled: true,
                      labelText: 'Discuss here',
                      labelStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(Icons.send_outlined, color: Colors.orange.shade600),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
