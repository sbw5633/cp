import 'package:flutter/material.dart';
import 'package:woori_cp/const/menu_value.dart';
import 'package:woori_cp/screen/album_screen.dart';
import 'package:woori_cp/screen/calendar_screen.dart';
import 'package:woori_cp/screen/diary_screen.dart';
import 'package:woori_cp/screen/qa_screen.dart';
import 'package:woori_cp/unit/component/common/toast_message.dart';
import 'package:woori_cp/unit/part/home/component/menu_box.dart';

class Part_Menu extends StatelessWidget {
  final BuildContext context;
  Part_Menu({super.key, required this.context});

  List<String> cates = ["캘린더", "다이어리", "사진첩", "질문지"];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        sliver: SliverToBoxAdapter()

        // SliverGrid(
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) => MenuBox(
        //         title: cates[index],
        //         onTap: () => onTapMenuButton(
        //             formatToCategoryFromString(cates[index]), context)),
        //     childCount: cates.length,
        //   ),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     mainAxisSpacing: 16,
        //     crossAxisSpacing: 16,
        //   ),
        // ),
        );

    // return GridView.builder(
    //     itemCount: cates.length,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
    //     padding: EdgeInsets.all(8),
    //     itemBuilder: ((context, index) => MenuBox(
    //           title: cates[index],
    //           onTap: () => onTapMenuButton(
    //               formatToCategoryFromString(cates[index]), context),
    //         )));
  }

  // void onTapMenuButton(MenuCategory menu, BuildContext context) {
  //   print("tapped $menu");

  //   dynamic selectMenu;

  //   try {
  //     switch (menu) {
  //       case MenuCategory.Calendar:
  //         selectMenu = CalendarScreen();
  //         break;
  //       case MenuCategory.Album:
  //         selectMenu = AlbumScreen();
  //         break;
  //       case MenuCategory.Diary:
  //         selectMenu = DiaryScreen();
  //         break;
  //       case MenuCategory.QA:
  //         selectMenu = QAScreen();
  //         break;
  //       default:
  //         throw "다시 선택해주세요.";
  //     }
  //     Navigator.of(context).push(MaterialPageRoute(builder: (_) => selectMenu));
  //   } catch (e) {
  //     print("e::$e");
  //     toastMessage(e.toString());
  //   }
  // }
}
