import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/homeService/custom_widget/space.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/homeService/models/last_bookings_model.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/widgets.dart';

class BookingHistoryComponent extends StatelessWidget {
  final LastBookingsModel? lastBookings;
  final int index;

  BookingHistoryComponent(this.index, {this.lastBookings});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context, index: index);
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
                      lastBooking[index].serviceName,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                    Text(
                      lastBooking[index].status,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: lastBooking[index].status == "Completed" ? greenColor : redColor,
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
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.height * 0.07,
                        child: Image.asset(home, fit: BoxFit.cover),
                      ),
                    ),
                    Space(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(lastBooking[index].name, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                        Space(4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.watch_later_outlined, color: orangeColor, size: 16),
                            Space(2),
                            Text(lastBooking[index].date, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            Space(2),
                            Text("at", style: TextStyle(color: orangeColor, fontSize: 12)),
                            Space(2),
                            Text(lastBooking[index].time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
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
                    "₹${lastBooking[index].price}",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                ),
                Space(4),
                Divider(color: dividerColor, thickness: 1),
                Space(4),
                Text(
                  "Book Again",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
