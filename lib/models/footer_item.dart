import 'package:flutter/material.dart';

class FooterItem {
  final IconData iconPath;
  final String title;
  final String text1;
  // final String text2;
  final VoidCallback onTap;

  FooterItem({
    required this.iconPath,
    required this.title,
    required this.text1,
    // required this.text2,
    required this.onTap,
  });
}
