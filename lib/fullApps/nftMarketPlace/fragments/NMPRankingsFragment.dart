import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/components/NMPRankingBottomSheet.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPCommon.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

class NMPRankingsFragment extends StatefulWidget {
  @override
  State<NMPRankingsFragment> createState() => _NMPRankingsFragmentState();
}

class _NMPRankingsFragmentState extends State<NMPRankingsFragment> {
  List<OSDataModel> categories = getCategories();
  List<OSDataModel> chains = getChains();
  List<OSDataModel> sevenDayVolume = getSevenDayVolume();
  List<OSDataModel> ranking = getRanking();
  int indexRanking = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text('Rankings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.titleMedium!.color)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  //All categories Drop Down List
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey),
                        ),
                        width: 190,
                        height: 60,
                        child: Row(
                          children: [
                            commonCachedNetworkImage(
                              '$osImageBaseUrl/icons/os_ic_allcategory.png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.cover,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'All categories    ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'v',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                                    ),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: categories.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.all(8),
                                      itemBuilder: (_, index) {
                                        return Container(
                                          //color: Colors.red,
                                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                                          child: Row(
                                            children: [
                                              commonCachedNetworkImage(
                                                categories[index].categoryIcon!,
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                categories[index].title!,
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  //All chain Drop Down List
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey),
                        ),
                        width: 150,
                        height: 60,
                        //color: Colors.red,
                        child: Row(
                          children: [
                            commonCachedNetworkImage(
                              '$osImageBaseUrl/icons/os_ic_ethereum.png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.cover,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'All chain    ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'v',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      //color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).scaffoldBackgroundColor,

                                      //color: Colors.white,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                                    ),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: chains.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.all(8),
                                      itemBuilder: (_, index) {
                                        return Container(
                                          padding: EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              commonCachedNetworkImage(
                                                chains[index].categoryIcon!,
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                chains[index].title!,
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  //Seven day volumes Drop Down List
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey),
                        ),
                        width: 200,
                        height: 60,
                        //color: Colors.red,
                        child: Row(
                          children: [
                            SizedBox(width: 8),
                            Text(
                              'Seven day volume    ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'v',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(
                          () {},
                        );
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return NMPRankingBottomSheet(); //RankingBottomSheet page direction on tap Seven day volume
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 0),
            ListView.separated(
              shrinkWrap: true,
              // padding: const EdgeInsets.all(16.0),
              itemCount: ranking.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        ranking[index].srno!.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16),
                      commonCachedNetworkImage(ranking[index].categoryIcon!, height: 30, width: 30, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ranking[index].title!,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 12),
                              Text(
                                '+More',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      commonCachedNetworkImage('$osImageBaseUrl/icons/os_ic_token.png', height: 20, width: 20, color: context.theme.iconTheme.color),
                      SizedBox(width: 2),
                      Text(
                        ranking[index].price!.toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, position) {
                return Divider(height: 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
