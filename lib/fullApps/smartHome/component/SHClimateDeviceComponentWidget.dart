import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SHClimateDeviceComponentWidget extends StatefulWidget {
  final SHDeviceModel? data;

  SHClimateDeviceComponentWidget({this.data});

  @override
  _SHClimateDeviceComponentWidgetState createState() => _SHClimateDeviceComponentWidgetState();
}

class _SHClimateDeviceComponentWidgetState extends State<SHClimateDeviceComponentWidget> {
  double progressValue = 20;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                height: 150,
                width: context.width(),
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 5,
                      maximum: 40,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 180,
                      endAngle: 0,
                      radiusFactor: 0.9,
                      canScaleToFit: true,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.2,
                        // color: const Color.fromARGB(30, 0, 169, 181),
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                        gradient: SweepGradient(
                          colors: [Colors.blue, Colors.purple, Colors.pink, Colors.red],
                        ),
                      ),
                      pointers: <GaugePointer>[
                        MarkerPointer(
                          value: progressValue,
                          markerType: MarkerType.invertedTriangle,
                          markerHeight: 50,
                          enableDragging: true,
                          enableAnimation: true,
                          onValueChanged: (double value) {
                            log(value);
                            setState(
                              () {
                                progressValue = value;
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: context.height() * 0.28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: SHScaffoldDarkColor,
                    ),
                    //child: Text('17c',style: boldTextStyle(color: white),),
                  ),
                  Column(
                    children: [
                      Text(
                        progressValue.toStringAsFixed(0),
                        style: primaryTextStyle(size: 46, color: white),
                      ),
                      Text('C', style: primaryTextStyle(color: grey)),
                    ],
                  )
                ],
              ),
              16.height,
              Text(
                'Adjust the control to find the best \n     temperature for your need.',
                style: primaryTextStyle(color: Colors.grey),
              ),
            ],
          ).center(),
          AppButton(
            color: SHScaffoldDarkColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.power_settings_new, color: Colors.red),
                8.width,
                Text("Turn Off", style: primaryTextStyle(color: Colors.red)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
