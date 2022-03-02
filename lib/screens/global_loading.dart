import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GlobalLoading extends StatelessWidget {
  const GlobalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loadingCard(),
        loadingCard(),
        loadingCard(),
        loadingCard(),
        loadingLabel(),
      ],
    );
  }

  Widget loadingCard() {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Shimmer.fromColors(
          baseColor: const Color(0xE0E0E0FF),
          highlightColor: const Color(0xF5F5F5FF),
          child: Column(
            children: [
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

  Widget loadingLabel() {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 8),
      child: Shimmer.fromColors(
        baseColor:const Color(0xFF53B2FF),
        highlightColor:const  Color(0xFF008EFC),
        child: Column(
          children: [
            Container(
              width: 200,
              height: 16,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
