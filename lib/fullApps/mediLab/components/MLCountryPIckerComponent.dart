import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';

class MLCountryPickerComponent extends StatefulWidget {
  static String tag = '/MLCountryPickerComponent';

  @override
  MLCountryPickerComponentState createState() => MLCountryPickerComponentState();
}

class MLCountryPickerComponentState extends State<MLCountryPickerComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        6.height,
        Row(
          children: [
            CountryCodePicker(
              onChanged: log,
              initialSelection: 'IT',
              favorite: ['+1', 'US'],
              showFlag: false,
              alignLeft: false,
              padding: EdgeInsets.all(0),
            ),
            2.width,
            Icon(Icons.arrow_drop_down, size: 16).paddingRight(0.0),
          ],
        ),
        8.height,
        Container(width: 75, height: 1, color: mlColorLightGrey.withOpacity(0.2))
      ],
    );
  }
}
