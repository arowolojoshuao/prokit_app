import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';

List<CallingModel> callingDataList() {
  List<CallingModel> callingList = [];
  callingList.add(
    CallingModel(
      imageUrl: "images/carea/mercedes.png",
      userName: "Nissan Official",
      colorValue: Colors.green,
      subTitle: "Incoming | Dec 19 2022",
      icon: Icons.call_received,
    ),
  );
  callingList.add(
    CallingModel(
      imageUrl: "images/carea/tesla.png",
      userName: "Opel Store",
      colorValue: Colors.blue,
      subTitle: "Outgoing | Jan 19 2022",
      icon: Icons.call_made,
    ),
  );
  callingList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      userName: "Tesla Motor",
      colorValue: Colors.red,
      subTitle: "Missed | Feb 19 2022",
      icon: Icons.call_missed,
    ),
  );
  callingList.add(
    CallingModel(
      imageUrl: "images/carea/honda.png",
      userName: "Dongfeng Store",
      colorValue: Colors.green,
      subTitle: "Incoming | Mar 19 2022",
      icon: Icons.call_received,
    ),
  );
  callingList.add(
    CallingModel(
      imageUrl: "images/carea/toyota.png",
      userName: "BMW Store",
      colorValue: Colors.blue,
      subTitle: "Outgoing | Apr 19 2022",
      icon: Icons.call_made,
    ),
  );
  callingList.add(
    CallingModel(
      imageUrl: "images/carea/volvo.png",
      userName: "Valkswagen official",
      colorValue: Colors.red,
      subTitle: "Missed | May 19 2022",
      icon: Icons.call_missed,
    ),
  );
  callingList.add(
    CallingModel(
      imageUrl: "images/carea/hyundai.png",
      userName: "Mercedes-Benz",
      colorValue: Colors.green,
      subTitle: "Incoming | June 19 2022",
      icon: Icons.call_received,
    ),
  );
  callingList.add(
    CallingModel(
      imageUrl: "images/carea/more.png",
      userName: "Honda Motor",
      colorValue: Colors.blue,
      subTitle: "Outgoing | July 19 2022",
      icon: Icons.call_made,
    ),
  );
  callingList.add(
    CallingModel(
      imageUrl: "images/carea/volvo.png",
      userName: "BMW Store",
      colorValue: Colors.red,
      subTitle: "Missed | Aug 19 2022",
      icon: Icons.call_missed,
    ),
  );

  return callingList;
}

List<CallingModel> chatDataList() {
  List<CallingModel> chatList = [];
  chatList.add(
    CallingModel(
      imageUrl: "images/carea/mercedes.png",
      arriveTime: "09.10",
      countNumber: "2",
      userName: "Nissan Official",
      colorValue: Colors.blue,
      subTitle: "Hello welcome to BMW",
    ),
  );
  chatList.add(
    CallingModel(
      imageUrl: "images/carea/tesla.png",
      arriveTime: "10.45",
      countNumber: "4",
      userName: "Opel Store",
      colorValue: Colors.green,
      subTitle: "I just completed it",
    ),
  );
  chatList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      arriveTime: "12.20",
      countNumber: "6",
      userName: "Tesla Motor",
      colorValue: Colors.blue,
      subTitle: "omg, that is amazing",
    ),
  );
  chatList.add(
    CallingModel(
      imageUrl: "images/carea/honda.png",
      arriveTime: "04.05",
      countNumber: "",
      userName: "Dongfeng Store",
      colorValue: Colors.green,
      subTitle: "Wow, this is really fast",
    ),
  );
  chatList.add(
    CallingModel(
      imageUrl: "images/carea/toyota.png",
      arriveTime: "06.30",
      countNumber: "8",
      userName: "BMW Store",
      colorValue: Colors.blue,
      subTitle: "Just idea for next time",
    ),
  );
  chatList.add(
    CallingModel(
      imageUrl: "images/carea/volvo.png",
      arriveTime: "08.15",
      countNumber: "",
      userName: "Valkswagen official",
      colorValue: Colors.green,
      subTitle: "I m really like driving",
    ),
  );
  chatList.add(
    CallingModel(
      imageUrl: "images/carea/hyundai.png",
      arriveTime: "10.20",
      countNumber: "4",
      userName: "Mercedes-Benz",
      colorValue: Colors.blue,
      subTitle: "perfect",
    ),
  );
  chatList.add(
    CallingModel(
      imageUrl: "images/carea/more.png",
      arriveTime: "12.35",
      countNumber: "",
      userName: "Honda Motor",
      colorValue: Colors.green,
      subTitle: "I just completed it",
    ),
  );
  chatList.add(
    CallingModel(
      imageUrl: "images/carea/volvo.png",
      arriveTime: "09.10",
      countNumber: "8",
      userName: "BMW Store",
      colorValue: Colors.blue,
      subTitle: "Just idea for next time",
    ),
  );

  return chatList;
}

