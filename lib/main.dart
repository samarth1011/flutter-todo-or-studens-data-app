import 'package:flutter/material.dart';
import 'package:net_ninja_quotes/add_student.dart';

import 'QuoteList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => QuoteList(),
        '/addStudent': (context) => AddStudent(),
      },
    );
  }
}
