import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonStatsChart extends StatefulWidget {
  final List<Stats> stats;
  const PokemonStatsChart({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  State<PokemonStatsChart> createState() => _PokemonStatsChartState();
}

class _PokemonStatsChartState extends State<PokemonStatsChart> {
  List<BarChartGroupData> groupList = [];
  Map<int, String> xData = {};
  Map<int, int> yData = {};

  void _initData() {
    for (var i = 0; i < widget.stats.length; i++) {
      final name = widget.stats[i].stat!.name!;
      final value = widget.stats[i].baseStat;

      xData.addAll({i: name});
      yData.addAll({i: value!});

      groupList.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: value.toDouble(),
              color: Colors.blue,
              width: 12.0,
            ),
          ],
        ),
      );
    }
  }

  FlTitlesData titlesData() {
    return FlTitlesData(
      topTitles: AxisTitles(),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: ((value, meta) {
            String title = xData[value.toInt()]!;
            return Text(title.substring(0, 2));
          }),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  BarChartData barData(BoxConstraints constraints) {
    return BarChartData(
      alignment: BarChartAlignment.center,
      maxY: 200.0,
      groupsSpace: (constraints.maxWidth) * 0.8 / xData.length,
      barTouchData: BarTouchData(enabled: true),
      barGroups: groupList,
      titlesData: titlesData(),
      gridData: FlGridData(
        drawHorizontalLine: false,
        drawVerticalLine: false,
        show: false,
      ),
      borderData: FlBorderData(
        border: const Border(),
        show: false,
      ),
      baselineY: 150,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 180,
        width: 320,
        child: LayoutBuilder(
          builder: (_, constraints) => BarChart(
            barData(constraints),
          ),
        ),
      ),
    );
  }
}
