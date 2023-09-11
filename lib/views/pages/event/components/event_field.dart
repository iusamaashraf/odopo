import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';

class EventField extends StatelessWidget {
  EventField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isReadOnly = false,
    required this.onChanged,
    required this.validator,
    this.isSuffix = false,
    required this.suffix,
  }) : super(key: key);

  final TextEditingController controller;
  bool isReadOnly;
  final String hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  bool isSuffix;
  Widget suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadOnly,
      keyboardType: TextInputType.name,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      style: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AdaptiveTheme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white),
      decoration: InputDecoration(
        suffixIcon: isSuffix ? suffix : const SizedBox(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: hintText,
        hintStyle: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.secondayColor
                  : const Color(0xff242424),
              width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.secondayColor
                  : const Color(0xff242424),
              width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.secondayColor
                  : const Color(0xff242424),
              width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.secondayColor
                  : const Color(0xff242424),
              width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.secondayColor
                  : const Color(0xff242424),
              width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.secondayColor
                  : const Color(0xff242424),
              width: 1),
        ),
      ),
    );
  }
}
