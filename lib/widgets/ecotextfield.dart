import 'package:flutter/material.dart';

class EcoTextField extends StatefulWidget {
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validate;
  Widget? icon;
  bool isPassword;
  int? maxLines;
  bool check;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;

  EcoTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.validate,
      this.icon,
      this.isPassword = false,
      this.check = false,
      this.inputAction,
      this.focusNode});

  @override
  State<EcoTextField> createState() => _EcoTextFieldState();
}

class _EcoTextFieldState extends State<EcoTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword == false ? false : widget.isPassword,
        validator: widget.validate,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText ?? 'hint Text...',
          suffixIcon: widget.icon,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
