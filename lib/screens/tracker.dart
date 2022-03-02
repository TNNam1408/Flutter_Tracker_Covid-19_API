import 'package:covid_tracker_api/screens/county.dart';
import 'package:covid_tracker_api/screens/global.dart';
import 'package:covid_tracker_api/screens/vietnam.dart';
import 'package:flutter/material.dart';
import '../utils/constans.dart';
import 'navigation_option.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
  /*VIETNAM*/
}

class Tracker extends StatefulWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBAL;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Text('COVID-19 Track Live Data'
            ''),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(
                  milliseconds: 230,
                ),
                child: navigationStatus == NavigationStatus.GLOBAL ? const Global():const Country(),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationOption(
                  title: "Global",
                  seleted: navigationStatus == NavigationStatus.GLOBAL,
                  onSelected: (){
                    setState(() {
                      navigationStatus = NavigationStatus.GLOBAL;
                    });
                  },
                ),

                NavigationOption(
                  title: "Country",
                  seleted: navigationStatus == NavigationStatus.COUNTRY,
                  onSelected: (){
                    setState(() {
                      navigationStatus = NavigationStatus.COUNTRY;
                    });
                  },
                ),
/*                NavigationOption(
                  title: "VietNam",
                  seleted: navigationStatus == NavigationStatus.VIETNAM,
                  onSelected: (){
                    setState(() {
                      navigationStatus = NavigationStatus.VIETNAM;
                    });
                  },
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
