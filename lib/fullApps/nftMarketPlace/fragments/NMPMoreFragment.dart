import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPAboutScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPBlogScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPHelpCenterScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';
import 'package:prokit_flutter/main.dart';
import '../utils/NMPCommon.dart';

class NMPMoreFragment extends StatefulWidget {
  @override
  State<NMPMoreFragment> createState() => _NMPMoreFragmentState();
}

class _NMPMoreFragmentState extends State<NMPMoreFragment> {
  List<OSDataModel> followUs = getfollowUs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text('More', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.titleMedium!.color)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(height: 0),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NMPAboutScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('About', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('>', style: TextStyle(fontSize: 30, color: Colors.grey.shade400)),
                    ],
                  ),
                ),
              ),
              Divider(height: 0),
              //Blog part
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NMPBlogScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Blog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('>', style: TextStyle(fontSize: 30, color: Colors.grey.shade400)),
                    ],
                  ),
                ),
              ),
              Divider(height: 0),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NMPHelpCenterScreen();
                  }));
                },
                //Help Center part
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Help Center', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('>', style: TextStyle(fontSize: 30, color: Colors.grey.shade400)),
                    ],
                  ),
                ),
              ),
              Divider(height: 0),
              //Dark Mode
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Dark Mode', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Observer(builder: (_) {
                      return Switch.adaptive(
                        value: appStore.isDarkModeOn,
                        onChanged: (value) {
                          appStore.toggleDarkMode(value: value);
                        },
                      );
                    })
                  ],
                ),
              ),
              Divider(height: 0),
              //Follow us
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Follow us',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Wrap(
                children: followUs.map(
                  (data) {
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 170,
                          margin: EdgeInsets.only(left: 16, bottom: 16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: data.color!,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).cardColor,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              commonCachedNetworkImage(
                                data.image!,
                                height: 30,
                                width: 30,
                                color: Colors.white,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 4),
                              Text(data.title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                              SizedBox(height: 4),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.44,
                          margin: EdgeInsets.only(left: 16, bottom: 16),
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                              colors: [
                                Colors.black12,
                                Colors.black12,
                                Colors.black12,
                                Colors.black12,
                                Colors.black12,
                                Colors.black12,
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
