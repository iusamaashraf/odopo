import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odopa/constants/colors.dart';

class CommonField extends StatelessWidget {
  const CommonField({
    required this.controller,
    required this.title,
    required this.onChanged,
    required this.validator,
    required this.keyBoardType,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyBoardType;
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
        SizedBox(height: Get.height * 0.01),
        TextFormField(
          keyboardType: keyBoardType,
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  const BorderSide(color: ColorClass.secondayColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  const BorderSide(color: ColorClass.secondayColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  const BorderSide(color: ColorClass.secondayColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  const BorderSide(color: ColorClass.secondayColor, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  const BorderSide(color: ColorClass.secondayColor, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  const BorderSide(color: ColorClass.secondayColor, width: 1),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.03),
      ],
    );
  }
}
