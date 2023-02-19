import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIASelectOptionsModel.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAAddGroceryScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIABottomSheets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIADataGenerator.dart';
import 'package:prokit_flutter/main.dart';

class MIAGroceryFragment extends StatefulWidget {
  const MIAGroceryFragment({Key? key}) : super(key: key);

  @override
  State<MIAGroceryFragment> createState() => _MIAGroceryFragmentState();
}

class _MIAGroceryFragmentState extends State<MIAGroceryFragment> {
  List<MIASelectOptionsModel> groceriesList = getGroceryList();

  bool alertFlag = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0)).then((_) {
      showGroceryBottomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miaFragmentAppBar(context, 'Groceries', false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          alertFlag
              ? Offstage()
              : Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.all(16),
                  color: Colors.red,
                  child: Column(
                    children: [
                      Text('Allergen Warning', style: boldTextStyle(color: Colors.white)),
                      8.height,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Ingredients with a ", style: primaryTextStyle(color: Colors.white)),
                            WidgetSpan(
                              child: Icon(Icons.warning, color: Colors.white, size: 20),
                            ),
                            TextSpan(
                              text: ' symbol may contain allergens. Tap an ingredient for more details, and make sure to purchase an allergen-free variety.',
                              style: primaryTextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      8.height,
                      AppButton(
                        color: Colors.white,
                        text: 'GOT IT',
                        textStyle: boldTextStyle(color: Colors.red),
                        onTap: () {
                          alertFlag = true;
                          setState(() {});
                        },
                      )
                    ],
                  ),
                ),
          Text('Produce', style: boldTextStyle(color: miaSecondaryTextColor)).paddingSymmetric(horizontal: 16),
          20.height,
          ListView.separated(
            padding: EdgeInsets.only(bottom: 70),
            itemCount: groceriesList.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 0),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: !groceriesList[index].selected.validate() ? Icon(Icons.circle_outlined) : Icon(Icons.check_circle),
                        onPressed: () {
                          groceriesList[index].selected = !groceriesList[index].selected!;
                          setState(() {});
                        },
                      ),
                      Text(
                        groceriesList[index].title,
                        style: boldTextStyle(
                          color: groceriesList[index].selected!
                              ? miaSecondaryTextColor
                              : appStore.isDarkModeOn
                                  ? Colors.white
                                  : Colors.black,
                          decoration: groceriesList[index].selected! ? TextDecoration.lineThrough : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  Text(groceriesList[index].subtitle!, style: secondaryTextStyle())
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 8).onTap(() {
                groceriesList[index].selected = !groceriesList[index].selected!;
                setState(() {});
              });
            },
          ).expand(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          groceriesList = await MIAAddGroceryScreen(groceriesList: groceriesList).launch(context);
          setState(() {});
        },
        backgroundColor: miaPrimaryColor,
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
