import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBCommonNameImageModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBFormTextField.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBSearchDestinationModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBChooseDestinationScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

// ignore: must_be_immutable
class JCBUpdateFavouriteScreen extends StatefulWidget {
  JCBSearchDestinationModel? destination;

  JCBUpdateFavouriteScreen({this.destination});

  @override
  State<JCBUpdateFavouriteScreen> createState() => _JCBUpdateFavouriteScreenState();
}

class _JCBUpdateFavouriteScreenState extends State<JCBUpdateFavouriteScreen> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController addCont = TextEditingController();

  FocusNode name = FocusNode();
  FocusNode add = FocusNode();

  final List<JCBCommonNameImageModel> list = getFavTypes();

  int selectedIndex = 2;

  @override
  void initState() {
    if (widget.destination != null) {
      nameCont.text = widget.destination!.name;
      addCont.text = widget.destination!.address;
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? context.cardColor : jcbBackGroundColor,
      appBar: AppBar(
        leading: jcbBackWidget(context),
        centerTitle: true,
        title: Text(widget.destination != null ? 'Update favourite place' : 'Add favourite place', style: boldTextStyle()),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                border: Border(
                  bottom: BorderSide(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
                  top: BorderSide(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: list.map((e) {
                      int index = list.indexOf(e);
                      return Container(
                        width: context.width() / 3 - 16,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: radius(jcbButtonRadius),
                          border: Border.all(
                              color: selectedIndex == index
                                  ? appStore.isDarkModeOn
                                      ? Colors.white
                                      : jcbDarkColor
                                  : jcbGreyColor,
                              width: 1),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            jcbCommonCachedNetworkImage(
                              e.image,
                              color: selectedIndex == index
                                  ? appStore.isDarkModeOn
                                      ? Colors.white
                                      : jcbDarkColor
                                  : jcbGreyColor,
                              height: 20,
                              width: 20,
                              fit: BoxFit.cover,
                            ),
                            6.width,
                            Text(e.name,
                                style: primaryTextStyle(
                                    color: selectedIndex == index
                                        ? appStore.isDarkModeOn
                                            ? Colors.white
                                            : jcbDarkColor
                                        : jcbGreyColor)),
                          ],
                        ),
                      ).onTap(() {
                        selectedIndex = index;
                        setState(() {});
                      }, borderRadius: radius(jcbButtonRadius));
                    }).toList(),
                  ),
                  16.height,
                  JCBFormTextField(
                    controller: nameCont,
                    focus: name,
                    nextFocus: add,
                    label: 'Place Name',
                    textFieldType: TextFieldType.NAME,
                  ),
                  16.height,
                  JCBFormTextField(
                    controller: addCont,
                    focus: add,
                    textInputAction: TextInputAction.done,
                    label: 'Place Address',
                    textFieldType: TextFieldType.NAME,
                  ),
                  16.height,
                  AppButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.map_outlined, color: Colors.white),
                        6.width,
                        Text('Pick on map'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
                      ],
                    ),
                    onTap: () {
                      JCBChooseDestinationScreen().launch(context);
                    },
                    color: jcbPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
                    elevation: 0,
                  ),
                ],
              ),
            ),
            200.height,
            AppButton(
              width: context.width() - 32,
              child: Text('save place'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
              onTap: () {
                if (nameCont.text != '' && addCont.text != '') {
                  finish(context, JCBSearchDestinationModel(name: nameCont.text, address: addCont.text));
                } else {
                  return toast('Please enter proper details');
                }
              },
              color: jcbPrimaryColor,
              elevation: 0,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
            ),
          ],
        ),
      ),
    );
  }
}
