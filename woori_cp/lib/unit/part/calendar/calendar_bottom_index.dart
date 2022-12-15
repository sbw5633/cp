import 'package:flutter/material.dart';
import 'package:woori_cp/const/color.dart';

class CalendarBottomIndex extends StatelessWidget {
  final String date;
  const CalendarBottomIndex({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 35,
            decoration: BoxDecoration(color: POINT_COLOR),
            child: Text(
              date,
              style: _textStyle,
            ),
          ),
          Expanded(
            child: Container(
              color: BG_COLOR,
              child: ListView(
                children: [Text("aa")],
              ),
            ),
          )
        ],
      ),
    );
  }
}
