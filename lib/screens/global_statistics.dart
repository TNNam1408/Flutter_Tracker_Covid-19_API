import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import '../utils/constans.dart';
import '../models/global_summary.dart';
import 'package:timeago/timeago.dart' as timeago;
class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel summary;
  const GlobalStatistics({Key? key, required this.summary}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard(
          "CONFIRMED",
          summary.totalConfirmed,
          summary.newConfirmed,
          kConfirmedColor,
        ),

        buildCard(
          "ACTIVE",
          summary.totalConfirmed - summary.totalRecovered - summary.totalDeaths,
          summary.newConfirmed - summary.newRecovered - summary.newDeaths,
          kActiveColor,
        ),

        buildCard(
          "RECOVERED(No data)",
          summary.totalRecovered,
          summary.newRecovered,
          kRecoveredColor,
        ),
        buildCard(
          "DEATHS",
          summary.totalDeaths,
          summary.newDeaths,
          kDeathColor,
        ),
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 4,vertical: 6),
          child: Text(
            "Statistics updated" + timeago.format(summary.date),
            style:const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),

          ),
        ),
      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color) {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      totalCount.toString().replaceAllMapped(reg,mathFunc),
                      style: TextStyle(
                        color: color,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      todayCount.toString().replaceAllMapped(reg,mathFunc),
                      style: TextStyle(
                        color: color,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
