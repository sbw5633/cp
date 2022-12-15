import 'package:flutter/material.dart';
import 'package:woori_cp/unit/component/common/couple_icon.dart';

class HomeAppBarIsOpen extends StatelessWidget {
  const HomeAppBarIsOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("opened"), Text("Home"), Text("AppBar")]),
    );
  }
}

class HomeAppBarIsClose extends StatelessWidget {
  const HomeAppBarIsClose({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kToolbarHeight),
      child: CoupleIcon(),
    );
  }
}
