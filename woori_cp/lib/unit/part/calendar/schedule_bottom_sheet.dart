import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:woori_cp/provider/calendar/calendar_time_provider.dart';
import 'package:woori_cp/unit/part/calendar/component/bottom_sheet_render_button.dart';
import 'package:woori_cp/unit/part/calendar/component/custom_text_field.dart';
import 'package:woori_cp/unit/component/common/date_setter.dart';
import 'package:woori_cp/unit/part/calendar/component/custom_time_select.dart';
import 'package:woori_cp/unit/part/calendar/component/schedule_member.dart';

class ScheculeBottomSheet extends StatelessWidget {
  DateTime selectedDate;
  final int? scheduleId;

  ScheculeBottomSheet({
    super.key,
    required this.selectedDate,
    this.scheduleId,
  });

  @override
  String writer = "writer";
  Widget build(BuildContext context) {
    final bottomInset =
        MediaQuery.of(context).viewInsets.bottom; //시스템ui로 인해 가려지는 screen의 높이

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7 + bottomInset,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              //날짜
              DateSetter(initDate: selectedDate),
              const SizedBox(
                height: 8,
              ),
              //참가인원
              ScheduleMember(),
              const SizedBox(
                height: 8,
              ),
              //시간
              RenderInputTimeBox(),
              const SizedBox(
                height: 12,
              ),
              //일정입력칸
              RenderInputWriteBox(),
              const SizedBox(
                height: 12,
              ),

              //저장, 취소 버튼
              RenderButton(
                saveBtnCallback: scheduleSave,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scheduleSave() {
    print("save Schedule");
  }
}

class RenderInputTimeBox extends ConsumerWidget {
  const RenderInputTimeBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DateTime> state = ref.watch(timeChangeProvider);

    print("dddd?");

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: CustomTimeSelectField(
            isStartTime: true,
            selectTime: state[0],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTimeSelectField(
            isStartTime: false,
            selectTime: state[1],
          ),
        ),
      ],
    );
  }
}

class RenderInputWriteBox extends StatelessWidget {
  const RenderInputWriteBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            title: "일정 이름", onSaved: (String? value) {}, initialValue: ''),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          title: "일정 내용",
          onSaved: (String? value) {},
          initialValue: '',
          isDesc: true,
        ),
      ],
    );
  }
}
