import 'package:ecco_app/screens/landing_screen.dart';
import 'package:ecco_app/screens/web_side/web_login.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.minWidth > 600) {
        return WebLogin();
      } else {
        return LandingScreen();
      }
    });
  }
}
