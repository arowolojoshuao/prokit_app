import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/AResetPasswordScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/main.dart';

class AVerifyPhoneScreen extends StatelessWidget {
  const AVerifyPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                width: 50,
                height: 50,
                child: InkWell(
                  child: Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
            SizedBox(height: 60),
            Text('Verify Phone', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
            SizedBox(height: 16),
            Text('Enter the OTP sent to your current active device '),
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  labelText: 'Enter OTP',
                  alignLabelWithHint: false,
                  hintText: 'Enter OTP sent',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AResetPasswordScreen())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Verify and continue  ', style: TextStyle(fontSize: 18)),
                    Icon(Icons.arrow_forward_ios_outlined, size: 15),
                  ],
                ),
                style: ElevatedButton.styleFrom(primary: Colors.orange.shade600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
