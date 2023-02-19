import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/model/SneakerShoppingModel.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSDataGenerator.dart';

import '../../../main.dart';

class SSShoppingScreen extends StatelessWidget {
  final List<SneakerShoppingModel> list = getShopping();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Image(image: AssetImage('images/sneakerShopping/ic_sneaker_logo.png'), height: 30, width: 30, color: appStore.isDarkModeOn ? Colors.white : Colors.black, fit: BoxFit.cover),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.clear, color: context.iconColor, size: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              //
            },
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(8)),
              child: Text(list[index].name!, textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
            ),
          );
        },
      ),
    );
  }
}
