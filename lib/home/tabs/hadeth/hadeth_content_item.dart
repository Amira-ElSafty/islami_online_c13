import 'package:flutter/material.dart';
import 'package:islami_online_c13/utils/app_colors.dart';

class HadethContentItem extends StatelessWidget {
  String content;

  HadethContentItem({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.primaryDark, fontSize: 20),
      ),
    );
  }
}
