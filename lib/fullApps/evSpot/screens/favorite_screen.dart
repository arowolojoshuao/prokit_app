import 'package:prokit_flutter/fullApps/evSpot/components/app_ev_station_list_component.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/evSpot/models/ev_station_places_model.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/ev_station_info_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  List<EVStationPlacesModel> setStationInfo = getStationList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : backgroundColor,
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: setStationInfo.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          EVStationPlacesModel newTemp = setStationInfo[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EVStationInfoScreen(modelObj: newTemp)));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: EvStationListComponent(modelObj: newTemp),
            ),
          );
        },
      ),
    );
  }
}
