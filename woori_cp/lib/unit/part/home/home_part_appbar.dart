import 'package:flutter/material.dart';
import 'package:woori_cp/unit/component/common/setting_manager.dart';

import 'package:woori_cp/unit/part/home/component/home_appbar_manager.dart';

class Part_AppBar extends StatelessWidget {
  final BuildContext context;
  final bool isExpanded;
  const Part_AppBar({
    super.key,
    required this.context,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      collapsedHeight: kToolbarHeight,
      pinned: true,
      centerTitle: true,
      stretch: true,
      title: isExpanded ? null : HomeAppBarIsClose(),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Opacity(
          opacity: 0.7,
          child: Image.asset(
            'asset/image/sampleAppBarBG.jpeg',
            fit: BoxFit.cover,
            color: Colors.white,
            colorBlendMode: BlendMode.color,
          ),
        ),
        title: isExpanded ? HomeAppBarIsOpen() : null,
      ),
      actions: [SettingManager()],
    );
  }
}
