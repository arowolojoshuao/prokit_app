import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/last_booking_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';
import 'package:prokit_flutter/main.dart';

import '../custom_widget/space.dart';
import '../models/active_bookings_model.dart';

class CancelBookingScreen extends StatefulWidget {
  final int activeId;

  const CancelBookingScreen({Key? key, required this.activeId}) : super(key: key);

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  String? refundMethod;
  String? reasonForCancel;
  int itemCount = 1;

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Please select valid details'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Ok', style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: transparent,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        title: Text(
          "Cancel Booking",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        ),
      ),
      bottomSheet: BottomSheet(
        elevation: 10,
        enableDrag: false,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 45),
                shape: StadiumBorder(),
                backgroundColor: appStore.isDarkModeOn ? Colors.grey.withOpacity(0.2) : Colors.black,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Cancel Service",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              onPressed: () {
                if (refundMethod == null) {
                  _showAlertDialog();
                } else if (reasonForCancel == null) {
                  _showAlertDialog();
                } else {
                  cancelBooking(widget.activeId);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LastBookingScreen(cancel: true)),
                  );
                }
              },
            ),
          );
        },
        onClosing: () {},
      ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    color: appStore.isDarkModeOn ? cardColorDark : cardColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.10,
                                      width: MediaQuery.of(context).size.height * 0.10,
                                      child: Image.asset('images/homeService/home.jpg', fit: BoxFit.cover),
                                    ),
                                  ),
                                  Space(16),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        activeBooking[widget.activeId].serviceName,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                                      ),
                                      Space(4),
                                      Text(
                                        activeBooking[widget.activeId].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: greyColor, fontSize: 12),
                                      ),
                                      Space(4),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.watch_later_outlined, color: greyColor, size: 14),
                                          Space(2),
                                          Text(
                                            activeBooking[widget.activeId].time,
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                                          ),
                                          Space(2),
                                          Text("on", style: TextStyle(color: greyColor, fontSize: 8)),
                                          Space(2),
                                          Text("Thursday", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: (BorderRadius.circular(5)),
                                  border: Border.all(width: 1, color: itemCountContainerBorder),
                                  color: itemCountContainer,
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.remove, color: blackColor, size: 16),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 3),
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: whiteColor),
                                      child: Text(itemCount.toString(), style: TextStyle(color: blackColor, fontSize: 16)),
                                    ),
                                    Icon(Icons.add, color: blackColor, size: 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Space(42),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text("1590 Sqft", style: TextStyle(color: greyColor, fontSize: 14, fontWeight: FontWeight.w500)),
                                    VerticalDivider(thickness: 2, color: greyColor),
                                    Text("3BHK", style: TextStyle(color: greyColor, fontSize: 14, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              Text(
                                "₹${activeBooking[widget.activeId].price.toString()}",
                                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Space(32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Summary",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                      ),
                    ],
                  ),
                  Space(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: greyColor, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        "₹${activeBooking[widget.activeId].price.toString()}",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Space(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "GST",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: greyColor, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text("₹160", textAlign: TextAlign.start, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Space(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Coupon Discount",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: greyColor, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text("- ₹160", textAlign: TextAlign.start, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Space(8),
                  Divider(indent: 8, endIndent: 8, color: greyColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                      Text(
                        "₹${activeBooking[widget.activeId].price.toString()}",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                  Space(42),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Refund Method",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
            ),
            Space(16),
            RadioListTile(
              title: Text("Refund to Original Payment Method", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
              value: "OriginalPayment",
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              activeColor: orangeColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 4),
              groupValue: refundMethod,
              onChanged: (value) {
                refundMethod = value.toString();
                setState(() {});
              },
            ),
            RadioListTile(
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              title: Text("Add to My Wallet", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
              contentPadding: EdgeInsets.symmetric(horizontal: 4),
              activeColor: orangeColor,
              value: "MyWallet",
              groupValue: refundMethod,
              onChanged: (value) {
                refundMethod = value.toString();
                setState(() {});
              },
            ),
            Space(32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Why are you cancelling this service",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
            ),
            Space(8),
            RadioListTile(
              title: Text("Booked by mistake"),
              value: "mistake",
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              contentPadding: EdgeInsets.symmetric(horizontal: 4),
              activeColor: orangeColor,
              groupValue: reasonForCancel,
              onChanged: (value) {
                reasonForCancel = value.toString();
                setState(() {});
              },
            ),
            RadioListTile(
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              title: Text("Not available on the date of service"),
              activeColor: orangeColor,
              value: "noAvailable",
              contentPadding: EdgeInsets.symmetric(horizontal: 4),
              groupValue: reasonForCancel,
              onChanged: (value) {
                setState(() {
                  reasonForCancel = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text("No longer needed"),
              activeColor: orangeColor,
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              value: "noNeeded",
              contentPadding: EdgeInsets.symmetric(horizontal: 4),
              groupValue: reasonForCancel,
              onChanged: (value) {
                reasonForCancel = value.toString();
                setState(() {});
              },
            ),
            Space(80),
          ],
        ),
      ),
    );
  }
}
