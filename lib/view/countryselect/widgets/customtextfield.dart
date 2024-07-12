import 'package:flutter/material.dart';
import 'package:login_app/constants/constants.dart';

class CustomtextField extends StatelessWidget {
  const CustomtextField({
    super.key,
    required this.text,
    required this.icon,
    this.onChanged,
  });
  final String text;
  final Function(String)? onChanged;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Constants.textcolor2,
        ),
        hintText: text,
        hintStyle: const TextStyle(
            color: Constants.white, fontSize: 18, fontWeight: FontWeight.w300),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        filled: true,
        fillColor: const Color.fromARGB(255, 61, 61, 61),
      ),
    );
  }
}
