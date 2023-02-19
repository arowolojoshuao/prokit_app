import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWStepperScreen4 extends StatefulWidget {
  static const tag = '/MWStepperScreen4';

  @override
  _MWStepperScreen4State createState() => _MWStepperScreen4State();
}

class _MWStepperScreen4State extends State<MWStepperScreen4> {
  int currStep = 1;

  @override
  Widget build(BuildContext context) {
    List<Step> mSteps = [
      Step(title: Text("Step 1"), content: Text("This is our Step 1 example.", style: secondaryTextStyle(color: appStore.textSecondaryColor)), isActive: currStep == 0, state: StepState.complete),
      Step(title: Text("Step 2"), content: Text("This is our Step 2 example.", style: secondaryTextStyle(color: appStore.textSecondaryColor)), isActive: currStep == 1, state: StepState.disabled),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Stepper'),
        body: CustomTheme(
          child: Stepper(
            steps: mSteps,
            type: StepperType.horizontal,
            currentStep: this.currStep,
            controlsBuilder: (BuildContext context, cd) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                    onPressed: cd.onStepContinue,
                    child: Text('CONTINUE', style: secondaryTextStyle()),
                  ),
                  10.width,
                  TextButton(
                    onPressed: cd.onStepCancel,
                    child: Text('CANCEL', style: secondaryTextStyle()),
                  ),
                ],
              ).paddingTop(16);
            },
            onStepContinue: () {
              setState(() {
                if (currStep < mSteps.length - 1) {
                  currStep = currStep + 1;
                } else {
                  //currStep = 0;
                  finish(context);
                }
              });
            },
            onStepCancel: () {
              finish(context);
              setState(() {
                if (currStep > 0) {
                  currStep = currStep - 1;
                } else {
                  currStep = 0;
                }
              });
            },
            onStepTapped: (step) {
              setState(() {
                currStep = step;
              });
            },
          ),
        ),
      ),
    );
  }
}
