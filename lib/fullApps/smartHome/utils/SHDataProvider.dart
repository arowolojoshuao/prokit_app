import 'package:prokit_flutter/fullApps/smartHome/component/SHAirConditionerDeviceComponent.dart';
import 'package:prokit_flutter/fullApps/smartHome/component/SHAirPurifierDeviceComponenet.dart';
import 'package:prokit_flutter/fullApps/smartHome/component/SHClimateDeviceComponentWidget.dart';
import 'package:prokit_flutter/fullApps/smartHome/component/SHFanDeviceComponent.dart';
import 'package:prokit_flutter/fullApps/smartHome/component/SHLightDeviceComponenet.dart';
import 'package:prokit_flutter/fullApps/smartHome/component/SHSpeakersDeviceComponent.dart';
import 'package:prokit_flutter/fullApps/smartHome/component/SHTelevisionDeviceComponenet.dart';
import 'package:prokit_flutter/fullApps/smartHome/component/SHWashingMachineDeviceComponent.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';

import 'SHConstant.dart';

List<SHModel> getMemberList() {
  List<SHModel> list = [];
  list.add(
    SHModel(
      img: 'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
      name: 'Guy Hawkins',
      subtitle: 'Household',
      email: 'guy-hawkins@gmail.com',
    ),
  );
  list.add(SHModel(
      img: 'https://www.whatsappprofiledpimages.com/wp-content/uploads/2021/02/Beautiful-Girl-Profile-Pics-Wallpaper-Download-3.jpg',
      name: 'Bessie Cooper',
      subtitle: 'Household',
      email: 'bessie-cooper@gmail.com'));
  list.add(
    SHModel(
      img: 'https://bombaymeatco.com/wp-content/uploads/2014/11/free-profile-photo-whatsapp-4.png',
      name: 'Eleanor Pena',
      subtitle: 'Guest',
      email: 'eleanor-pena@gmail.com',
    ),
  );

  return list;
}

List<SHModel> getScenesList() {
  List<SHModel> list = [];
  list.add(SHModel(img: 'images/shHome/sun.png', name: 'Morning\'', subtitle: '5 devices is on'));
  list.add(SHModel(img: 'images/shHome/night.png', name: 'Night', subtitle: '5 devices'));
  list.add(SHModel(img: 'images/shHome/music.png', name: 'Music', subtitle: '5 devices'));
  list.add(SHModel(img: 'images/shHome/movie.png', name: 'Movie', subtitle: '5 devices'));
  list.add(SHModel(img: 'images/shHome/leave.png', name: 'Leave', subtitle: '5 devices'));
  return list;
}

List<SHModel> getHomeList() {
  List<SHModel> list = [];
  list.add(
    SHModel(
      img: LivingRoomImage,
      name: 'Living Room',
      subtitle: '2/6 is on',
      shDeviceModel: [
        SHDeviceModel(
          deviceImg: 'images/shHome/thermometer.png',
          deviceTitle: 'Climate',
          sublist: getDeviceList(),
        ),
        SHDeviceModel(
          deviceImg: 'images/shHome/fan.png',
          deviceTitle: 'Fan',
          sublist: getDeviceList(),
        ),
        SHDeviceModel(
          deviceImg: 'images/shHome/air_conditioner.png',
          deviceTitle: 'Air Conditioner',
          sublist: getDeviceList(),
        ),
        SHDeviceModel(
          deviceImg: 'images/shHome/air_purifier.png',
          deviceTitle: 'Air purifier',
          sublist: getDeviceList(),
        ),
        SHDeviceModel(
          deviceImg: 'images/shHome/lightbulb.png',
          deviceTitle: 'Celling light',
          sublist: getDeviceList(),
        ),
      ],
    ),
  );
  list.add(
    SHModel(
      img: kitchenImage,
      name: 'Kitchen',
      subtitle: '3/6 is on',
      shDeviceModel: [
        SHDeviceModel(
          deviceImg: 'images/shHome/washing_machine.png',
          deviceTitle: 'Washing machine',
          sublist: getKitchenDeviceList(),
          deviceComponent: SHWashingMachineDeviceComponent(),
        ),
        SHDeviceModel(
          deviceImg: 'images/shHome/tv.png',
          deviceTitle: 'Tv',
          sublist: getKitchenDeviceList(),
          deviceComponent: SHTelevisionDeviceComponent(),
        ),
        SHDeviceModel(
          deviceImg: 'images/shHome/speaker.png',
          deviceTitle: 'Speakers',
          sublist: getKitchenDeviceList(),
          deviceComponent: SHSpeakerDeviceComponent(),
        )
      ],
    ),
  );
  list.add(
    SHModel(
      img: BedRoomImage,
      name: 'Bedroom',
      subtitle: '3/6 is on',
      shDeviceModel: [
        SHDeviceModel(
          deviceImg: 'images/shHome/thermometer.png',
          deviceTitle: 'Climate',
          sublist: getDeviceList(),
        ),
        SHDeviceModel(
          deviceImg: 'images/shHome/fan.png',
          deviceTitle: 'Fan',
          sublist: getDeviceList(),
        ),
        SHDeviceModel(
          deviceImg: 'images/shHome/air_conditioner.png',
          deviceTitle: 'Air Conditioner',
          sublist: getDeviceList(),
        ),
        SHDeviceModel(
          deviceImg: 'images/shHome/air_purifier.png',
          deviceTitle: 'Air purifier',
          sublist: getDeviceList(),
        ),
        SHDeviceModel(
          deviceImg: 'images/shHome/lightbulb.png',
          deviceTitle: 'Celling light',
          sublist: getDeviceList(),
        ),
      ],
    ),
  );
  return list;
}

