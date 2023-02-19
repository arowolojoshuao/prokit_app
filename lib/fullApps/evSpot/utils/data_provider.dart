import 'package:prokit_flutter/fullApps/evSpot/models/filter_amenities_cb.dart';
import 'package:prokit_flutter/fullApps/evSpot/models/filter_connection_type.dart';
import 'package:prokit_flutter/fullApps/evSpot/models/filter_speed_cb.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';

List<ConnectionType> connectionItem = [
  ConnectionType(connectionItemTitle: 'J-1772'),
  ConnectionType(connectionItemTitle: 'Tesla'),
  ConnectionType(connectionItemTitle: 'Mennekes'),
  ConnectionType(connectionItemTitle: 'CCS2'),
  ConnectionType(connectionItemTitle: 'Chandemo'),
  ConnectionType(connectionItemTitle: 'CCS2 2'),
];

List<SpeedCB> speedCB = [
  SpeedCB(speedCBTitle: 'Standard (3.7 kw)'),
  SpeedCB(speedCBTitle: 'Semi fast (3.7 - 20 kw)'),
  SpeedCB(speedCBTitle: 'Fast (20 - 43 kw)'),
  SpeedCB(speedCBTitle: 'Ultra Fast ( > 43 kw )'),
];

List<AmenitiesCB> amenitiesCB = [
  AmenitiesCB(amenitiesCBTitle: 'Washroom'),
  AmenitiesCB(amenitiesCBTitle: 'Foods'),
  AmenitiesCB(amenitiesCBTitle: 'Shopping'),
  AmenitiesCB(amenitiesCBTitle: 'Pharmacy'),
  AmenitiesCB(amenitiesCBTitle: 'Pharmacy'),
  AmenitiesCB(amenitiesCBTitle: 'Wifi'),
  AmenitiesCB(amenitiesCBTitle: 'Washroom'),
  AmenitiesCB(amenitiesCBTitle: 'Beverages'),
];

final connectionTypeImg = [conn_type_img_first, conn_type_img_second, conn_type_img_first, conn_type_img_second, conn_type_img_first, conn_type_img_second];
final icons = [ic_washroom, ic_foods, ic_shopping, ic_pharmacy, ic_pharmacy, ic_wifi, ic_washroom, ic_foods];

final List<String> policyText = [
  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
];
