import 'package:ecco_app/utils/styles.dart';
import 'package:flutter/material.dart';

class DeleteProductScreen extends StatelessWidget {
  static const String id = 'deleteproduct';
  const DeleteProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Delete Product Screen',
          style: EcoStyle.boldStyle,
        ),
      ),
    );
  }
}
