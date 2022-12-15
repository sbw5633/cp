import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:woori_cp/const/setting_value.dart';
import 'package:woori_cp/provider/calendar/calendar_time_provider.dart';
import 'package:woori_cp/util/common/date_util.dart';

class CustomTimeSelectField extends ConsumerStatefulWidget {
  final bool isStartTime;
  final DateTime selectTime;
  CustomTimeSelectField({
    super.key,
    required this.isStartTime,
    required this.selectTime,
  });

  @override
  ConsumerState<CustomTimeSelectField> createState() =>
      _CustomTimeSelectFieldState();
}

class _CustomTimeSelectFieldState extends ConsumerState<CustomTimeSelectField> {
  @override
  Widget build(BuildContext context) {
    final List<DateTime> state = ref.watch(timeChangeProvider);

    final String title = widget.isStartTime ? "시작 시간" : "종료 시간";
    final DateTime selectTime = widget.isStartTime ? state[0] : state[1];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: pointTS,
        ),
        renderTimeField(
            when: widget.isStartTime ? 0 : 1, selectTime: selectTime),
      ],
    );
  }

  Widget renderTimeField({required int when, required DateTime selectTime}) {
    return OutlinedButton(
        onPressed: () async {
          await showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    height: 300,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: selectTime,
                      use24hFormat: true,
                      onDateTimeChanged: (DateTime time) {
                        ref
                            .read(timeChangeProvider.notifier)
                            .setTime(when: when, time: time);
                      },
                    ),
                  ),
                );
              });
          setState(() {});
        },
        child: Text(DateUtil.formatTwoDigitTimeFromDateTime(selectTime)));
  }
}
