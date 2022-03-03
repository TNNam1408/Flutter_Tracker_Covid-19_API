import 'package:covid_tracker_api/models/time_series_cases.dart';
import 'package:covid_tracker_api/screens/chart.dart';
import 'package:covid_tracker_api/utils/constans.dart';
import 'package:flutter/material.dart';
import '../models/country_summary.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CountryStatistics extends StatelessWidget {
  const CountryStatistics({Key? key, required this.summaryList}) : super(key: key);
  final List<CountrySummaryModel> summaryList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard(
          "CONFIRMED",
          summaryList[summaryList.length - 1].confirmed,
          kConfirmedColor,
          "ACTIVE",
          summaryList[summaryList.length - 1].active,
          kActiveColor,
        ),

        buildCard(
          "RECOVERED",
          summaryList[summaryList.length - 1].recovered,
          kRecoveredColor,
          "DEATH",
          summaryList[summaryList.length - 1].death,
          kDeathColor,
        ),
        buildCardChart(summaryList),
      ],
    );
  }
  Widget buildCard(String leftTitle, int leftValue, Color leftColor, String rightTitle, int rightValue, Color rightColor){
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding:const  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(
                  leftTitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                Expanded(
                  child: Container(),
                ),

                Text(
                  "Total",
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                Text(
                  leftValue.toString().replaceAllMapped(reg, mathFunc),
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[

                Text(
                  rightTitle,
                  style:const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                Expanded(
                  child: Container(),
                ),

                Text(
                  "Total",
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                Text(
                  rightValue.toString().replaceAllMapped(reg, mathFunc),
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget buildCardChart(List<CountrySummaryModel> summaryList){
    return Card(
      elevation: 1,
      child: Container(
        height: 190,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Chart(
          _createData(summaryList),
          animate: false,
        ),
      ),
    );
  }
  static List<charts.Series<TimeSeriesCases, DateTime>> _createData(List<CountrySummaryModel> summaryList) {

    List<TimeSeriesCases> confirmedData = [];
    List<TimeSeriesCases> activeData = [];
    List<TimeSeriesCases> recoveredData = [];
    List<TimeSeriesCases> deathData = [];

    for (var item in summaryList) {
      confirmedData.add(TimeSeriesCases(item.date, item.confirmed));
      activeData.add(TimeSeriesCases(item.date, item.active));
      recoveredData.add(TimeSeriesCases(item.date, item.recovered));
      deathData.add(TimeSeriesCases(item.date, item.death));
    }

    return [
      charts.Series<TimeSeriesCases, DateTime>(
        id: 'Confirmed',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kConfirmedColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: confirmedData,
      ),
      charts.Series<TimeSeriesCases, DateTime>(
        id: 'Active',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kActiveColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: activeData,
      ),
      charts.Series<TimeSeriesCases, DateTime>(
        id: 'Recovered',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kRecoveredColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: recoveredData,
      ),
      charts.Series<TimeSeriesCases, DateTime>(
        id: 'Death',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kDeathColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: deathData,
      ),

    ];
  }
}
