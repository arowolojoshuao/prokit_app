import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

class NMPRankingBottomSheet extends StatefulWidget {
  static String tag = '/RankingBottomSheet';

  @override
  NMPRankingBottomSheetState createState() => NMPRankingBottomSheetState();
}

class NMPRankingBottomSheetState extends State<NMPRankingBottomSheet> {
  int _selectedIndex = -1;
  List<OSDataModel> sevenDayVolume = getSevenDayVolume();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
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
              itemCount: sevenDayVolume.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(8),
              itemBuilder: (_, index) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      InkWell(
                        child: Text(
                          sevenDayVolume[index].title!,
                          style: index != _selectedIndex ? TextStyle(color: Theme.of(context).textTheme.titleMedium!.color, fontSize: 16) : TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        onTap: () {
                          setState(
                            () {
                              if (_selectedIndex == index) {
                                _selectedIndex = -1;
                              } else {
                                _selectedIndex = index;
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            color: Theme.of(context).scaffoldBackgroundColor,
            //color: Colors.white,
            child: MaterialButton(
              color: Colors.blue,
              height: 50,
              minWidth: MediaQuery.of(context).size.width,
              child: Text('Apply', style: TextStyle(fontSize: 16, color: Colors.white)),
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
