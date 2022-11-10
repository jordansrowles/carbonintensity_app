import 'package:flutter/material.dart';
import 'package:ukintensity_app/utils/utils.dart';
import 'package:ukintensity_app/widgets/card_message.dart';
import 'package:ukintensity_app/widgets/drawer.dart';
import 'package:ukintensity_app/widgets/gen_mix/chart/gen_mix_chart.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class CurrentGenMixPage extends StatelessWidget {
  final String title;
  const CurrentGenMixPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
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
                                    GenMixSwitchChart(
                                      items:
                                          snapshot.data!.data!.generationmix!,
                                      title: "National Generation Mix",
                                      showExtendedOptions: false,
                                    ),
                                    /*
                                    GenMixSwitchChart(
                                      items:
                                          snapshot.data!.data!.generationmix!,
                                      title: "No extension test",
                                      showExtendedOptions: false,
                                    ),*/
                                    const CardMessage(
                                        heading: "What is Generation Mix?",
                                        text: whatIsGenMix)
                                  ],
                                ))
                              : const Center(
                                  // render the loading indicator
                                  child: CircularProgressIndicator(),
                                ))
                ]))));
  }
}
