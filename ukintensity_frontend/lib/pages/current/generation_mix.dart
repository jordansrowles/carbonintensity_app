import 'package:flutter/material.dart';
import 'package:ukintensity_app/widgets/drawer.dart';
import 'package:ukintensity_app/widgets/gen_mix/chart.dart';
import 'package:ukintensity_app/widgets/gen_mix/table.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class CurrentGenMixPage extends StatelessWidget {
  final String title;
  late List<GenerationMixItem>? items;

  CurrentGenMixPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.black12,
          centerTitle: true,
        ),
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  FutureBuilder<GenerationMix?>(
                      future: GenerationMixService.get(),
                      builder: (BuildContext ctx,
                              AsyncSnapshot<GenerationMix?> snapshot) =>
                          snapshot.hasData
                              ? Center(
                                  child: Column(
                                  children: [
                                    GenMixChart(
                                        items: snapshot
                                            .data!.data!.generationmix!),
                                    GenMixTable(
                                        items:
                                            snapshot.data!.data!.generationmix!)
                                  ],
                                ))
                              : const Center(
                                  // render the loading indicator
                                  child: CircularProgressIndicator(),
                                ))
                ]))));
  }
}
