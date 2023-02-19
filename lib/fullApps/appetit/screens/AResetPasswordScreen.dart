import 'package:prokit_flutter/fullApps/appetit/screens/AAccountSetupScreen.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class AResetPasswordScreen extends StatefulWidget {
  const AResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<AResetPasswordScreen> createState() => _AResetPasswordScreenState();
}

class _AResetPasswordScreenState extends State<AResetPasswordScreen> {
  var viewPassword1 = true;
  var viewPassword2 = true;

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
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                ),
                child: Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor),
              ),
            ),
            SizedBox(height: 60),
            Text('Reset Password', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Enter your new password twice another for confirmation for this account.'),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                obscureText: viewPassword1,
                decoration: InputDecoration(
                  filled: true,
                  labelStyle: TextStyle(color: Colors.grey),
                  fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  border: InputBorder.none,
                  labelText: 'Enter password',
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: viewPassword1 ? Icon(Icons.visibility_off_outlined, color: Colors.grey) : Icon(Icons.visibility, color: Colors.grey),
                    onPressed: () => setState(() => viewPassword1 = !viewPassword1),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: TextFormField(
                obscureText: viewPassword2,
                decoration: InputDecoration(
                  filled: true,
                  labelStyle: TextStyle(color: Colors.grey),
                  fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  border: InputBorder.none,
                  labelText: 'Confirm password',
                  hintText: 'Confirm your password',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: viewPassword2 ? Icon(Icons.visibility_off_outlined, color: Colors.grey) : Icon(Icons.visibility, color: Colors.grey),
                    onPressed: () => setState(() => viewPassword2 = !viewPassword2),
                  ),
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 60,
                width: 210,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Your account password reset successfully')));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AAccountSetupScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Next', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_ios_outlined, size: 15),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.orange.shade600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
