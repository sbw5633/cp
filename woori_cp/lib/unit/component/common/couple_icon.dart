import 'package:flutter/material.dart';
import 'package:woori_cp/const/setting_value.dart';
import 'package:woori_cp/unit/component/common/render_icon.dart';

class CoupleIcon extends StatelessWidget {
  const CoupleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RenderIcon(
          child: Text("Me"),
          size: iconBoxSize_midium,
        ),
        RenderIcon(
          child: Icon(Icons.local_activity),
          size: iconBoxSize_midium,
        ),
        RenderIcon(
          child: Text("you"),
          size: iconBoxSize_midium,
        ),
      ],
    );
  }
}
