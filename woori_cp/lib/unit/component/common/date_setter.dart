import 'package:flutter/material.dart';
import 'package:woori_cp/const/color.dart';
import 'package:woori_cp/util/common/date_util.dart';

class DateSetter extends StatefulWidget {
  final DateTime initDate;
  const DateSetter({
    super.key,
    required this.initDate,
  });

  @override
  State<DateSetter> createState() => _DateSetterState();
}

class _DateSetterState extends State<DateSetter> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final DateTime _initDate = selectedDate ?? widget.initDate;
    final DateTime _firstDate = DateTime(1900, 01, 01);
    final DateTime _lastDate = DateTime(2099, 12, 31);

    final _textStyle = TextStyle(
        color: PRIMARY_COLOR, fontWeight: FontWeight.w700, fontSize: 18);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: BACK_GROUND_COLOR, shape: StadiumBorder()),
      child: Text(
        DateUtil.formatDateToIntFromDateTime(_initDate),
        style: _textStyle,
      ),
      onPressed: () async {
        final setDate = await showDatePicker(
          context: context,
          initialDate: _initDate,
          firstDate: _firstDate,
          lastDate: _lastDate,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          helpText: "변경할 날짜를 선택해주세요.",
        );

        setState(() {
          selectedDate = setDate;
        });
      },
    );
  }
}
