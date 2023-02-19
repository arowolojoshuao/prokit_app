import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/components/AAddDirectionsComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/components/AAddInfoComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/components/AAddIngredientsComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/components/AAddOptionalComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/components/AAddTitleComponent.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/main.dart';

class AAddRecipeScreen extends StatefulWidget {
  AAddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AAddRecipeScreen> createState() => _AAddRecipeScreenState();
}

class _AAddRecipeScreenState extends State<AAddRecipeScreen> {
  List<Widget> ReelsPages = <Widget>[
    AAddTitleComponent(),
    AAddInfoComponent(),
    AAddIngredientsComponent(),
    AAddDirectionsComponent(),
    AAddOptionalComponent(),
  ];

  int selectedindex = 0;
  int pageindex = 1;

  PageController mypagecontroller = new PageController(initialPage: 0);

  void ontapselection(int index) {
    print(index);
    mypagecontroller.jumpToPage(selectedindex + 1);
  }

  void initState() {
    super.initState();
    afterBuildCreated(() => setStatusBarColor(context.scaffoldBackgroundColor));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          //top 3 elements

          //main content
          PageView(
            controller: mypagecontroller,
            onPageChanged: (value) {
              setState(() {
                selectedindex = value;
                pageindex = value + 1;
              });
            },
            children: ReelsPages.map((e) => Container(child: e)).toList(),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 16, right: 16, left: 16, top: 16.0 + MediaQuery.of(context).viewPadding.top),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: appStore.isDarkModeOn
                        ? context.cardColor
                        : appStore.isDarkModeOn
                            ? context.cardColor
                            : appetitAppContainerColor,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor),
                    onPressed: () {
                      finish(context);
                    },
                  ),
                ),
                Text("Add Recipe", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 50,
                    height: 30,
                    color: Color(0xFF462F4C),
                    child: Center(child: InkWell(child: Text("$pageindex/5", style: TextStyle(color: Colors.white, fontSize: 12)))),
                  ),
                ),
              ],
            ),
          ),

          //last two button
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: 60,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (selectedindex == 0)
                                Navigator.pop(context);
                              else
                                mypagecontroller.jumpToPage(selectedindex - 1);
                            },
                            child: Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor),
                            style: ElevatedButton.styleFrom(primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor),
                          ),
                        ),
                      ),
                    ),
                    // Spacer(),
                    SizedBox(width: 64),
                    Expanded(
                      flex: 7,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedindex == 4)
                            Navigator.pop(context);
                          else
                            setState(() => mypagecontroller.jumpToPage(selectedindex + 1));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text((selectedindex <= 3) ? 'Next' : 'Submit', style: TextStyle(fontSize: 18)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward_ios_outlined, size: 15),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange.shade600,
                          padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
