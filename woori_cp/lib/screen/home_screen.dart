import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _test(String cate) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(10),
      color: Colors.amber,
      child: Center(child: Text(cate)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("is Home"),
    );
  }
}
