import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class CountryLoading extends StatelessWidget {

  final bool inputTextLoading;

  const CountryLoading({required this.inputTextLoading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        inputTextLoading ? loadingInputCard() : Container(),
        loadingCard(),
        loadingCard(),
        loadingChartCard(),
      ],
    );
  }

  Widget loadingCard(){
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Shimmer.fromColors(
          baseColor:const Color(0xE2E2E2FF),
          highlightColor:const Color(0xF6F6F6FF),
          child: Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 20,
                color: Colors.white,
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                width: double.infinity,
                height: 15,
                color: Colors.white,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadingInputCard(){
    return Card(
      elevation: 1,
      child: Container(
        height: 105,
        padding:const EdgeInsets.all(24),
        child: Shimmer.fromColors(
          baseColor:const Color(0xE2E2E2FF),
          highlightColor:const Color(0xF6F6F6FF),
          child: Container(
            width: double.infinity,
            height: 57,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget loadingChartCard(){
    return Card(
      elevation: 1,
      child: Container(
        height: 180,
        padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Shimmer.fromColors(
          baseColor:const Color(0xE2E2E2FF),
          highlightColor:const Color(0xF6F6F6FF),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}