import 'package:carbon_intensity_uk/main.dart';
import 'package:carbon_intensity_uk/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "en", child: Text("English")),
      const DropdownMenuItem(value: "cy", child: Text("Welsh")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    //Locale currentLocale = Localizations.localeOf(context);
    var currentLocale = Intl.getCurrentLocale();// get the current locale
    if (currentLocale.contains("en")) {
      currentLocale = "en";
    }

    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(title: const Text("App Settings")),
        body: PageView(
          children: [
            Column(
              children: [
                DropdownButton(items: dropdownItems, onChanged: (String? newLocale) {
                  if (newLocale == "en") {
                      MyApp.of(context)!
                    }
                  },
                value: currentLocale,)
              ],
            )
          ],
        )
    );
  }

}
