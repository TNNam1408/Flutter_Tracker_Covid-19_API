import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xFF166DE0);
Color kConfirmedColor = const Color(0xFFFF1242);
Color kActiveColor = const Color(0xFF017BFF);
Color kRecoveredColor = const Color(0xFF29A746);
Color kDeathColor = const Color(0xFF6D757D);

LinearGradient kGradientShimmer = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFB8B8B8),
    Color(0xFFE5E5E5),
  ],
);

RegExp reg =new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
var mathFunc = (Match match) => '${match[1]}.';