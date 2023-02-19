import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ASetupCompleteScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/main.dart';

class AAccountSetupScreen extends StatefulWidget {
  const AAccountSetupScreen({Key? key}) : super(key: key);

  @override
  _AAccountSetupScreenState createState() => _AAccountSetupScreenState();
}

class _AAccountSetupScreenState extends State<AAccountSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                ),
                width: 50,
                height: 50,
                child: Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor),
              ),
            ),
            SizedBox(height: 60),
            Text('Account \nSetup', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
            SizedBox(height: 16),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.file_upload_outlined, color: context.iconColor),
                    SizedBox(height: 5),
                    Text('Upload your profile Picture', style: TextStyle(color: context.iconColor)),
                    Text('*maximum 2MB', style: TextStyle(fontWeight: FontWeight.w300, color: context.iconColor)),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 0,
                ),
              ),
            ),
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: TextField(
                scrollPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Username',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter your username',
                  filled: true,
                  fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ASetupCompleteScreen())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Continue', style: TextStyle(fontSize: 18)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios_outlined, size: 15),
                  ],
                ),
                style: ElevatedButton.styleFrom(primary: Colors.orange.shade600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
