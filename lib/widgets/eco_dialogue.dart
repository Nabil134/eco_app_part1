import 'package:ecco_app/widgets/eco_button.dart';
import 'package:flutter/material.dart';

class EcoDialogue extends StatelessWidget {
  EcoDialogue({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      actions: [
        EcoButton(
          title: 'CLOSE',
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
