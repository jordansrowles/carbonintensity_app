import 'package:flutter/material.dart';
import 'package:ukintensity_integration/ukintensity_integration.dart';

class RegionDetailsWidget extends StatelessWidget {
  final NationIntensityRegion region;
  const RegionDetailsWidget({super.key, required this.region});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Wrap(spacing: 4, runSpacing: 4, children: <Widget>[
          Chip(
            label: Text("id: ${region.regionid.toString()}"),
          ),
          Chip(
            label: Text(region.shortname!),
          ),
          Chip(
            label: Text(region.dnoregion!),
          ),
          Chip(
            label: Text(region.postcode!),
          ),
        ]));
  }
}
