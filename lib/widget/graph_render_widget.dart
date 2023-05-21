import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:synapsis_test/core/theme.dart';

class GraphRenderWidget extends StatelessWidget {
  const GraphRenderWidget({Key? key, required this.data, required this.color})
      : super(key: key);

  final List data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
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
                    margin: const EdgeInsets.only(top: 8),
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
          barGroups: data
              .map(
                (data) => BarChartGroupData(
                  x: data.id,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      width: 50,
                      color: color,
                      borderRadius: data.y > 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                            )
                          : const BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
