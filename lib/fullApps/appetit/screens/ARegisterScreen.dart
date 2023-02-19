import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/components/ARegisterFormComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ALoginScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/main.dart';

class ARegisterScreen extends StatefulWidget {
  const ARegisterScreen({Key? key}) : super(key: key);

  @override
  _ARegisterScreenState createState() => _ARegisterScreenState();
}

class _ARegisterScreenState extends State<ARegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: 50,
                  height: 50,
                  child: InkWell(
                    child: Icon(Icons.arrow_back_ios_outlined, color: Color(0xFF927160)),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ALoginScreen())),
                  child: Text('Login', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: context.iconColor)),
                ),
              ],
            ),
            SizedBox(height: 60),
            Text('Register', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
            SizedBox(height: 16),
            Text('Learn new recipe while login'),
            SizedBox(height: 8),
            MyForm(),
          ],
        ),
      ),
    );
  }
}
