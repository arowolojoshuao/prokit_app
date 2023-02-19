import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/model/EAForYouModel.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';
import 'package:prokit_flutter/main.dart';

class EASearchPeopleScreen extends StatefulWidget {
  @override
  EASearchPeopleScreenState createState() => EASearchPeopleScreenState();
}

class EASearchPeopleScreenState extends State<EASearchPeopleScreen> {
  TextEditingController searchController = TextEditingController();

  List<EAForYouModel> list = getMayKnowData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        "Search People",
        backWidget: IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.arrow_back, color: white)),
        center: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: boxDecorationWithShadow(
                backgroundColor: context.cardColor,
                shadowColor: grey.withOpacity(0.3),
              ),
              padding: EdgeInsets.all(8),
              child: TextFormField(
                controller: searchController,
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Icon(Icons.search, color: Colors.grey, size: 24),
                  ),
                  suffixIcon: Icon(Icons.close, size: 18, color: primaryColor1).onTap(() {
                    searchController.clear();
                  }),
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                EAForYouModel data = list[index];
                return Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      commonCachedNetworkImage(
                        data.image,
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ).cornerRadiusWithClipRRect(35),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name!, style: boldTextStyle()),
                          4.height,
                          Text(data.add!, style: secondaryTextStyle()),
                        ],
                      ).expand(),
                      IconButton(
                        onPressed: () {
                          data.fev = !data.fev!;
                          setState(() {});
                        },
                        icon: data.fev!
                            ? Icon(Icons.person_remove,
                                color: data.fev!
                                    ? primaryColor1
                                    : appStore.isDarkModeOn
                                        ? white
                                        : black)
                            : Icon(Icons.person_add_alt_1,
                                color: data.fev!
                                    ? primaryColor1
                                    : appStore.isDarkModeOn
                                        ? white
                                        : black),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
