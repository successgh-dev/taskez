import 'package:flutter/material.dart';
import 'package:taskez/widgets/Shapes/settings_strip.dart';

class AppSettingsIcon extends StatelessWidget {
  VoidCallback? callback;
  AppSettingsIcon({Key? key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SettingsStrip(),
      SizedBox(height: 2),
      RotatedBox(quarterTurns: 2, child: SettingsStrip())
    ]);
  }
}