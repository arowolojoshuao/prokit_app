import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

import '../utils/NMPCommon.dart';

class NMPBlogScreen extends StatelessWidget {
  List<OSDataModel> blog = getBlog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.iconColor),
        centerTitle: true,
        title: Text('Blog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.titleMedium!.color)),
      ),
      body: ListView.builder(
        itemCount: blog.length,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Theme.of(context).dividerColor, width: 1),
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  child: commonCachedNetworkImage(
                    blog[index].image!,
                    height: 165,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: blog[index].color!,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              blog[index].title!,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        //get date code
                        Text(
                          '11 Dec, 2021',
                          style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600),
                          maxLines: 3,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: 4),
                        Text(
                          blog[index].subtitle!,
                          style: TextStyle(fontSize: 14, color: Theme.of(context).textTheme.titleMedium!.color, fontWeight: FontWeight.w600),
                          maxLines: 3,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        shrinkWrap: true,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(16),
        color: Theme.of(context).cardColor,
        child: MaterialButton(
          height: 50,
          color: Colors.blue,
          minWidth: MediaQuery.of(context).size.width,
          child: Text('Visit support.nftmarketplace.io', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
          onPressed: () {
            // Navigator.pop(context);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
