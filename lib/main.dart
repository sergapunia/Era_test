import 'package:flutter/material.dart';
import "package:test_task_era/screens/screens.dart";

import 'screens/home_page/home_page.dart';
import 'screens/one_new_page/new_page.dart';

void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ForestVPN test',
      home: const HomePage(),
      routes: {
        "/news": (context) => const NewsPage(),
        "/newPage": (context) => const NewPage(),
      },
    );
  }
}