List<CallingModel> walletDataList() {
  List<CallingModel> walletList = [];
  walletList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      arriveTime: "Order",
      countNumber: "\$187.256",
      userName: "Nissan Official",
      colorValue: Colors.blue,
      subTitle: "Incoming | Dec 19 2022",
      icon: Icons.call_received,
    ),
  );
  walletList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      arriveTime: "Top up",
      countNumber: "\$250.150",
      userName: "Opel Store",
      colorValue: Colors.green,
      subTitle: "Outgoing | Jan 19 2022",
      icon: Icons.call_made,
    ),
  );
  walletList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      arriveTime: "order",
      countNumber: "\$300.100",
      userName: "Tesla Motor",
      colorValue: Colors.red,
      subTitle: "Missed | Feb 19 2022",
      icon: Icons.call_missed,
    ),
  );
  walletList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      arriveTime: "Top up",
      countNumber: "\$500.250",
      userName: "Dongfeng Store",
      colorValue: Colors.green,
      subTitle: "Incoming | Mar 19 2022",
      icon: Icons.call_received,
    ),
  );
  walletList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      arriveTime: "Order",
      countNumber: "\$600.150",
      userName: "BMW Store",
      colorValue: Colors.blue,
      subTitle: "Outgoing | Apr 19 2022",
      icon: Icons.call_made,
    ),
  );
  walletList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      arriveTime: "Top up",
      countNumber: "\$600.200",
      userName: "Valkswagen official",
      colorValue: Colors.red,
      subTitle: "Missed | May 19 2022",
      icon: Icons.call_missed,
    ),
  );
  walletList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      arriveTime: "Order",
      countNumber: "\$187.300",
      userName: "Mercedes-Benz",
      colorValue: Colors.blue,
      subTitle: "Incoming | June 19 2022",
      icon: Icons.call_received,
    ),
  );
  walletList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      arriveTime: "Top up",
      countNumber: "\200.400",
      userName: "Honda Motor",
      colorValue: Colors.green,
      subTitle: "Outgoing | July 19 2022",
      icon: Icons.call_made,
    ),
  );
  walletList.add(
    CallingModel(
      imageUrl: "images/carea/bmw.png",
      arriveTime: "Order",
      countNumber: "\210.600",
      userName: "BMW Store",
      colorValue: Colors.red,
      subTitle: "Missed | Aug 19 2022",
      icon: Icons.call_missed,
    ),
  );

  return walletList;
}

List<CallingModel> activeDataList() {
  List<CallingModel> activeList = [];
  activeList.add(
    CallingModel(
      imageUrl: "images/carea/car1.png",
      countNumber: "\$187.256",
      userName: "Nissan Official",
      colorValue: Colors.blue,
      subTitle: "Blue",
    ),
  );
  activeList.add(
    CallingModel(
      imageUrl: "images/carea/car2.png",
      countNumber: "\$250.150",
      userName: "Opel Store",
      colorValue: Colors.green,
      subTitle: "Green",
    ),
  );
  activeList.add(
    CallingModel(
      imageUrl: "images/carea/car3.png",
      countNumber: "\$300.100",
      userName: "Tesla Motor",
      colorValue: Colors.yellow,
      subTitle: "Yellow",
    ),
  );
  activeList.add(
    CallingModel(
      imageUrl: "images/carea/car4.png",
      countNumber: "\$500.250",
      userName: "Dongfeng Store",
      colorValue: Colors.red,
      subTitle: "Red",
    ),
  );
  activeList.add(
    CallingModel(
      imageUrl: "images/carea/car5.png",
      countNumber: "\$600.150",
      userName: "BMW Store",
      colorValue: Colors.blueAccent,
      subTitle: "BlueAccent",
    ),
  );
  activeList.add(
    CallingModel(
      imageUrl: "images/carea/car6.png",
      countNumber: "\$600.200",
      userName: "Valkswagen official",
      colorValue: Colors.greenAccent,
      subTitle: "GreenAccent",
    ),
  );
  activeList.add(
    CallingModel(
      imageUrl: "images/carea/car7.png",
      countNumber: "\$187.300",
      userName: "Mercedes-Benz",
      colorValue: Colors.purple,
      subTitle: "Purple",
    ),
  );
  activeList.add(
    CallingModel(
      imageUrl: "images/carea/car8.png",
      countNumber: "\200.400",
      userName: "Honda Motor",
      colorValue: Colors.pink,
      subTitle: "Pink",
    ),
  );
  activeList.add(
    CallingModel(
      imageUrl: "images/carea/car9.png",
      countNumber: "\210.600",
      userName: "BMW Store",
      colorValue: Colors.blue,
      subTitle: "Blue",
    ),
  );

  return activeList;
}

