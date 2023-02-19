import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ADashboardScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class ASetupCompleteScreen extends StatelessWidget {
  const ASetupCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //image
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('$BaseUrl/images/appetit/set.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken)),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).viewPadding.top + 16,
            left: 16,
            right: 16,
            child: Align(
              alignment: Alignment.center,
              child: Text('Appetit', style: TextStyle(fontSize: 25, color: Colors.white)),
            ),
          ),

          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor),
                            Text('  Back', style: TextStyle(color: appetitBrownColor, fontSize: 18)),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ADashboardScreen())),
                      child: Icon(Icons.arrow_forward_ios_outlined),
                      backgroundColor: appetitBrownColor,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            left: 16,
            right: 16,
            bottom: 80,
            child: Column(
              children: [
                Text('Setup Completed', style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w800)),
                SizedBox(height: 16),
                Text('Your profile is now ready to go.Click the continue button below to start exploring Appetit!', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {},),
    );
  }
}
