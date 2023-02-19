import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/grocery_allStores_model.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/clusteringGoogleMaps/clustering_helper.dart';
import 'package:prokit_flutter/main/utils/clusteringGoogleMaps/lat_lang_geohash.dart';

class GroceryStoreLocatorScreen extends StatefulWidget {
  static String tag = '/GroceryStoreLocatorScreen';

  @override
  _GroceryStoreLocatorScreenState createState() => _GroceryStoreLocatorScreenState();
}

class _GroceryStoreLocatorScreenState extends State<GroceryStoreLocatorScreen> {
  List<AllStores> listAllStores = allStores;

  // TODO Without NullSafety Geo coder
  //Completer<GoogleMapController> _controller = Completer();

  ClusteringHelper? clusteringHelper;
  List<LatLngAndGeohash>? list;

  List<Marker> markers = [];
  var mMapType = MapType.normal;

// TODO Without NullSafety Geo coder
  /* initMemoryClustering(context) async {
    list = await getListOfLatLngAndGeoHash(context);
    clusteringHelper = ClusteringHelper.forMemory(
      list: list,
      updateMarkers: updateMarkers,
      aggregationSetup: AggregationSetup(markerSize: 150), // You can customize marker size, colors and size limits
    );
    setState(() {});
  }*/

  updateMarkers(Set<Marker> markers) {
    this.markers = markers.toList();
  }

  void afterFirstLayout(BuildContext context) {
    // initMemoryClustering(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO Without NullSafety Geo coder
    /* CameraPosition initialPosition = CameraPosition(
      target: LatLng(43.7262115, 12.636526499999945),
      zoom: 5,
    );*/

    //CameraPosition newPosition = CameraPosition(bearing: 192.8334901395799, target: LatLng(37.43296265331129, -122.08832357078792), tilt: 59.440717697143555, zoom: 19.151926040649414);

    final allStores = ListView.builder(
      itemCount: listAllStores.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          decoration: boxDecoration(showShadow: true, radius: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    color: grocery_colorPrimary,
                    child: Icon(Icons.location_on, color: grocery_color_white),
                  ).cornerRadiusWithClipRRect(25),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(listAllStores[index].storeName, style: boldTextStyle()),
                      4.height,
                      Text(
                        listAllStores[index].storeAddress,
                        style: secondaryTextStyle(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ).expand(),
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(grocery_direction, style: boldTextStyle()),
                    color: grocery_blue,
                    onTap: () {
                      //
                    },
                  ),
                  16.width,
                  AppButton(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(grocery_call, style: boldTextStyle()),
                    color: grocery_colorPrimary,
                    onTap: () {
                      //
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
// TODO Without NullSafety Geo coder
/*    final nearby = GoogleMap(
      compassEnabled: true,
      indoorViewEnabled: true,
      trafficEnabled: true,
      mapType: mMapType,
      markers: markers.toSet(),
      onCameraMove: (newPosition) => clusteringHelper.onCameraMove(newPosition, forceUpdate: false),
      onCameraIdle: clusteringHelper != null ? clusteringHelper.onMapIdle : null,
      initialCameraPosition: initialPosition,
      //onTap: _handleTap,
      onMapCreated: (GoogleMapController controller) {
        clusteringHelper.mapController = controller;
        _controller.complete(controller);
        clusteringHelper.updateMap();
      },
    );*/

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: Container(
                color: grocery_colorPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            finish(context);
                          },
                          icon: Icon(Icons.clear, size: 24, color: grocery_color_white),
                        ),
                        24.width,
                        Text(grocery_storeLocator, style: boldTextStyle(size: 18)).expand(),
                        Icon(Icons.search, size: 24, color: grocery_color_white),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TabBar(
                        indicatorWeight: 4.0,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: grocery_color_white,
                        labelColor: grocery_color_white,
                        isScrollable: false,
                        unselectedLabelColor: grocery_color_white.withOpacity(0.5),
                        onTap: (index) {
                          if (index == 0) {
                            print('Hellooo');
                          } else if (index == 1) {
                            // TODO Without NullSafety Geo coder
                            //initMemoryClustering(context);
                          }
                        },
                        tabs: [
                          Container(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Text(
                              grocery_allStores,
                              style: TextStyle(fontSize: textSizeMedium),
                            ),
                          ),
                          // TODO Without NullSafety Geo coder
                          /*Container(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              grocery_nearby,
                              style: TextStyle(fontSize: textSizeMedium),
                            ),
                          ),*/
                        ],
                      ),
                    ).paddingOnly(top: 24),
                  ],
                ).paddingOnly(left: 12, right: 16),
              ),
            ),
            body: TabBarView(
              children: <Widget>[allStores],
              physics: NeverScrollableScrollPhysics(),
              // TODO Without NullSafety Geo coder
              // children: <Widget>[allStores, nearby],
            ),
          ),
        ),
      ),
    );
  }
//TODO Geo coder Without null safety
/*  getLocation(LatLng point) async {
    var coordinates = Coordinates(point.latitude, point.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first.addressLine;
  }*/
//TODO Geo coder Without null safety
/* void _handleTap(LatLng point) async {
    toasty(context, 'Fetching Location');
    var location = await getLocation(point);
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        draggable: true,
        infoWindow: InfoWindow(
          title: location,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ));
    });
  }*/
}
