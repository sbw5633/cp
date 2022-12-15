import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:woori_cp/provider/calendar/calendar_time_provider.dart';
import 'package:woori_cp/provider/calendar/schedule_member_provider.dart';
import 'package:woori_cp/unit/part/calendar/d_day_bottom_sheet.dart';
import 'package:woori_cp/unit/part/calendar/schedule_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RenderSpeedDial extends ConsumerWidget {
  final DateTime selectedDate;
  const RenderSpeedDial({
    super.key,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      visible: true,
      curve: Curves.bounceIn,
      backgroundColor: Colors.indigo.shade900,
      children: [
        SpeedDialChild(
          child: Icon(Icons.calendar_today_outlined),
          label: "Add Calendar",
          onTap: () {
            //참가자 선택상태 초기화
            ref
                .read(scheduleParticipationManagerProvider.notifier)
                .initSetting();
            //시간 선택상태 초기화
            ref.read(timeChangeProvider.notifier).initSetting();

            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) {
                  return ScheculeBottomSheet(selectedDate: selectedDate);
                });
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.timer_outlined),
          label: "Add D-day",
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) {
                  return D_DayBottomSheet(selectedDate: selectedDate);
                });
          },
        )
      ],
    );
  }
}
