import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:woori_cp/const/color.dart';

import 'package:woori_cp/unit/part/calendar/calendar_bottom_index.dart';
import 'package:woori_cp/unit/part/calendar/speed_dial.dart';
import 'package:woori_cp/util/common/date_util.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now().toLocal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RenderSpeedDial(
        selectedDate: selectedDay,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              kBottomNavigationBarHeight,
          child: Column(children: [
            _CalendarWidget(
              onDaySelected: onDaySelected,
              focusedDay: focusedDay,
              selectedDay: selectedDay,
            ),
            Expanded(
              child: CalendarBottomIndex(
                date: DateUtil.formatDateToIntFromDateTime(selectedDay),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    //현지시간화
    selectedDay = selectedDay.toLocal().subtract(const Duration(hours: 9));

    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}

class _CalendarWidget extends StatelessWidget {
  _CalendarWidget({
    super.key,
    required this.focusedDay,
    required this.onDaySelected,
    this.selectedDay,
  });

  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected onDaySelected;

  DateTime firstDate = DateTime(1900, 1, 1);
  DateTime lastDate = DateTime(2100, 12, 31);

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
        // color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10));

    final defaultTextStyle = TextStyle(
      color: Colors.blueGrey[600],
      fontWeight: FontWeight.w700,
    );

    Color _textColor(DateTime day) {
      Color _defaultTextColor = PRIMARY_COLOR;

      if (day.weekday == DateTime.sunday) {
        return Colors.red;
      }
      if (day.weekday == DateTime.saturday) {
        return Colors.blue[600]!;
      }
      return _defaultTextColor;
    }

    Widget _calendarBuild(
        {required DateTime day,
        required bool isSelected,
        bool isWeek = false}) {
      return Stack(children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            isWeek
                ? DateUtil.formatDateFromNumber(day.weekday)
                : day.day.toString(),
            style: TextStyle(
                color: _textColor(day),
                fontWeight:
                    isWeek || isSelected ? FontWeight.w700 : FontWeight.normal),
          ),
        ),
        if (isSelected)
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
      ]);
    }

    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: firstDate,
      lastDay: lastDate,
      //캘린더의 header(상단 바) 스타일링
      headerStyle: HeaderStyle(
        formatButtonVisible: false, //2주 보기 전환 버튼 false
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return _calendarBuild(day: day, isSelected: false);
        },
        selectedBuilder: (context, day, focusedDay) {
          return _calendarBuild(day: day, isSelected: true);
        },
        dowBuilder: (context, day) {
          return _calendarBuild(day: day, isSelected: false, isWeek: true);
        },
      ),
      //캘린더스타일(내부)
      //평일과 주말, 선택된 날짜의 스타일링을 각각 해야한다.
      //평일: default~~ / 주말: weekend~~ / 선택된 날짜: selected~~
      //Tip. boxDecoration을 추가할 경우(borderRadius 등) 모든 스타일에 추가해야 에러가 나지않는다.
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
      ),
      onDaySelected: onDaySelected,
      //화면상의 모든 날짜를 변수(day)로 아래 함수를 실행함.(for in으로 생각하면됨)
      selectedDayPredicate: (day) {
        if (selectedDay == null)
          return false; //선택된 날이 없으면(최초) false반환, 아니면 선택된 날이 day인지 확인
        return day.year == selectedDay!.year &&
            day.month == selectedDay!.month &&
            day.day == selectedDay!.day;
      },
    );
  }
}
