import 'package:flutter/material.dart';
import 'package:woori_cp/screen/album_screen.dart';
import 'package:woori_cp/screen/calendar_screen.dart';
import 'package:woori_cp/screen/diary_screen.dart';
import 'package:woori_cp/screen/home_screen.dart';
import 'package:woori_cp/screen/qa_screen.dart';

enum MenuCategory {
  Calendar,
  Diary,
  Home,
  QA,
  Album,
}

List<Widget> isScreen = [
  CalendarScreen(),
  DiaryScreen(),
  HomeScreen(),
  QAScreen(),
  AlbumScreen(),
];

MenuCategory formatToCategoryFromString(String cate) {
  switch (cate) {
    case "캘린더":
      return MenuCategory.Calendar;
    case "사진첩":
      return MenuCategory.Album;
    case "홈":
      return MenuCategory.Home;
    case "질문지":
      return MenuCategory.QA;
    case "다이어리":
      return MenuCategory.Diary;
    default:
      return MenuCategory.Home;
  }
}
