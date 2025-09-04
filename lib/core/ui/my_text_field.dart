import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String? hint;
  final String? suffix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;

  const MyTextField({
    super.key,
    required this.controller,
    this.maxLines = 1,
    this.hint,
    this.suffix,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        suffixText: suffix,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      validator: validator,
    );
  }
}
