import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/c_page/c_state.dart';
import 'package:latlong2/latlong.dart' as latlng;

class CPage extends StatefulWidget {
  const CPage({super.key});

  @override
  State<CPage> createState() => _CPageState();
}

class _CPageState extends State<CPage> {
  final CState state = Get.put(CState());

  @override
  void initState() {
    super.initState();
    state.getSensorStatus();
    state.getPosition();
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
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  height: 400,
                                  width: double.infinity,
                                  child: BarChart(
                                    BarChartData(
                                      alignment: BarChartAlignment.center,
                                      maxY: 100,
                                      minY: -100,
                                      groupsSpace: 15,
                                      barTouchData: BarTouchData(enabled: true),
                                      titlesData: FlTitlesData(
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            getTitlesWidget: (value, meta) {
                                              String text = '';
                                              switch (value.toInt()) {
                                                case 1:
                                                  text = 'X';
                                                  break;
                                                case 2:
                                                  text = 'Y';
                                                  break;
                                                case 3:
                                                  text = 'Z';
                                                  break;
                                              }
                                              return Container(
                                                margin: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(text),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      gridData: FlGridData(
                                        getDrawingHorizontalLine: (value) {
                                          return FlLine(
                                            color: const Color(0xff363753),
                                            strokeWidth: 1,
                                          );
                                        },
                                      ),
                                      barGroups: state.chartDataA
                                          .map(
                                            (data) => BarChartGroupData(
                                              x: data.id,
                                              barRods: [
                                                BarChartRodData(
                                                  toY: data.y,
                                                  width: 50,
                                                  color: Colors.green,
                                                  borderRadius: data.y > 0
                                                      ? const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  6),
                                                          topRight:
                                                              Radius.circular(
                                                                  6),
                                                        )
                                                      : const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  6),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  6),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
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
                          SizedBox(height: 12),
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
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  height: 400,
                                  width: double.infinity,
                                  child: BarChart(
                                    BarChartData(
                                      alignment: BarChartAlignment.center,
                                      maxY: 100,
                                      minY: -100,
                                      groupsSpace: 15,
                                      barTouchData: BarTouchData(enabled: true),
                                      titlesData: FlTitlesData(
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            getTitlesWidget: (value, meta) {
                                              String text = '';
                                              switch (value.toInt()) {
                                                case 1:
                                                  text = 'X';
                                                  break;
                                                case 2:
                                                  text = 'Y';
                                                  break;
                                                case 3:
                                                  text = 'Z';
                                                  break;
                                              }
                                              return Container(
                                                margin: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(text),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      gridData: FlGridData(
                                        getDrawingHorizontalLine: (value) {
                                          return FlLine(
                                            color: const Color(0xff363753),
                                            strokeWidth: 1,
                                          );
                                        },
                                      ),
                                      barGroups: state.chartDataB
                                          .map(
                                            (data) => BarChartGroupData(
                                              x: data.id,
                                              barRods: [
                                                BarChartRodData(
                                                  toY: data.y,
                                                  width: 50,
                                                  color: Colors.red,
                                                  borderRadius: data.y > 0
                                                      ? const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  6),
                                                          topRight:
                                                              Radius.circular(
                                                                  6),
                                                        )
                                                      : const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  6),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  6),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
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
                          SizedBox(height: 12),
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
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  height: 400,
                                  width: double.infinity,
                                  child: BarChart(
                                    BarChartData(
                                      alignment: BarChartAlignment.center,
                                      maxY: 100,
                                      minY: -100,
                                      groupsSpace: 15,
                                      barTouchData: BarTouchData(enabled: true),
                                      titlesData: FlTitlesData(
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            getTitlesWidget: (value, meta) {
                                              String text = '';
                                              switch (value.toInt()) {
                                                case 1:
                                                  text = 'X';
                                                  break;
                                                case 2:
                                                  text = 'Y';
                                                  break;
                                                case 3:
                                                  text = 'Z';
                                                  break;
                                              }
                                              return Container(
                                                margin: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(text),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      gridData: FlGridData(
                                        getDrawingHorizontalLine: (value) {
                                          return FlLine(
                                            color: const Color(0xff363753),
                                            strokeWidth: 1,
                                          );
                                        },
                                      ),
                                      barGroups: state.chartDataC
                                          .map(
                                            (data) => BarChartGroupData(
                                              x: data.id,
                                              barRods: [
                                                BarChartRodData(
                                                  toY: data.y,
                                                  width: 50,
                                                  color: Colors.lightBlue,
                                                  borderRadius: data.y > 0
                                                      ? const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  6),
                                                          topRight:
                                                              Radius.circular(
                                                                  6),
                                                        )
                                                      : const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  6),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  6),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
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
                          SizedBox(height: 12),
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
                                SizedBox(
                                  height: 250,
                                  child: FlutterMap(
                                    mapController: MapController(),
                                    options: MapOptions(
                                      center: latlng.LatLng(
                                        state.latitude.value,
                                        state.longitude.value,
                                      ),
                                      zoom: 13.0,
                                    ),
                                    children: [
                                      TileLayer(
                                        urlTemplate:
                                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        subdomains: const ['a', 'b', 'c'],
                                      ),
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                              point: latlng.LatLng(
                                                state.latitude.value,
                                                state.longitude.value,
                                              ),
                                              builder: (context) {
                                                return const Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                );
                                              })
                                        ],
                                      )
                                    ],
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
                                          '${state.latitude.value}',
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
                                          '${state.longitude.value}',
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