List<SHDeviceModel> getAllDevicesList() {
  List<SHDeviceModel> list = [];
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/air_conditioner.png',
      deviceTitle: 'AC',
      deviceSubTitle: 'x3 Devices',
      sublist: getDeviceList(),
    ),
  );
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/thermometer.png',
      deviceTitle: 'Climate',
      deviceSubTitle: 'x3 Devices',
      sublist: getDeviceList(),
    ),
  );
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/tv.png',
      deviceTitle: 'TV',
      deviceSubTitle: 'x3 Devices',
      sublist: getDeviceList(),
    ),
  );
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/fan.png',
      deviceTitle: 'Fan',
      deviceSubTitle: 'x3 Devices',
      sublist: getDeviceList(),
    ),
  );
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/thermometer.png',
      deviceTitle: 'Climate',
      deviceSubTitle: 'x3 Devices',
      sublist: getDeviceList(),
    ),
  );

  return list;
}

List<SHModel> getStatisticList() {
  List<SHModel> list = [];
  list.add(
    SHModel(img: 'images/shHome/air_conditioner.png', name: 'AC', subtitle: '120 hours'),
  );
  list.add(
    SHModel(img: 'images/shHome/thermometer.png', name: 'Climate', subtitle: '50 hours'),
  );
  list.add(
    SHModel(img: 'images/shHome/tv.png', name: 'TV', subtitle: '220 hours'),
  );
  list.add(
    SHModel(img: 'images/shHome/fan.png', name: 'Fan', subtitle: '60 hours'),
  );
  list.add(
    SHModel(img: 'images/shHome/thermometer.png', name: 'Climate', subtitle: '160 hours'),
  );
  return list;
}

List<SHDeviceModel> getDeviceList() {
  List<SHDeviceModel> list = [];
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/thermometer.png',
      deviceTitle: 'Climate',
      deviceComponent: SHClimateDeviceComponentWidget(),
    ),
  );
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/fan.png',
      deviceTitle: 'Fan',
      deviceType: DeviceTypeFan,
      deviceComponent: SHFanDeviceComponent(),
    ),
  );
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/air_conditioner.png',
      deviceTitle: 'Air Conditioner',
      deviceType: DeviceTypeAC,
      deviceComponent: SHAirConditionerDeviceComponent(),
    ),
  );
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/air_purifier.png',
      deviceTitle: 'Purifier',
      deviceType: DeviceTypePurifier,
      deviceComponent: SHAirPurifierDeviceComponent(),
    ),
  );
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/lightbulb.png',
      deviceTitle: 'Celling Light',
      deviceType: DeviceTypeLight,
      deviceComponent: SHLightDeviceComponent(),
    ),
  );

  return list;
}

List<SHDeviceModel> getKitchenDeviceList() {
  List<SHDeviceModel> list = [];

  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/washing_machine.png',
      deviceTitle: 'WashingMachine',
      deviceComponent: SHWashingMachineDeviceComponent(),
    ),
  );
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/tv.png',
      deviceTitle: 'Television',
      deviceComponent: SHTelevisionDeviceComponent(),
    ),
  );
  list.add(
    SHDeviceModel(
      deviceImg: 'images/shHome/speaker.png',
      deviceTitle: 'Speakers',
      deviceComponent: SHSpeakerDeviceComponent(),
    ),
  );

  return list;
}

List<SHDeviceModel> getWashingMachineDeviceList() {
  List<SHDeviceModel> list = [];
  list.add(
    SHDeviceModel(
      deviceTitle: '2L water',
      deviceImg: 'images/shHome/waterWave.png',
    ),
  );
  list.add(
    SHDeviceModel(
      deviceTitle: '2Kg',
      deviceImg: 'images/shHome/tshirt.png',
    ),
  );
  list.add(
    SHDeviceModel(
      deviceTitle: '5G',
      deviceImg: 'images/shHome/washing_machine.png',
    ),
  );
  list.add(
    SHDeviceModel(
      deviceTitle: 'Normal',
      deviceImg: 'images/shHome/thermometer.png',
    ),
  );

  return list;
}

List<SHDeviceModel> getSpeakerDeviceMode() {
  List<SHDeviceModel> list = [];
  list.add(
    SHDeviceModel(sliderValue: 20.0, deviceTitle: 'Bass'),
  );
  list.add(
    SHDeviceModel(sliderValue: 30.0, deviceTitle: 'Def'),
  );
  list.add(
    SHDeviceModel(sliderValue: 40.0, deviceTitle: 'Center'),
  );
  list.add(
    SHDeviceModel(sliderValue: 30.0, deviceTitle: 'Space'),
  );
  list.add(
    SHDeviceModel(sliderValue: 30.0, deviceTitle: 'focus'),
  );

  return list;
}

List<ExpenseData> getChartData() {
  List<ExpenseData> list = [];
  list.add(ExpenseData(expanseCategory: 'Food', father: 55, mother: 48, daughter: 45, son: 10));
  list.add(ExpenseData(expanseCategory: 'Transport', father: 33, mother: 45, daughter: 54, son: 28));
  list.add(ExpenseData(expanseCategory: 'Medical', father: 40, mother: 23, daughter: 20, son: 34));
  list.add(ExpenseData(expanseCategory: 'Clothes', father: 75, mother: 54, daughter: 23, son: 54));
  list.add(ExpenseData(expanseCategory: 'Books', father: 12, mother: 18, daughter: 43, son: 55));
  list.add(ExpenseData(expanseCategory: 'Other', father: 23, mother: 54, daughter: 33, son: 23));

  return list;
}
