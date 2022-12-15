import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:woori_cp/const/color.dart';
import 'package:woori_cp/const/menu_value.dart';
import 'package:woori_cp/const/setting_value.dart';
import 'package:woori_cp/layout/nav_drawer.dart';
import 'package:woori_cp/model/common/tab_icon_model.dart';
import 'package:woori_cp/screen/album_screen.dart';
import 'package:woori_cp/screen/calendar_screen.dart';
import 'package:woori_cp/screen/diary_screen.dart';
import 'package:woori_cp/screen/home_screen.dart';
import 'package:woori_cp/screen/qa_screen.dart';
import 'package:woori_cp/unit/part/home/home_part_appbar.dart';

class PageViewScreen extends StatefulWidget {
  PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen>
    with SingleTickerProviderStateMixin {
  late TabController pageController;

  bool isExpanded = true;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    pageController =
        TabController(initialIndex: 2, length: isScreen.length, vsync: this);
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  scrollListener() {
    bool isExpanded = scrollController.offset <
        MediaQuery.of(context).size.height * 0.5 - (kToolbarHeight + 50);

    if (isExpanded != this.isExpanded) {
      setState(() {
        this.isExpanded = isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(),
          // endDrawer: NavDrawer(),
          bottomNavigationBar: ConvexAppBar(
            initialActiveIndex: 2,
            backgroundColor: PRIMARY_COLOR,
            style: TabStyle.fixed,
            activeColor: Colors.amber,
            items: MenuCategory.values.map((e) {
              TabIconModel thisTab = TabIconModel.fromMenu(e);

              return TabItem(
                activeIcon: thisTab.activeIcon,
                icon: thisTab.icon,
                title: thisTab.title,
              );
            }).toList(),
            onTap: ((index) {
              pageController.animateTo(index,
                  duration: pageAnimationTime, curve: Curves.easeOut);
            }),
          ),
          body: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: Part_AppBar(
                    isExpanded: isExpanded,
                    context: context,
                  ),
                )
              ];
            },
            body: TabBarView(
              controller: pageController,
              children: isScreen
                  .map((e) => Padding(
                        padding: EdgeInsets.only(top: kToolbarHeight),
                        child: e,
                      ))
                  .toList(),
            ),

            // 밑에 list없어도 appbar 올라가게 하기
            // SafeArea(
            //   child: Builder(builder: (context) {
            //     return CustomScrollView(slivers: [
            //       SliverOverlapInjector(
            //           handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
            //               context)),
            //       SliverToBoxAdapter(
            //         child: SizedBox(height: 16),
            //       ),
            //       SliverList(delegate: SliverChildDelegate(

            //       ))
            //     ]);
            //   }),
            // ),
          )),
    );
  }
}
