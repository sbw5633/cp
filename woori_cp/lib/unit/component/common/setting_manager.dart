import 'package:flutter/material.dart';

class SettingManager extends StatelessWidget {
  const SettingManager({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: Text("Setting"),
                  content: SizedBox(
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("s"),
                        Text("e"),
                        Text("t"),
                        Text("t"),
                        Text("i"),
                        Text("n"),
                        Text("g"),
                      ],
                    ),
                  ),
                );
              }));
        },
        child: SizedBox(
            height: kToolbarHeight,
            width: kToolbarHeight,
            child: Icon(Icons.settings)));
  }
}
