import 'package:flutter/material.dart';

class WebMainScreen extends StatelessWidget {
  WebMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.amber,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
