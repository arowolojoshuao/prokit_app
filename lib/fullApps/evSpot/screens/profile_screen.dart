import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/common.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String dropDownValue = "Tesla Model X";

  List<String> listItem = ['Tesla Model X', 'Porche Taycan', 'MG ZS EV', 'Mini Cooper SE', 'Tata Nexon EV', 'BMW i4'];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
        statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
      ),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            alignment: Alignment.topLeft,
                            onPressed: () => Navigator.pop(context),
                          ),
                          SizedBox(height: 10),
                          Text('Profile', style: boldTextStyle(size: 22)),
                        ],
                      ),
                      Align(
                        heightFactor: 1.2,
                        widthFactor: 1.2,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(person_image, height: 80, width: 80, fit: BoxFit.cover),
                            ),
                            Positioned(
                              bottom: -10,
                              right: -10,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(color: ev_primary_color, shape: BoxShape.circle),
                                child: Icon(Icons.camera_alt_rounded, color: Colors.white, size: 24),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Text('Full Name', style: primaryTextStyle()),
                  SizedBox(height: 10),
                  TextField(
                    decoration: inputDecoration(context, hintText: 'Enter Full Name'),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    cursorColor: ev_primary_color,
                    cursorWidth: 1,
                  ),
                  SizedBox(height: 20),
                  Text('Phone Number', style: primaryTextStyle()),
                  SizedBox(height: 10),
                  TextField(
                    decoration: inputDecoration(context, hintText: 'Enter Phone Number'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    cursorColor: ev_primary_color,
                    cursorWidth: 1,
                    maxLength: 10,
                  ),
                  SizedBox(height: 20),
                  Text('Email Address', style: primaryTextStyle()),
                  SizedBox(height: 10),
                  TextField(
                    decoration: inputDecoration(context, hintText: 'Enter Email Address'),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: ev_primary_color,
                    cursorWidth: 1,
                  ),
                  SizedBox(height: 20),
                  Text('Your EV Car', style: primaryTextStyle()),
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    child: DropdownButtonFormField(
                      value: dropDownValue,
                      isExpanded: true,
                      decoration: inputDecoration(context),
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(child: Text(valueItem), value: valueItem);
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          dropDownValue = value!;
                          print(dropDownValue);
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                          msg: 'Profile updated successfully',
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 16,
                          backgroundColor: appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : Colors.black,
                        );
                      },
                      child: Text('Update', style: primaryTextStyle(color: Colors.white)),
                      style: getElevatedButtonStyle(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
