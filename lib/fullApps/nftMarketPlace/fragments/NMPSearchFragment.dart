import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPCategoriesDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPTrendingCollectionsDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

import '../utils/NMPCommon.dart';

// ignore: must_be_immutable
class NMPSearchFragment extends StatelessWidget {
  List<OSDataModel> categories = getCategories();
  List<OSDataModel> openSeaDrops = getOpenSeaDrops();
  List<OSDataModel> trendingCollection = getTrendingCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text('Search', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.titleMedium!.color)),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                //autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: context.iconColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: context.dividerColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: context.dividerColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: context.dividerColor),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  hintText: "Search items",
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                ),
              ),
            ),
            //All Categories 1st list
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'All Categories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                itemCount: categories.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => NMPCategoriesDetailsScreen(categories[index])));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: commonCachedNetworkImage(
                              categories[index].image!,
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          width: 70,
                          bottom: 20,
                          left: 20,
                          child: Text(
                            categories[index].title!,
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                            maxLines: 3,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Divider(height: 0),
            // Trending Collection 2nd list
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Trending Collection',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: trendingCollection.map(
                  (data) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => NMPTrendingCollectionsDetailsScreen(data)));
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 24,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).cardColor,
                              spreadRadius: 3,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 25),
                                    child: commonCachedNetworkImage(
                                      data.image!,
                                      height: 100,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Theme.of(context).cardColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: commonCachedNetworkImage(
                                      data.profileImage!,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    child: Text(
                                      data.title!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(data.subtitle!, style: TextStyle(fontSize: 12, color: Colors.blue)),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
