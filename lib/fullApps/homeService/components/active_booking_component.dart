import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/homeService/custom_widget/space.dart';
import 'package:prokit_flutter/fullApps/homeService/models/active_bookings_model.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/cancel_booking_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';
import 'package:prokit_flutter/main.dart';

class ActiveBookingComponent extends StatelessWidget {
  final ActiveBookingsModel? activeBookingsModel;
  final int index;

  ActiveBookingComponent(this.index, {this.activeBookingsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CancelBookingScreen(activeId: index)),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          color: appStore.isDarkModeOn ? cardColorDark : cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      activeBookingsModel!.serviceName,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                    Text(
                      activeBookingsModel!.status,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: activeBookingsModel!.status == "In Process" ? orangeColor : blueColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Space(4),
                Divider(color: dividerColor, thickness: 1),
                Space(2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.height * 0.06,
                        child: Image.asset(home, fit: BoxFit.cover),
                      ),
                    ),
                    Space(8),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(activeBookingsModel!.name, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                        Space(4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.watch_later_outlined, color: orangeColor, size: 16),
                            Space(2),
                            Text(activeBookingsModel!.date, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            Space(2),
                            Text("at", style: TextStyle(color: orangeColor, fontSize: 12)),
                            Space(2),
                            Text(activeBookingsModel!.time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Space(4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "₹${activeBookingsModel!.price}",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                ),
                Space(4),
                Divider(color: dividerColor, thickness: 1),
                Space(4),
                Text(
                  "Cancel",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: blueColor, fontWeight: FontWeight.w900, fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
