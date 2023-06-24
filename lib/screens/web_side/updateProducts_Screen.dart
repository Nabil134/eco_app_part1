import 'package:ecco_app/utils/styles.dart';
import 'package:flutter/material.dart';

class UpdateProductScreen extends StatelessWidget {
  static const String id = 'updateproduct';
  UpdateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Update Product Screen',
          style: EcoStyle.boldStyle,
        ),
      ),
    );
  }
}
