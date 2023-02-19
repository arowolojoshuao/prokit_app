import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

import 'NMPTrendingCollectionsDetailsScreen.dart';
import '../utils/NMPCommon.dart';

class NMPCategoriesDetailsScreen extends StatefulWidget {
  final OSDataModel dataModel;

  NMPCategoriesDetailsScreen(this.dataModel);

  @override
  NMPCategoriesDetailsScreenState createState() => NMPCategoriesDetailsScreenState();
}

class NMPCategoriesDetailsScreenState extends State<NMPCategoriesDetailsScreen> {
  List<OSDataModel> categories = getTapCategoriesDetails();
  List<OSDataModel> trendingCollection = getTrendingCollection();

  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
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
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).cardColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).iconTheme.color),
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
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Text(
                      "There are many variations of passages of Lorem Ipsum available, "
                      "but the majority have suffered alteration in some form, by injected humour, "
                      "or randomised words which don't look even slightly believable. "
                      "If you are going to use a passage of Lorem Ipsum, you need to be "
                      "sure there isn't anything embarrassing hidden in the middle of text. "
                      "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, "
                      "making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, "
                      "combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 12)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Trending Collection',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    children: trendingCollection.map((data) {
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
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.all(8),
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
                                      border: Border.all(color: Theme.of(context).cardColor, width: 2),
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
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                  )),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                data.subtitle!,
                                style: TextStyle(fontSize: 12, color: Colors.blue),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      );
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
