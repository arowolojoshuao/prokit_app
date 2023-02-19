import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/main.dart';

class AAddInfoComponent extends StatelessWidget {
  const AAddInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top + 64),

          //Information text
          Text("Information", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),

          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Text("Preparation Time")),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.add, color: Colors.grey),
                          SizedBox(width: 16),
                          Text('20s', style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 16),
                          Icon(Icons.remove_outlined, color: Colors.grey),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Text("Cooking Time")),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.add, color: Colors.grey),
                          SizedBox(width: 16),
                          Text('20s', style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 16),
                          Icon(Icons.remove_outlined, color: Colors.grey),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Container(child: Text("Difficulty"), width: 120)),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Easy',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
