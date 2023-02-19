import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';

class AFollowersScreen extends StatelessWidget {
  const AFollowersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          child: Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor), color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor, height: 50, width: 50),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orange,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.tune_outlined, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Text('Follower', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500)),
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 30,
                  width: 120,
                  color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.adjust_outlined, color: Colors.red, size: 15),
                      SizedBox(width: 4),
                      Text(
                        '432 followers',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: context.iconColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: mynotifications
                    .map((e) => Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: commonCachedNetworkImage(e.image.toString(), height: 50, width: 50, fit: BoxFit.cover),
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e.name.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text('Florida,US', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10)),
                                ],
                              )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: InkWell(
                                    child: Container(
                                        child: Icon(Icons.person_add_alt, color: Colors.grey), color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor, height: 50, width: 50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
