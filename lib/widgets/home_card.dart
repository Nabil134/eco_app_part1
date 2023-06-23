import 'package:ecco_app/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeCards extends StatelessWidget {
  final String? title;
  HomeCards({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            Colors.red.withOpacity(0.8),
            Colors.blue.withOpacity(0.8),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            title ?? 'TITLE',
            style: EcoStyle.boldStyle.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
