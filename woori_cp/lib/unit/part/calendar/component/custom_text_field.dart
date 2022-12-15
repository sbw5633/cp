import 'package:flutter/material.dart';
import 'package:woori_cp/const/color.dart';
import 'package:woori_cp/const/setting_value.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final FormFieldSetter<String> onSaved;
  final String initialValue;
  final bool isDesc;
  const CustomTextField({
    super.key,
    required this.title,
    required this.onSaved,
    required this.initialValue,
    this.isDesc = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: pointTS,
        ),
        renderTextField(),
      ],
    );
  }

  Widget renderTextField() {
    return TextFormField(
      onSaved: onSaved,
      //null이 return되면 에러가 없다.
      //에러가 있으면 에러를 String값으로 리턴해준다.
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return 'please input value';
        }
        return null;
      },
      cursorColor: Colors.blueGrey,
      maxLines: isDesc ? 5 : 1,
      expands: false,
      initialValue: initialValue,
      keyboardType: TextInputType.multiline,
      // inputFormatters: isTime
      //     ? [
      //         FilteringTextInputFormatter.digitsOnly,
      //       ]
      //     : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}
