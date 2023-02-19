import 'dart:async';
import 'package:prokit_flutter/fullApps/evSpot/components/app_ev_station_list_component.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';
import 'package:prokit_flutter/main.dart' as main;
import 'package:prokit_flutter/fullApps/evSpot/models/ev_station_places_model.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/ev_station_info_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';

import '../../../main.dart';

class NearbyScreen extends StatefulWidget {
  const NearbyScreen({Key? key}) : super(key: key);

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  Completer<GoogleMapController> _controller = Completer();

  FocusNode searchIconFocus = FocusNode();
  late BitmapDescriptor customMarker;

  bool isVisible = false;

  static final CameraPosition _kGooglePlex = CameraPosition(target: LatLng(51.5072, 0.1276), zoom: 14);

  List<EVStationPlacesModel> setMarkerInfo = getStationList();

  final List<Marker> marker = [];

  final List<LatLng> listLatLng = [
    LatLng(51.50515, 0.12214),
    LatLng(51.51010, 0.12977),
    LatLng(51.50926, 0.12368),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
    listLatLng.forEach((element) async {
      marker.add(
        Marker(
          markerId: MarkerId({listLatLng.indexOf(element) + 1}.toString()),
          position: element,
          infoWindow: InfoWindow(title: 'This is title marker ${listLatLng.indexOf(element) + 1}'),
          icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration(), ic_marker2),
          onTap: () {
            FocusScope.of(context).unfocus();
            isVisible = true;
            setState(() {});
          },
        ),
      );
    });
    setState(() {});
    searchIconFocus.addListener(() {
      setState(() {});
    });
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    if (main.appStore.isDarkModeOn) {
      _controller.future.then((value) => value.setMapStyle(darkMapStyle));
    } else {
      _controller.future.then((value) => value.setMapStyle(lightMapStyle));
    }
  }

  void loadData() async {
    marker.add(
      Marker(
        markerId: MarkerId("${marker.length + 1}"),
        position: LatLng(51.5072, 0.1276),
        infoWindow: InfoWindow(title: 'My Current Location'),
        icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration(), ic_navigation),
      ),
    );
    CameraPosition cameraPosition = CameraPosition(target: LatLng(51.5072, 0.1276), zoom: 15);
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    setState(() {});
  }

  @override
  void dispose() {
    searchIconFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: _kGooglePlex,
                onMapCreated: onMapCreated,
                mapType: MapType.normal,
                markers: Set<Marker>.of(marker),
                onTap: (argument) {
                  FocusScope.of(context).unfocus();
                  isVisible = false;
                  setState(() {});
                },
              ),
              Positioned(
                top: 16,
                right: 16,
                left: 16,
                child: Material(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  color: main.appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : Colors.white,
                  child: TextField(
                    focusNode: searchIconFocus,
                    cursorColor: ev_primary_color,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search charging spot',
                      prefixIcon: Icon(Icons.location_on, color: searchIconFocus.hasFocus ? Colors.green : Colors.grey),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onTap: () {
                      isVisible = false;
                      setState(() {});
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Visibility(
                  visible: isVisible,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
                        child: displayMarkerInfo(context),
                      ),
                      Positioned(
                        right: 5,
                        top: -15,
                        child: GestureDetector(
                          onTap: () {
                            isVisible = false;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                            child: Icon(Icons.close, color: Colors.white, size: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget displayMarkerInfo(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: setMarkerInfo.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        EVStationPlacesModel newTemp = setMarkerInfo[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EVStationInfoScreen(modelObj: newTemp)));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: EvStationListComponent(modelObj: newTemp),
          ),
        );
      },
    );
  }
}
