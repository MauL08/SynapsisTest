import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:synapsis_test/core/global_state.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/a_page/a_state.dart';

class APage extends StatefulWidget {
  const APage({super.key});

  @override
  State<APage> createState() => _APageState();
}

class _APageState extends State<APage> {
  final AState state = Get.put(AState());
  final GlobalState globalState = Get.put(GlobalState());

  @override
  void initState() {
    super.initState();
    globalState.getPosition();
    globalState.getSensorStatus();
    state.getCurrentBattery();
    state.getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: Stream.periodic(
            const Duration(seconds: 1),
          ),
          builder: ((context, snapshot) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                                          'X: ${globalState.accelerometerStatusX.value}',
                                          style: heading3Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Y: ${globalState.accelerometerStatusY.value}',
                                          style: heading3Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Z: ${globalState.accelerometerStatusZ.value}',
                                          style: heading3Style.copyWith(
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
                                          'X: ${globalState.gyroStatusX.value}',
                                          style: heading3Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Y: ${globalState.gyroStatusY.value}',
                                          style: heading3Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Z: ${globalState.gyroStatusZ.value}',
                                          style: heading3Style.copyWith(
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
                          const SizedBox(
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
                                          'X: ${globalState.magnetometerStatusX.value}',
                                          style: heading3Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Y: ${globalState.magnetometerStatusY.value}',
                                          style: heading3Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Z: ${globalState.magnetometerStatusZ.value}',
                                          style: heading3Style.copyWith(
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
                                      height: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Lat: ${globalState.latitude.value}',
                                          style: heading3Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Long: ${globalState.longitude.value}',
                                          style: heading3Style.copyWith(
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
                          const SizedBox(
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
                                    '${state.currentBattery.value}%',
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
      ),
    );
  }
}
