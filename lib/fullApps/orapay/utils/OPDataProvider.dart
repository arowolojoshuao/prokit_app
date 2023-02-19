import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/orapay/model/OPModel.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Colors.dart';

List<OPPickVerifyModel> getCardListItems() {
  List<OPPickVerifyModel> cardList = [];
  cardList.add(OPPickVerifyModel(cardTitle: 'Video call', cardSubTitle: 'We will call you shortly', image: 'images/orapay/opvideocall.png', cardColor: Color(0xFFFF6E18)));
  cardList.add(OPPickVerifyModel(cardTitle: 'Outlets', cardSubTitle: 'You came to our outlates', image: 'images/orapay/opoutlets.png', cardColor: Color(0xFF343EDB)));
  cardList.add(OPPickVerifyModel(cardTitle: 'Agents', cardSubTitle: 'Our agents will come to you', image: 'images/orapay/opagent.png', cardColor: Color(0xFFFF6E18)));
  return cardList;
}

List<OPPickVerifyModel> getAllCardListItems() {
  List<OPPickVerifyModel> allCardList = [];
  allCardList.add(OPPickVerifyModel(cardTitle: 'Visa', cardSubTitle: 'John Doe', image: 'images/orapay/opchip.png', cardColor: opPrimaryColor, cardExpireDate: '12/20', cardNumber: '3456'));
  allCardList.add(OPPickVerifyModel(cardTitle: 'Visa', cardSubTitle: 'John Doe', image: 'images/orapay/opchip.png', cardColor: opOrangeColor, cardExpireDate: '12/20', cardNumber: '3456'));
  allCardList.add(OPPickVerifyModel(cardTitle: 'Visa', cardSubTitle: 'John Doe', image: 'images/orapay/opchip.png', cardColor: opPrimaryColor, cardExpireDate: '12/20', cardNumber: '3456'));
  allCardList.add(OPPickVerifyModel(cardTitle: 'Visa', cardSubTitle: 'John Doe', image: 'images/orapay/opchip.png', cardColor: opOrangeColor, cardExpireDate: '12/20', cardNumber: '3456'));
  allCardList.add(OPPickVerifyModel(cardTitle: 'Visa', cardSubTitle: 'John Doe', image: 'images/orapay/opchip.png', cardColor: opPrimaryColor, cardExpireDate: '12/20', cardNumber: '3456'));

  return allCardList;
}

List<OPPickVerifyModel> getTransactionListItems() {
  List<OPPickVerifyModel> transactionList = [];
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment sent", cardNumber: "- ₹50", cardColor: Colors.red, icon: Icons.call_received));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment sent", cardNumber: "- ₹130", cardColor: Colors.red, icon: Icons.call_received));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment sent", cardNumber: "- ₹170", cardColor: Colors.red, icon: Icons.call_received));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));
  transactionList.add(OPPickVerifyModel(cardTitle: "John Deo", cardSubTitle: "Payment Received", cardNumber: "+ ₹250", cardColor: opPrimaryColor, icon: Icons.call_made));

  return transactionList;
}

List<OPPickVerifyModel> getSettingItems() {
  List<OPPickVerifyModel> settingList = [];
  settingList.add(OPPickVerifyModel(cardTitle: 'Information', icon: Icons.person));
  settingList.add(OPPickVerifyModel(cardTitle: 'Security', icon: Icons.security));
  settingList.add(OPPickVerifyModel(cardTitle: 'Contact us', icon: Icons.message));
  settingList.add(OPPickVerifyModel(cardTitle: 'Support', icon: Icons.help));
  settingList.add(OPPickVerifyModel(cardTitle: 'Logout', icon: Icons.access_time));

  return settingList;
}
