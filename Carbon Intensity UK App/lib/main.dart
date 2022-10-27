import 'package:carbon_intensity_uk/pages/gen_mix.dart';
import 'package:carbon_intensity_uk/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

late GenerationMix data;
void main() async {
  GenerationMixService service = GenerationMixService();
  data = await service.get();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Intensity UK',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', ''), Locale('cy', '')],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //darkTheme: ThemeData(brightness: Brightness.dark),
      home: GenMixPage(
        genMix: data,
      ),
    );
  }
}
