import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/a_page/a_state.dart';

class APage extends StatefulWidget {
  const APage({super.key});

  @override
  State<APage> createState() => _APageState();
}

class _APageState extends State<APage> {
  final AState state = Get.put(AState());

  @override
  void initState() {
    super.initState();
    state.getPosition();
    state.getCurrentBattery();
    state.getSensorStatus();
    state.getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Stream.periodic(
          const Duration(seconds: 1),
        ),
        builder: ((context, snapshot) {
          return Padding(
            padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        DateTime.now().toString().split(' ')[1].split('.')[0],
                        style: heading1Style.copyWith(
                          color: primaryColor,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(DateTime.now()),
                        style: heading1Style.copyWith(
                          color: primaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 235,
                              width: MediaQuery.of(context).size.width / 2.15,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: backgroundColor2,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.speed_rounded,
                                    color: secondaryColor,
                                    size: 32,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Accelerometer Sensor',
                                    style: heading1Style.copyWith(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '(${state.phoneInfo})',
                                    style: heading3Style.copyWith(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'X: ${state.accelerometerStatusX}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Y: ${state.accelerometerStatusY}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Z: ${state.accelerometerStatusZ}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 235,
                              width: MediaQuery.of(context).size.width / 2.15,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: backgroundColor2,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.screen_rotation_rounded,
                                    color: secondaryColor,
                                    size: 32,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Gyroscope Sensor',
                                    style: heading1Style.copyWith(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '(${state.phoneInfo})',
                                    style: heading3Style.copyWith(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'X: ${state.magnetometerStatusX}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Y: ${state.magnetometerStatusY}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Z: ${state.magnetometerStatusZ}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 235,
                              width: MediaQuery.of(context).size.width / 2.15,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: backgroundColor2,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.switch_right_rounded,
                                    color: secondaryColor,
                                    size: 32,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Magnetometer Sensor',
                                    style: heading1Style.copyWith(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '(${state.phoneInfo})',
                                    style: heading3Style.copyWith(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'X: ${state.gyroStatusX}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Y: ${state.gyroStatusY}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Z: ${state.gyroStatusZ}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 235,
                              width: MediaQuery.of(context).size.width / 2.15,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: backgroundColor2,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: secondaryColor,
                                    size: 32,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'GPS Coordinate',
                                    style: heading1Style.copyWith(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '(${state.phoneInfo})',
                                    style: heading3Style.copyWith(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lat: ${state.latitude}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Long: ${state.longitude}',
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Battery Level :',
                              style: heading1Style.copyWith(
                                color: primaryColor,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              children: [
                                state.getCurrentBatteryIcon(),
                                Text(
                                  '${state.currentBattery}%',
                                  style: heading1Style.copyWith(
                                    color: backgroundColor,
                                    fontSize: 24,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
