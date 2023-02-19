import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';
import '../utils/NMPCommon.dart';

class NMPProfileFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text('Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.titleMedium!.color)),
      ),
      body: SingleChildScrollView(
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
    );
  }
}
