import 'package:flutter/material.dart';

import 'page.dart';
import 'screens/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'XO-Game',
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename:(context)=>HomeScreen(),
        page.routename:(context)=>page(),

      },
      initialRoute: page.routename,
      home: HomeScreen(),
    );
  }
}
