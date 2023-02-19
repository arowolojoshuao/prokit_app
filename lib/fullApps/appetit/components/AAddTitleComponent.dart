import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/main.dart';

class AAddTitleComponent extends StatelessWidget {
  const AAddTitleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          SizedBox(height: 64),
          Text("Title", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                filled: true,
                labelStyle: TextStyle(color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey),
                labelText: 'Title',
                hintText: 'Enter title name',
              ),
            ),
          ),
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_upload_outlined, color: Colors.grey),
                  SizedBox(height: 8),
                  Text('Upload your profile picture', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
                  Text('*maximum size 2MB', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.grey)),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
