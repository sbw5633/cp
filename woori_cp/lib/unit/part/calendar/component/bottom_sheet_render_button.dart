import 'package:flutter/material.dart';

class RenderButton extends StatelessWidget {
  final VoidCallback saveBtnCallback;
  const RenderButton({
    super.key,
    required this.saveBtnCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("취소")),
        SizedBox(
          width: 18,
        ),
        ElevatedButton(onPressed: saveBtnCallback, child: Text("저장")),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
