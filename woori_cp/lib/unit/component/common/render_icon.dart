import 'package:flutter/material.dart';
import 'package:woori_cp/const/setting_value.dart';

class RenderIcon extends StatelessWidget {
  final Widget child;
  final double size;
  const RenderIcon({
    super.key,
    required this.child,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(iconBoxSize_midium)),
      child: child,
    );
  }
}
