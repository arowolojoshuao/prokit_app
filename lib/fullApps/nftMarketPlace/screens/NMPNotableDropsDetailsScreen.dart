import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/components/NMPNotableTrendingComponent.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

import '../utils/NMPCommon.dart';

class NMPNotableDropsDetailsScreen extends StatefulWidget {
  final OSDataModel dataModel;

  NMPNotableDropsDetailsScreen(this.dataModel);

  @override
  NMPNotableDropsDetailsScreenState createState() => NMPNotableDropsDetailsScreenState();
}

class NMPNotableDropsDetailsScreenState extends State<NMPNotableDropsDetailsScreen> {
  List<OSDataModel> notableDropsDetails = getTapNotableDropsDetails();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

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
                Positioned(
                  bottom: 20,
                  left: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        color: Theme.of(context).cardColor,
                        alignment: Alignment.center,
                        //color: Colors.red,
                        child: commonCachedNetworkImage(
                          '$osImageBaseUrl/os_dog.jpg',
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(widget.dataModel.title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,"
                        " totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae"
                        " vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut "
                        "odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 12)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('9', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('Items', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('1', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('Owners', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          commonCachedNetworkImage('$osImageBaseUrl/icons/os_ic_token.png', width: 20, height: 20, alignment: Alignment.topCenter, color: Theme.of(context).iconTheme.color),
                          Column(
                            children: [
                              Text('0.179', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text('Price', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          commonCachedNetworkImage('$osImageBaseUrl/icons/os_ic_token.png', width: 20, height: 20, alignment: Alignment.topCenter, color: Theme.of(context).iconTheme.color),
                          Column(
                            children: [
                              Text('143', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text('Traded', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
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
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Search items",
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    children: notableDropsDetails.map((data) {
                      return NMPNotableTrendingComponent(data);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
