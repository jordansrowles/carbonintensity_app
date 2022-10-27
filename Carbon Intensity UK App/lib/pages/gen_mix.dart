import 'package:carbon_intensity_uk/widgets/card_message.dart';
import 'package:carbon_intensity_uk/widgets/drawer.dart';
import 'package:carbon_intensity_uk/widgets/gen_mix/chart.dart';
import 'package:carbon_intensity_uk/widgets/gen_mix/table.dart';
import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenMixPage extends StatelessWidget {
  final GenerationMix genMix;

  const GenMixPage({super.key, required this.genMix});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(title: const Text("National Generation Mix")),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Column(children: <Widget>[
          CardMessage(
              heading: AppLocalizations.of(context)!.genMixAboutMessage,
              text: "test"),
          GenMixChart(items: genMix.data!.generationmix!),
          GenMixTable(items: genMix.data!.generationmix!)
        ])))));
  }
}
