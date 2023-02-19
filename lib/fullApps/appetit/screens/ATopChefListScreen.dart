import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';

class ATopChefListScreen extends StatelessWidget {
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
              SizedBox(height: 8),

              //categories
              Align(alignment: Alignment.centerLeft, child: Text('Top Chef', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500))),
              SizedBox(height: 8),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.adjust_outlined, color: Colors.green, size: 15),
                        SizedBox(width: 4),
                        Text('780 Active Chef', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: context.iconColor)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(elevation: 0, primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor, shape: StadiumBorder()),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.adjust_outlined, color: Colors.red, size: 15),
                        SizedBox(width: 4),
                        Text('1200 Total Chef', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: context.iconColor)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(elevation: 0, primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor, shape: StadiumBorder()),
                  ),
                ],
              ),

              SizedBox(
                height: 16,
              ),

              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: (1 / 1.8)),
                itemCount: topchefmodal.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: commonCachedNetworkImage(
                            topchefmodal[index].image.toString(),
                            height: 310,
                            width: context.width() / 2 - 24,
                            fit: BoxFit.cover,
                            color: Colors.black.withOpacity(0.25),
                            colorBlendMode: BlendMode.darken,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 230,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(topchefmodal[index].name.toString(), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
                            ),
                            Align(alignment: Alignment.center, child: Text(topchefmodal[index].recipe.toString(), style: TextStyle(color: Colors.white, fontSize: 10))),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
