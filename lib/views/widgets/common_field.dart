import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonField extends StatelessWidget {
  CommonField({
    required this.controller,
    required this.title,
    required this.onChanged,
    required this.validator,
    required this.keyBoardType,
    this.isSuffix = false,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyBoardType;
  bool isSuffix;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: ColorClass.secondayColor),
        ),
        SizedBox(height: Get.height * 0.004),
        TextFormField(
          keyboardType: keyBoardType,
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: isSuffix
                ? Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Text(
                      'Hour',
                      style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? Colors.black
                              : Colors.white),
                    ),
                  )
                : const SizedBox(),
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? ColorClass.secondayColor
                          : const Color(0xff242424),
                  width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? ColorClass.secondayColor
                          : const Color(0xff242424),
                  width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? ColorClass.secondayColor
                          : const Color(0xff242424),
                  width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? ColorClass.secondayColor
                          : const Color(0xff242424),
                  width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? ColorClass.secondayColor
                          : const Color(0xff242424),
                  width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? ColorClass.secondayColor
                          : const Color(0xff242424),
                  width: 1),
            ),
          ),
        ),
        SizedBox(height: Adaptive.px(16)),
      ],
    );
  }
}
