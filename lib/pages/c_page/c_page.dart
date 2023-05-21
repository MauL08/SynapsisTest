import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_test/core/global_state.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/c_page/c_state.dart';
import 'package:synapsis_test/widget/graph_render_widget.dart';
import 'package:synapsis_test/widget/map_render_widget.dart';

class CPage extends StatefulWidget {
  const CPage({super.key});

  @override
  State<CPage> createState() => _CPageState();
}

class _CPageState extends State<CPage> {
  final CState state = Get.put(CState());
  final GlobalState globalState = Get.put(GlobalState());

  @override
  void initState() {
    super.initState();
    state.getSensorStatus();
    globalState.getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => state.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
              color: primaryColor,
            ))
          : SafeArea(
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
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: backgroundColor2,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GraphRenderWidget(
                                  data: state.chartDataA,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
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
                                  height: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'X :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${state.accelerometerStatusX.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Y :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${state.accelerometerStatusY.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Z :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${state.accelerometerStatusZ.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: backgroundColor2,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GraphRenderWidget(
                                  data: state.chartDataB,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
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
                                  height: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'X :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${state.gyroStatusX.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Y :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${state.gyroStatusY.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Z :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${state.gyroStatusZ.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: backgroundColor2,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GraphRenderWidget(
                                  data: state.chartDataC,
                                  color: Colors.lightBlue,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
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
                                  height: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'X :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${state.magnetometerStatusX.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Y :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${state.magnetometerStatusY.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Z :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${state.magnetometerStatusZ.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: backgroundColor2,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () => globalState.isMapLoading.value
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: secondaryColor,
                                          ),
                                        )
                                      : MapRenderWidget(
                                          latitude: globalState.latitude.value,
                                          longitude:
                                              globalState.longitude.value,
                                          height: 250,
                                        ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
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
                                  height: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Lat :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${globalState.latitude.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Long :',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '.' * 100,
                                            maxLines: 1,
                                            style: heading2Style.copyWith(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${globalState.longitude.value}',
                                          style: heading2Style.copyWith(
                                            color: secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
    ));
  }
}
