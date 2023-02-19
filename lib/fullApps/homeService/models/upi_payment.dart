import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';

List<UpiPayment> upiPaymentData = upiPaymentList();

class UpiPayment {
  String? paymentUrl;
  String? PaymentName;

  UpiPayment({this.paymentUrl, this.PaymentName});
}

List<UpiPayment> upiPaymentList() {
  List<UpiPayment> dataList = [];

  dataList.add(UpiPayment(paymentUrl: paytm, PaymentName: "Paytm"));
  dataList.add(UpiPayment(paymentUrl: phonePay, PaymentName: "PhonePe"));
  dataList.add(UpiPayment(paymentUrl: amazonPay, PaymentName: "Amazon Pay"));
  dataList.add(UpiPayment(paymentUrl: freeCharge, PaymentName: "Free charge"));
  dataList.add(UpiPayment(paymentUrl: olaMoney, PaymentName: "Ola Money"));

  return dataList;
}
