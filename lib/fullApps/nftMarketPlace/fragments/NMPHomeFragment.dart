import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/components/NMPSellerItemComponent.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/fragments/NMPRankingsFragment.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPCategoriesDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPNotableDropsDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPTrendingCollectionsDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

import '../utils/NMPCommon.dart';

class NMPHomeFragment extends StatefulWidget {
  @override
  State<NMPHomeFragment> createState() => _NMPHomeFragmentState();
}

class _NMPHomeFragmentState extends State<NMPHomeFragment> {
  List<OSDataModel> categories = getCategories();

  List<OSDataModel> notableDropsDetails = getOpenSeaDrops();
  List<OSDataModel> trendingCollection = getTrendingCollection();
  List<OSDataModel> recentRocketsDetails = getRecentRocketsDetails();
  List<OSDataModel> hotItems = getHotItems();
  List<OSDataModel> expiringSoon = getExpiringSoon();

  List<OSDataModel> newTopSellers = getNewTopSellers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(width: 0),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            commonCachedNetworkImage('$osImageBaseUrl/os_appIcon.png', height: 60, width: 60, fit: BoxFit.cover),
            Text(
              'NFT Market Place',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.titleMedium!.color),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //categories list 1st list
            SizedBox(
              height: 160,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: categories.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NMPCategoriesDetailsScreen(categories[index]),
                        ),
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: commonCachedNetworkImage(
                              categories[index].image!,
                              width: 150,
                              height: 150,
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

            // Exclusive NFT Market Place Drops 2nd list

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Notable NFT Market Place drops',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                itemCount: notableDropsDetails.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => NMPNotableDropsDetailsScreen(notableDropsDetails[index])));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: SizedBox(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: commonCachedNetworkImage(
                                notableDropsDetails[index].image!,
                                height: 185,
                                width: 190,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              notableDropsDetails[index].title!,
                              style: TextStyle(fontSize: 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),

            // Trending Collection 3rd list

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Trending Collection',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 270,
              child: ListView.builder(
                itemCount: trendingCollection.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => NMPTrendingCollectionsDetailsScreen(trendingCollection[index])));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).cardColor,
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                                  child: commonCachedNetworkImage(
                                    trendingCollection[index].image!,
                                    height: 150,
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
                                    trendingCollection[index].profileImage!,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(trendingCollection[index].title!, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontSize: 16)),
                          SizedBox(height: 4),
                          Text(trendingCollection[index].subtitle!, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontSize: 12, color: Colors.blue)),
                        ],
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),

            // Recent Rockets Details 4th list

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent rockets',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 160,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        child: Wrap(
                          direction: Axis.vertical,
                          children: recentRocketsDetails.map((data) {
                            return Container(
                              height: 55,
                              margin: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: commonCachedNetworkImage(
                                      data.image!,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 110,
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          data.title!,
                                          style: TextStyle(fontSize: 14),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          data.subtitle!,
                                          style: TextStyle(fontSize: 14, color: Colors.green),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return NMPRankingsFragment();
                          }));
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                              SizedBox(height: 8),
                              Text(
                                'See All',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Hot items 5th list

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Hot items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: hotItems.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (_, index) {
                  return NMPSellerItemComponent(hotItems[index]);
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            // Expiring Soon 6th list
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Expiring Soon',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: expiringSoon.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (_, index) {
                  return NMPSellerItemComponent(expiringSoon[index]);
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            // New top sellers 7th list
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'New top sellers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: newTopSellers.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (_, index) {
                  return NMPSellerItemComponent(newTopSellers[index]);
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
