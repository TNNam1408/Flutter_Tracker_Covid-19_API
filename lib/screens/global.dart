import 'package:flutter/material.dart';
import '../services/covid_service.dart';
import '../models/global_summary.dart';
import '../screens/global_statistics.dart';
import 'global_loading.dart';
CovidService covidService = CovidService();

class Global extends StatefulWidget {
  const Global({Key? key}) : super(key: key);

  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  late Future<GlobalSummaryModel> summary;
  @override
  void initState() {
    super.initState();
    summary = covidService.getGlobalSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Global Corona Virus Cases",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    summary = covidService.getGlobalSummary();
                  });
                },
                child: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: summary,
          builder: (BuildContext context,AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const GlobalLoading();
              default:
                return !snapshot.hasData
                    ? const Center(
                        child: Text("Empty"),
                      )
                    : GlobalStatistics(
                        summary: snapshot.data,
                      );
            }
          },
        ),
      ],
    );
  }
}
