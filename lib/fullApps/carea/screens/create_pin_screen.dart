import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/colors.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/screens/set_finger_print_screen.dart';
import 'package:prokit_flutter/main.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  FocusNode node0 = FocusNode();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();

  TextEditingController c0 = TextEditingController();
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();

  List<FocusNode> nodes = [];
  List<TextEditingController> controller = [];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nodes = [node0, node1, node2, node3, node4];
    controller = [c0, c1, c2, c3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: careaAppBarWidget(context, titleText: "Create New PIN"),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Text(
                  'Add a PIN number to make your account\n more secure',
                  style: secondaryTextStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 42),
                Wrap(
                  spacing: 24,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      height: 68,
                      width: 60,
                      child: AppTextField(
                        autoFocus: index == 0 ? true : false,
                        controller: controller[index],
                        nextFocus: nodes[index + 1],
                        focus: nodes[index],
                        maxLength: 1,
                        textInputAction: index == 3 ? TextInputAction.done : TextInputAction.next,
                        textAlign: TextAlign.center,
                        textFieldType: TextFieldType.PHONE,
                        textStyle: boldTextStyle(size: 24),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: radius(defaultRadius),
                            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: radius(defaultRadius),
                            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                          ),
                          counterText: '',
                          fillColor: appStore.isDarkModeOn ? cardDarkColor : editTextBgColor,
                          filled: true,
                        ),
                        validator: (no) {
                          if (no == null || no.isEmpty) {
                            return 'Enter';
                          }
                          return null;
                        },
                        onChanged: (c) {
                          if (c.isEmpty) {
                            if (index == 0) return;
                            nodes[index].unfocus();
                            nodes[index - 1].requestFocus();
                          } else {
                            nodes[index + 1].requestFocus();
                            controller[index].text = c;
                            setState(() {});
                          }
                        },
                      ).center(),
                    );
                  }),
                ).center(),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SetFingerPrintScreen()),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : Colors.black, borderRadius: BorderRadius.circular(45)),
                    child: Text('Continue', style: boldTextStyle(color: white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
