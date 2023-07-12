import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

List<Color> gradientColors = [primary, secondary];
LineChartData activityData() {
  return LineChartData(
    gridData: const FlGridData(
      show: false,
      drawVerticalLine: true,
    ),
    titlesData: const FlTitlesData(
      show: false,
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          const FlSpot(0, 3),
          const FlSpot(2.6, 2.5),
          const FlSpot(4.9, 4),
          const FlSpot(6.7, 3.5),
          const FlSpot(8, 4.5),
          const FlSpot(9.5, 3),
          const FlSpot(11, 5),
        ],
        isCurved: true,
        color: primary,
        // colors: gradientColors,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
            show: true, gradient: LinearGradient(colors: gradientColors)
            // colors:
            //     gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            ),
      ),
    ],
  );
}
