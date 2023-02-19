import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ADashboardScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/main.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var viewPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          //4 textformfields
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: 'Full Name',
                  hintText: 'Enter Full Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  filled: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  labelText: 'E-mail',
                  hintText: 'Enter proper email',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  filled: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                // keyboardAppearance: ,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  labelText: 'Phone Number',
                  hintText: 'Enter 10-digit number',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  filled: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: TextFormField(
                obscureText: viewPassword,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  labelText: 'Enter Password',
                  hintText: 'Enter your Password',
                  filled: true,
                  fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => viewPassword = !viewPassword),
                    icon: viewPassword ? Icon(Icons.visibility_off, color: Colors.grey) : Icon(Icons.visibility, color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty)
                    return 'Enter valid Password';
                  else
                    return null;
                },
              ),
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Registered')));
                Navigator.push(context, MaterialPageRoute(builder: (context) => ADashboardScreen()));
              },
              child: Text('Register', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(primary: Color(0xFFF2894F), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: [
              Text('By registering you agree to our', style: TextStyle(fontSize: 17)),
              Text('Terms and Conditions', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}
