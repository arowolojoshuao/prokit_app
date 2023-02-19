import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';

class ACategoryListScreen extends StatelessWidget {
  const ACategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              //categories
              Text('Categories', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500)),

              SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: categorymodal.map((e) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: commonCachedNetworkImage(
                          e.image.toString(),
                          height: 250,
                          width: context.width() / 2 - 24,
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.35),
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 170, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.numberofrecipe.toString(), style: TextStyle(color: Colors.white, fontSize: 10)),
                            Text(e.data.toString(), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
