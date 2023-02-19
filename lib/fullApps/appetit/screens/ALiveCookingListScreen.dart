import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ALiveCookingRecipeScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';
import 'package:prokit_flutter/main.dart';

class ALiveCookingListScreen extends StatelessWidget {
  const ALiveCookingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                      height: 50,
                      width: 50,
                      child: InkWell(onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor)),
                    ),
                  ),
                  Icon(Icons.search, size: 30),
                ],
              ),
              SizedBox(height: 16),
              Align(alignment: Alignment.centerLeft, child: Text('Live Cooking', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500))),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cookingmodal.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 16.0),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () => print(cookingmodal[index].data),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              child: commonCachedNetworkImage(
                                cookingmodal[index].image.toString(),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                                color: Colors.black.withOpacity(0.25),
                                colorBlendMode: BlendMode.darken,
                              ),
                            ),
                          ),
                        ),

                        //Internal Data
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          //Internal Padding
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),

                                //profile view with name
                                SizedBox(
                                  height: 40,
                                  width: 160,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          child: ClipOval(child: commonCachedNetworkImage(cookingmodal[index].chefpic.toString(), fit: BoxFit.cover, height: 60, width: 60)),
                                        ),
                                        SizedBox(width: 8),
                                        Text(cookingmodal[index].chefname.toString(), style: TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(primary: Colors.white70.withOpacity(0.35), shape: StadiumBorder()),
                                  ),
                                ),

                                //Main Text
                                Padding(
                                  padding: EdgeInsets.only(top: 42.0),
                                  child: Container(
                                    height: 70,
                                    child: Text(cookingmodal[index].data.toString(), style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800)),
                                  ),
                                ),

                                //Box Icon
                                Align(alignment: Alignment.bottomRight, child: Icon(Icons.crop_free_outlined, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    ALiveCookingRecipeScreen().launch(context);
                  }, splashColor: Colors.transparent, highlightColor: Colors.transparent);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
