import 'package:flutter/material.dart';
import 'package:woori_cp/const/color.dart';
import 'package:woori_cp/const/menu_value.dart';

class TabIconModel {
  final Icon icon;
  final Icon activeIcon;
  final String title;

  TabIconModel({
    required this.icon,
    required this.activeIcon,
    required this.title,
  });

  factory TabIconModel.fromMenu(MenuCategory menu) {
    Icon tabIcon;
    Icon tabActiveIcon;
    String tabTitle;

    Icon setActiveIcon(IconData icon) {
      return Icon(
        icon,
        color: SELECT_TAB_COLOR,
        size: 28,
      );
    }

    switch (menu) {
      case MenuCategory.Calendar:
        tabActiveIcon = setActiveIcon(Icons.calendar_month_outlined);
        tabIcon = Icon(Icons.calendar_month_outlined);
        tabTitle = "Calendar";
        break;
      case MenuCategory.Album:
        tabActiveIcon = setActiveIcon(Icons.photo_album_outlined);
        tabIcon = Icon(Icons.photo_album_outlined);
        tabTitle = "Album";
        break;
      case MenuCategory.Home:
        tabActiveIcon = setActiveIcon(Icons.home);
        tabIcon = Icon(Icons.home);
        tabTitle = "Home";
        break;
      case MenuCategory.Diary:
        tabActiveIcon = setActiveIcon(Icons.menu_book_rounded);
        tabIcon = Icon(Icons.menu_book_rounded);
        tabTitle = "Diary";
        break;
      case MenuCategory.QA:
        tabActiveIcon = setActiveIcon(
          Icons.question_answer_rounded,
        );
        tabIcon = Icon(Icons.question_answer_rounded);
        tabTitle = "Question";
        break;
      default:
        throw "다시 선택해주세요.";
    }

    return TabIconModel(
      activeIcon: tabActiveIcon,
      icon: tabIcon,
      title: tabTitle,
    );
  }
}
