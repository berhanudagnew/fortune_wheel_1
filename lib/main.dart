import 'package:flutter/material.dart';

import 'home_page_test.dart';
import 'test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF64138E),
      ),
      home: HomePage(),
      // home: MyHomePage(title: 'Path'),
    );
  }
}