List<BHMessageModel> getChatMsgData() {
  List<BHMessageModel> list = [];

  BHMessageModel c1 = BHMessageModel();
  c1.senderId = BHSender_id;
  c1.receiverId = BHReceiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  BHMessageModel c2 = BHMessageModel();
  c2.senderId = BHSender_id;
  c2.receiverId = BHReceiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  BHMessageModel c3 = BHMessageModel();
  c3.senderId = BHReceiver_id;
  c3.receiverId = BHSender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  BHMessageModel c4 = BHMessageModel();
  c4.senderId = BHSender_id;
  c4.receiverId = BHReceiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  BHMessageModel c5 = BHMessageModel();
  c5.senderId = BHSender_id;
  c5.receiverId = BHReceiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  BHMessageModel c6 = BHMessageModel();
  c6.senderId = BHReceiver_id;
  c6.receiverId = BHSender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  BHMessageModel c7 = BHMessageModel();
  c7.senderId = BHSender_id;
  c7.receiverId = BHReceiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  BHMessageModel c8 = BHMessageModel();
  c8.senderId = BHReceiver_id;
  c8.receiverId = BHSender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  BHMessageModel c9 = BHMessageModel();
  c9.senderId = BHSender_id;
  c9.receiverId = BHReceiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  BHMessageModel c10 = BHMessageModel();
  c10.senderId = BHReceiver_id;
  c10.receiverId = BHSender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  BHMessageModel c11 = BHMessageModel();
  c11.senderId = BHReceiver_id;
  c11.receiverId = BHSender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  BHMessageModel c12 = BHMessageModel();
  c12.senderId = BHSender_id;
  c12.receiverId = BHReceiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  BHMessageModel c13 = BHMessageModel();
  c13.senderId = BHSender_id;
  c13.receiverId = BHReceiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  BHMessageModel c14 = BHMessageModel();
  c14.senderId = BHReceiver_id;
  c14.receiverId = BHSender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  BHMessageModel c15 = BHMessageModel();
  c15.senderId = BHSender_id;
  c15.receiverId = BHReceiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  BHMessageModel c16 = BHMessageModel();
  c16.senderId = BHReceiver_id;
  c16.receiverId = BHSender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  BHMessageModel c17 = BHMessageModel();
  c17.senderId = BHSender_id;
  c17.receiverId = BHReceiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  BHMessageModel c18 = BHMessageModel();
  c18.senderId = BHReceiver_id;
  c18.receiverId = BHSender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}

List<CallingModel> carBrandList() {
  List<CallingModel> carBrandData = [];
  carBrandData.add(CallingModel(userName: "All", selectCarCategory: false));
  carBrandData.add(CallingModel(userName: "Mercedes", selectCarCategory: false));
  carBrandData.add(CallingModel(userName: "Tesla", selectCarCategory: false));
  carBrandData.add(CallingModel(userName: "BMW", selectCarCategory: false));
  carBrandData.add(CallingModel(userName: "Honda", selectCarCategory: false));

  return carBrandData;
}

List<CallingModel> carConditionList() {
  List<CallingModel> carConditionData = [];
  carConditionData.add(CallingModel(userName: "All", selectCarCategory: false));
  carConditionData.add(CallingModel(userName: "New", selectCarCategory: false));
  carConditionData.add(CallingModel(userName: "Used", selectCarCategory: false));

  return carConditionData;
}

List<CallingModel> carRattingList() {
  List<CallingModel> carRattingData = [];
  carRattingData.add(CallingModel(userName: "All", selectCarCategory: false));
  carRattingData.add(CallingModel(userName: "5", selectCarCategory: false));
  carRattingData.add(CallingModel(userName: "4", selectCarCategory: false));
  carRattingData.add(CallingModel(userName: "3", selectCarCategory: false));
  carRattingData.add(CallingModel(userName: "2", selectCarCategory: false));

  return carRattingData;
}
