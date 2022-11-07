import 'package:flutter/material.dart';
import 'package:ukintensity_app/widgets/accordian.dart';
import 'package:ukintensity_app/widgets/drawer.dart';
import 'package:ukintensity_app/widgets/intensity/intensity_card.dart';
import 'package:ukintensity_app/widgets/regions/regions_details.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class CurrentByPostCodePage extends StatefulWidget {
  final String title;

  const CurrentByPostCodePage({super.key, required this.title});

  @override
  State<CurrentByPostCodePage> createState() => _CurrentByPostCodePageState();
}

class _CurrentByPostCodePageState extends State<CurrentByPostCodePage> {
  final _formKey = GlobalKey<FormState>();
  late String? postcode;
  late bool isValid = false;

  void changePostcode(String? outcode) {
    setState(() {
      try {
        postcode = outcode;
        isValid = true;
      } catch (e) {
        postcode = "LU7";
        isValid = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const DrawerWidget(),
        body: ListView(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              changePostcode(value); // even though false
                            }
                            changePostcode(value);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                        if (isValid)
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(children: <Widget>[
                                FutureBuilder<NationIntensity>(
                                  future: NationIntensityService.postcode(
                                      postcode!), // a previously-obtained Future<String> or null
                                  builder: (BuildContext context,
                                      AsyncSnapshot<NationIntensity> snapshot) {
                                    List<Widget> children;
                                    if (snapshot.hasData) {
                                      children = <Widget>[
                                        Accordion(
                                            title:
                                                "Selected ${snapshot.data!.data![0].shortname}",
                                            content: <Widget>[
                                              IntensityCard(
                                                snapshot: snapshot
                                                    .data!.data![0].data![0],
                                                showActual: false,
                                              ),
                                              RegionDetailsWidget(
                                                  region:
                                                      snapshot.data!.data![0]),
                                            ]),
                                      ];
                                    } else if (snapshot.hasError) {
                                      children = <Widget>[
                                        const Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                          size: 60,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          child:
                                              Text('Error: ${snapshot.error}'),
                                        ),
                                      ];
                                    } else {
                                      children = const <Widget>[
                                        SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: CircularProgressIndicator(),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 16),
                                          child: Text('Awaiting result...'),
                                        ),
                                      ];
                                    }
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: children,
                                      ),
                                    );
                                  },
                                )
                              ])),
                      ],
                    ),
                  )
                ])),
          ],
        ));
  }
}
