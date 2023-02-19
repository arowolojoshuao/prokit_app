import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIASelectOptionsModel.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAConstants.dart';
import 'package:prokit_flutter/main.dart';

class MIAAddCollectionScreen extends StatefulWidget {
  const MIAAddCollectionScreen({Key? key}) : super(key: key);

  @override
  State<MIAAddCollectionScreen> createState() => _MIAAddCollectionScreenState();
}

class _MIAAddCollectionScreenState extends State<MIAAddCollectionScreen> {
  var form_key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  void addCollection(String name) {
    collections.add(MIASelectOptionsModel(title: name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              finish(context);
            },
            child: Text('Cancel', style: primaryTextStyle(color: miaPrimaryColor))),
        leadingWidth: 80,
        elevation: 0,
      ),
      body: Form(
        key: form_key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add a new Collection', style: boldTextStyle(size: 30)),
            20.height,
            Text('Name', style: boldTextStyle()),
            12.height,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(borderRadius: radius(8), color: appStore.isDarkModeOn ? context.cardColor : miaContainerSecondaryColor),
              child: AppTextField(
                controller: nameController,
                textStyle: boldTextStyle(),
                decoration: InputDecoration(border: InputBorder.none),
                cursorColor: miaPrimaryColor,
                minLines: 1,
                maxLines: 1,
                autoFocus: true,
                isValidationRequired: true,
                textFieldType: TextFieldType.NAME,
              ),
            ),
            AppButton(
              margin: EdgeInsets.symmetric(vertical: 16),
              width: context.width() - 32,
              color: miaPrimaryColor,
              text: 'Create Collection',
              textStyle: boldTextStyle(color: white),
              onTap: () {
                if (form_key.currentState!.validate()) {
                  addCollection(nameController.text);
                  finish(context, collections);
                }
              },
            )
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
