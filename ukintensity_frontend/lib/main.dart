import 'package:flutter/material.dart';
import 'package:ukintensity_app/pages/current/generation_mix.dart';
import 'package:ukintensity_app/pages/home.dart';
import 'package:ukintensity_app/widgets/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Carbon Intensity UK',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Carbon Intensity UK'));
    //CurrentGenMixPage(title: "Today's Generation Mix"));
  }
}
