import 'package:flutter/material.dart';
import 'package:woori_cp/const/setting_value.dart';
import 'package:woori_cp/unit/component/common/date_setter.dart';
import 'package:woori_cp/unit/part/calendar/component/bottom_sheet_render_button.dart';
import 'package:woori_cp/unit/part/calendar/component/custom_text_field.dart';
import 'package:woori_cp/unit/part/calendar/component/schedule_member.dart';
import 'package:woori_cp/util/common/date_util.dart';

class D_DayBottomSheet extends StatelessWidget {
  final DateTime selectedDate;
  const D_DayBottomSheet({
    super.key,
    required this.selectedDate,
  });

  @override
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
                height: 16,
              ),
              //참가인원
              ScheduleMember(),
              const SizedBox(
                height: 16,
              ),
              //0일부터 시작 체크박스
              RenderZeroStartCheckBox(
                selectedDate: selectedDate,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                  title: "제목", onSaved: (String? val) {}, initialValue: ""),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                title: "내용",
                onSaved: (String? val) {},
                initialValue: "",
                isDesc: true,
              ),
              SizedBox(
                height: 16,
              ),
              RenderButton(
                saveBtnCallback: saveD_Day,
              ),
              //일정입력칸
              // RenderInputWriteBox(),
              // const SizedBox(
              //   height: 12,
              // ),

              // //저장, 취소 버튼
              // RenderButton(),
            ],
          ),
        ),
      ),
    );
  }

  void saveD_Day() {
    print("save D-Day");
  }
}

class RenderZeroStartCheckBox extends StatefulWidget {
  final DateTime selectedDate;
  RenderZeroStartCheckBox({
    super.key,
    required this.selectedDate,
  });

  @override
  State<RenderZeroStartCheckBox> createState() =>
      _RenderZeroStartCheckBoxState();
}

class _RenderZeroStartCheckBoxState extends State<RenderZeroStartCheckBox> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "0일부터 시작",
          style: pointTS,
        ),
        SizedBox(
          width: 18,
        ),
        InkWell(
          onTap: () {
            setState(() {
              check = !check;
            });
          },
          child: Container(
            decoration: (BoxDecoration(border: Border.all())),
            child: Icon(check ? Icons.check : null),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          "${DateUtil.formatYMDFromDateTime(widget.selectedDate)}이 ${check ? 0 : 1}일으로 계산됩니다.",
          style: TextStyle(fontSize: 10),
        )
      ],
    );
  }
}
