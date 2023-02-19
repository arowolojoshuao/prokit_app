import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/model/SneakerShoppingModel.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSDataGenerator.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSWidgets.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SSProfileFragment extends StatelessWidget {
  final List<SneakerShoppingModel> data = getAccount();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("My Account", style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image(image: NetworkImage('$BaseUrl/images/sneakerShopping/ic_arrivals_1.jpg'), height: 100, width: 100, fit: BoxFit.cover),
                  ),
                ),
                Align(
                  alignment: Alignment(0.2, -0.2),
                  child: Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(color: Color(0xff000000), shape: BoxShape.circle, border: Border.all(color: Color(0x4d9e9e9e), width: 1)),
                    child: Icon(Icons.edit, color: Color(0xffffffff), size: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16, width: 16),
            Text("Van  Smith", style: primaryTextStyle()),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                settingWidget(title: '0', subtitle: 'Processing'),
                Container(height: 30, width: 1, color: Colors.grey, margin: EdgeInsets.only(bottom: 16)),
                settingWidget(title: '1', subtitle: 'Shipped'),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.grey,
                  margin: EdgeInsets.only(bottom: 16),
                ),
                settingWidget(title: '0', subtitle: 'Pickup'),
              ],
            ),
            SizedBox(height: 16),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 8, bottom: 8),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 4, bottom: 4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(data[index].name!, textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle(size: 16)),
                          Icon(Icons.arrow_forward_ios, color: context.iconColor, size: 17),
                        ],
                      ),
                      SizedBox(height: 8, width: 16),
                      Divider(color: Colors.grey.withOpacity(0.5), height: 16, thickness: 0, indent: 0, endIndent: 0),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
