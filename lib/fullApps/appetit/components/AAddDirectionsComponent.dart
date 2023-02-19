import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main.dart';
import 'package:nb_utils/nb_utils.dart';

class AAddDirectionsComponent extends StatelessWidget {
  const AAddDirectionsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top + 64),

          //Information text
          Text("Directions", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),

          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                        filled: true,
                        labelText: 'Directions 1',
                        labelStyle: TextStyle(color: Colors.grey),
                        // alignLabelWithHint: false,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                height: 60,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('1g', style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 16),
                        Icon(Icons.arrow_drop_down_outlined, color: Colors.grey),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                        filled: true,
                        labelText: 'Directions 2',
                        labelStyle: TextStyle(color: Colors.grey),
                        // alignLabelWithHint: false,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                height: 60,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('1g', style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 16),
                        Icon(Icons.arrow_drop_down_outlined, color: Colors.grey),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                        filled: true,
                        labelText: 'Directions 3',
                        labelStyle: TextStyle(color: Colors.grey),
                        // alignLabelWithHint: false,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                height: 60,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('1g', style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 16),
                        Icon(Icons.arrow_drop_down_outlined, color: Colors.grey),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('Add Directions', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
