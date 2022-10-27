import 'package:carbon_intensity_uk/utils.dart';
import 'package:carbon_intensity_uk/widgets/genmix_chart_widget.dart';
import 'package:carbon_intensity_uk/widgets/genmix_table_widget.dart';
import 'package:carbon_intensity_uk/widgets/text_card_widget.dart';
import 'package:carbon_intensity_uk/widgets/intensity/national_intensity_widget.dart';
import 'package:carbon_intensity_uk/widgets/nav_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class GenMixPage extends StatefulWidget {
  final GenerationMix genmix;
  const GenMixPage({super.key, required this.genmix});

  @override
  State<GenMixPage> createState() => _GenMixPage();
}

class _GenMixPage extends State<GenMixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(title: const Text("National Generation Mix")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                TextCardWidget(heading: "What does Generation Mix mean?",
                    text: "‘The energy mix is a group of different primary energy sources from which secondary energy for direct use - such as electricity - is produced. Energy mix refers to all direct uses of energy, such as transportation and housing, and should not be confused with power generation mix, which refers only to generation of electricity.’ - Wikipedia"
                ),
                GenMixChartWidget(items: widget.genmix.data!.generationmix),
                GenMixTableWidget(items: widget.genmix.data!.generationmix)
              ],
            ),
          ),
        )
      )
    );
  }
}