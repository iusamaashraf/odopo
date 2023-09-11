import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.isBorder = false,
  }) : super(key: key);
  final VoidCallback onTap;
  final Widget child;
  bool isBorder;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.07,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            backgroundColor: MaterialStateProperty.all(
                isBorder ? Colors.transparent : ColorClass.primaryColor),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? ColorClass.primaryColor
                            : isBorder
                                ? Colors.white
                                : Colors.transparent),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          onPressed: onTap,
          child: child),
    );
  }
}
