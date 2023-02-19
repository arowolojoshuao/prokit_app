import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

import '../utils/NMPCommon.dart';

class NMPExpiringTopSellersScreen extends StatefulWidget {
  final OSDataModel dataModel;

  NMPExpiringTopSellersScreen(this.dataModel);

  @override
  State<NMPExpiringTopSellersScreen> createState() => _NMPExpiringTopSellersScreenState();
}

class _NMPExpiringTopSellersScreenState extends State<NMPExpiringTopSellersScreen> {
  List<OSDataModel> moreFromCollection = getMoreFromCollection();
  List<OSDataModel> detailsExpandable = getDetailsExpandable();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                commonCachedNetworkImage(
                  widget.dataModel.image!,
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 50,
                  left: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Theme.of(context).cardColor,
                        alignment: Alignment.center,
                        child: Icon(Icons.arrow_back_ios, color: Theme.of(context).iconTheme.color),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(widget.dataModel.title!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(widget.dataModel.subtitle!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                        'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
                        'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 12)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.favorite_border, color: Colors.grey),
                          Text('58', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          Text('Favourite', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.supervisor_account, color: Colors.grey),
                          Text('458', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          Text('Owners', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.copy, color: Colors.grey),
                          Text('2.16k', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          Text('Editions', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade900, width: 0.2),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Text('  Ends on june 21, 2024 at 10:40 am', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Divider(height: 0, color: Colors.grey.shade800),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('  Current Price', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                commonCachedNetworkImage('$osImageBaseUrl/icons/os_ic_token.png', width: 25, height: 25, color: Theme.of(context).iconTheme.color),
                                Text('0.252', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Text("  \$256.74 USD", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ], //children
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey.shade900, width: 0.2),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                children: [
                  Divider(height: 0, color: Colors.grey.shade800),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Details',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 0, color: Colors.grey.shade800),
                  //Expanded Lists (About Collection, Properties, Details, Price history)
                  ExpansionPanelList(
                    expansionCallback: (index, val) {
                      detailsExpandable[index].isSelected = !val;
                      setState(() {});
                    },
                    children: detailsExpandable.map((data) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                data.title!,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            onTap: () {
                              data.isSelected = !data.isSelected;
                              setState(() {});
                            },
                          );
                        },
                        body: Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(data.subtitle!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(data.details!, style: TextStyle(fontSize: 12)),
                              ),
                              trailing: commonCachedNetworkImage(data.categoryIcon!, width: 30, height: 30, color: Theme.of(context).iconTheme.color),
                              onTap: () {
                                //
                              }),
                        ),
                        isExpanded: data.isSelected,
                        //canTapOnHeader: true, (optional)
                      );
                    }).toList(),
                  ),
                ], //children
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'More From this Collection',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: moreFromCollection.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                child: commonCachedNetworkImage(
                                  moreFromCollection[index].image!,
                                  height: 170,
                                  width: 170,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 182,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            moreFromCollection[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: 182,
                          height: 50,
                          child: Text(moreFromCollection[index].subtitle!, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: 182,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  commonCachedNetworkImage('$osImageBaseUrl/icons/os_ic_token.png', width: 17, height: 17, alignment: Alignment.topCenter, color: Theme.of(context).iconTheme.color),
                                  Text(moreFromCollection[index].price.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              IconButton(
                                icon: Row(
                                  children: [
                                    Icon(moreFromCollection[index].isSelected ? Icons.favorite : Icons.favorite_outline, color: moreFromCollection[index].isSelected ? Colors.red : null, size: 20),
                                    SizedBox(width: 8),
                                    Expanded(child: Text(moreFromCollection[index].like.toString(), style: TextStyle(fontSize: 12, color: Colors.grey))),
                                  ],
                                ),
                                onPressed: () {
                                  String s = '';
                                  if (!moreFromCollection[index].isSelected) {
                                    s = 'Liked';
                                    moreFromCollection[index].like = moreFromCollection[index].like! + 1;
                                  } else {
                                    s = 'UnLike';
                                    moreFromCollection[index].like = moreFromCollection[index].like! - 1;
                                  }

                                  final snackBar = SnackBar(
                                    content: Text(s),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  moreFromCollection[index].isSelected = !moreFromCollection[index].isSelected;
                                  setState(() {
                                    //   data.like = data.like! + 1;
                                  });
                                },
                              ),
                            ],
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
            //bottom bar
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        color: Theme.of(context).cardColor,
        child: Row(
          children: [
            InkWell(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 0.2),
                ),
                child: Icon(Icons.favorite_border, size: 25),
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
                            height: 830,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              //color: Colors.white,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: commonCachedNetworkImage(
                                      '$osImageBaseUrl/os_wallet.png',
                                      height: 120,
                                      width: 90,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    'Connect with wallet',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Your crypto wallet securely stores your digital goods and cryptocurrencies. '
                                    'Connect to one of our wallet provider or create a new one.',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 32),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: Colors.grey.shade900, width: 0.2),
                                    color: Theme.of(context).cardColor,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            commonCachedNetworkImage('$osImageBaseUrl/icons/os_ic_wolf.png', height: 24, width: 24),
                                            SizedBox(width: 8),
                                            Text(
                                              'Meta Mask',
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(height: 0, color: Colors.grey.shade800),
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            commonCachedNetworkImage('$osImageBaseUrl/icons/os_ic_trustwallet.png', height: 24, width: 24, color: Colors.blue),
                                            SizedBox(width: 8),
                                            Text(
                                              'Trust Wallet',
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(height: 0, color: Colors.grey.shade800),
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: InkWell(
                                          child: Row(
                                            children: [
                                              commonCachedNetworkImage('$osImageBaseUrl/icons/os_ic_ethereum.png', height: 24, width: 24, color: Colors.redAccent),
                                              SizedBox(width: 8),
                                              Text(
                                                'Enter Ethereum Address',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                              ),
                                            ],
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
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                                                              child: Text(
                                                                'Enter Ethereum Address',
                                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.titleMedium!.color),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8),
                                                              child: TextField(
                                                                //autofocus: true,
                                                                decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                  hintStyle: TextStyle(color: Theme.of(context).textTheme.titleMedium!.color, fontSize: 14),
                                                                  hintText: "Address",
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                    vertical: 10,
                                                                    horizontal: 30,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                                                              color: Theme.of(context).scaffoldBackgroundColor,
                                                              child: MaterialButton(
                                                                height: 50,
                                                                color: Colors.blue,
                                                                minWidth: MediaQuery.of(context).size.width,
                                                                child: Text('Apply', style: TextStyle(fontSize: 16, color: Colors.white)),
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                },
                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                              ),
                                                            ),
                                                            SizedBox(height: 24),
                                                          ],
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
                                      //SizedBox(height: 80),
                                    ], //children
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text(
                                        'New to wallets?',
                                        style: TextStyle(fontSize: 14, color: Colors.grey),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Learn more',
                                        style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(width: 16),
            Expanded(
              child: MaterialButton(
                height: 50,
                color: Colors.blue,
                child: Text('View on nftmarketplace.io',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                onPressed: () {
                  // Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
