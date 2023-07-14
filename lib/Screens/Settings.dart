import 'package:flutter/material.dart';

class Settingss extends StatefulWidget {
  const Settingss({super.key});

  @override
  State<Settingss> createState() => _SettingssState();
}

class _SettingssState extends State<Settingss> {
  @override
  Widget build(BuildContext context) {
  return const Scaffold(
      body: Center(
          child: Text('Settings'), 
        ),
    );
  }
}