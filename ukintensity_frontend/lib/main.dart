import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ukintensity_app/pages/home.dart';
import 'package:ukintensity_app/utils/colours.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carbon Intensity UK',
        theme: ThemeData(
            primarySwatch: mySwatch,
            scaffoldBackgroundColor: mySwatch.shade50,
            drawerTheme: DrawerThemeData(backgroundColor: mySwatch.shade100)),
        home: const MyHomePage(title: 'Carbon Intensity UK'));
    //CurrentGenMixPage(title: "Today's Generation Mix"));
  }
}
