import 'dart:async';
import 'package:prokit_flutter/fullApps/evSpot/components/app_ev_station_list_component.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';
import 'package:prokit_flutter/main.dart' as main;
import 'package:prokit_flutter/fullApps/evSpot/models/ev_station_places_model.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/ev_station_info_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';

import '../../../main.dart';

class EnrouteScreen extends StatefulWidget {
  const EnrouteScreen({Key? key}) : super(key: key);

  @override
  State<EnrouteScreen> createState() => _EnrouteScreenState();
}

class _EnrouteScreenState extends State<EnrouteScreen> {
  Completer<GoogleMapController> _controller = Completer();

  FocusNode startFocusNode = FocusNode();
  FocusNode destFocusNode = FocusNode();

  bool isVisible = false;

  static final CameraPosition _kGooglePlex = CameraPosition(target: LatLng(51.5072, 0.1276), zoom: 14);

  final List<Marker> markerEnroute = <Marker>[];

  List<EVStationPlacesModel> setMarkerInfo = getStationList();

  final List<LatLng> listLatLng = <LatLng>[
    LatLng(51.50515, 0.12214),
    LatLng(51.51010, 0.12977),
    LatLng(51.50926, 0.12368),
  ];

  @override
  void initState() {
    super.initState();

    listLatLng.forEach((element) async {
      markerEnroute.add(
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
    loadData();
    startFocusNode.addListener(() {
      setState(() {});
    });
    destFocusNode.addListener(() {
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
    markerEnroute.add(
      Marker(
        markerId: MarkerId("${markerEnroute.length + 1}"),
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
    startFocusNode.dispose();
    destFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: GoogleMap(
              initialCameraPosition: _kGooglePlex,
              onMapCreated: onMapCreated,
              mapType: MapType.normal,
              markers: Set<Marker>.of(markerEnroute),
              onTap: (argument) {
                FocusScope.of(context).unfocus();
                isVisible = false;
                setState(() {});
              },
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Material(
              color: main.appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 8,
              child: Column(
                children: [
                  TextField(
                    focusNode: startFocusNode,
                    cursorColor: ev_primary_color,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter starting point',
                      prefixIcon: Icon(Icons.location_on, color: startFocusNode.hasFocus ? Colors.green : Colors.grey, size: 20),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onTap: () {
                      isVisible = false;
                      setState(() {});
                    },
                  ),
                  Row(
                    children: [
                      Container(child: Icon(Icons.more_vert, color: Colors.grey, size: 20), margin: EdgeInsets.only(left: 12)),
                      Expanded(child: Divider(height: 0, thickness: 1, indent: 15)),
                    ],
                  ),
                  TextField(
                    focusNode: destFocusNode,
                    cursorColor: ev_primary_color,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter destination point',
                      prefixIcon: Icon(Icons.navigation, color: destFocusNode.hasFocus ? Colors.amber : Colors.grey, size: 20),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onTap: () {
                      isVisible = false;
                      setState(() {});
                    },
                  ),
                ],
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
    );
  }

  Widget displayMarkerInfo(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: setMarkerInfo.length,
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
