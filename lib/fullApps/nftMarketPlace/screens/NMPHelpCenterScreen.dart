import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

// ignore: must_be_immutable
class NMPHelpCenterScreen extends StatelessWidget {
  List<OSDataModel> helpCenter = getHelpCenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.iconColor),
        centerTitle: true,
        title: Text(
          'Help Center',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleMedium!.color,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      children: helpCenter.map(
                        (data) {
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5 - 24,
                                height: 170,
                                margin: EdgeInsets.only(top: 16, right: 8, left: 8),
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
                                    Text(data.title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
                                    SizedBox(height: 16),
                                    Text(
                                      data.subtitle!,
                                      maxLines: 5,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5 - 24,
                                margin: EdgeInsets.only(top: 16, right: 8, left: 8),
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
          ],
        ),
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
            // Navigator.pop
            // (context);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
