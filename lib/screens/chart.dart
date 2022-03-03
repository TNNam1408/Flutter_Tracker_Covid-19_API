import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/time_series_cases.dart';

class Chart extends StatelessWidget {
  const Chart(this.seriesList, {Key? key, required this.animate}) : super(key: key);
  final List<charts.Series<TimeSeriesCases, DateTime>> seriesList;
  final bool animate;
  @override
  Widget build(BuildContext context) {

    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      domainAxis: const charts.EndPointsTimeAxisSpec(),
    );

  }
}