import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AuthButton extends StatelessWidget {
  AuthButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.isCircular = true,
    this.isFilled = false,
    required this.icon,
  }) : super(key: key);
  final VoidCallback onPress;

  final String text;
  bool isCircular;
  bool isFilled;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.07,
      width: Get.width,
      child: ElevatedButton.icon(
        onPressed: onPress,
        icon: icon,
        label: Text(
          text,
          style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isFilled ? Colors.white : Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isFilled ? const Color(0xff181F20) : Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(isCircular ? 40.0 : 6),
          ),
        ),
      ),
    );
  }
}
