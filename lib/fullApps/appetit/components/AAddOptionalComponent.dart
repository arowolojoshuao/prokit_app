import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main.dart';
import 'package:nb_utils/nb_utils.dart';

class AAddOptionalComponent extends StatelessWidget {
  const AAddOptionalComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top + 64),
          Text("Optional", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
          SizedBox(height: 16),
          Text('Tutorial Video', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 16),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            decoration: BoxDecoration(
              color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
              borderRadius: BorderRadius.circular(15),
            ),
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

          //Gallery
          SizedBox(height: 16),
          Text('Gallery', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 16),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: commonCachedNetworkImage(
                  '$BaseUrl/images/appetit/soup.jpg',
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                  color: Colors.black.withOpacity(0.2),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              SizedBox(width: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: commonCachedNetworkImage(
                  '$BaseUrl/images/appetit/category4.jpg',
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                  color: Colors.black.withOpacity(0.2),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              SizedBox(width: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    child: Icon(Icons.add, color: context.iconColor),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
