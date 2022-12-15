import 'package:flutter/material.dart';
import 'package:woori_cp/const/setting_value.dart';

class MenuBox extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const MenuBox({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: iconBoxSize_midium,
        width: iconBoxSize_midium,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(12)),
        child: Text(title),
      ),
    );
  }
}
