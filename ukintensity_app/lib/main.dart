import 'package:carbon_intensity_uk/pages/national_intensity_page.dart';
import 'package:carbon_intensity_uk/widgets/nav_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

late NationalIntensity data;

void main() async {
  NationalIntensityService service = NationalIntensityService();
  data = await service.getToday();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UK Carbon Intensity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NationalIntensityPage(
        intensity: data,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("About the Carbon Intensity API", style: Theme.of(context).textTheme.headline4,),
            Text("National Grid ESO's Carbon Intensity API provides an indicative trend of regional carbon intensity of the electricity system in Great Britain (GB) 96+ hours ahead of real-time. It provides programmatic and timely access to both forecast and estimated carbon intensity data."),
            /*const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),*/
          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
