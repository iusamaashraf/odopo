import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.onPress,
    required this.iamge,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPress;
  final String iamge;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.07,
      width: Get.width,
      child: ElevatedButton.icon(
        onPressed: onPress,
        icon: SvgPicture.asset(iamge),
        label: Text(
          text,
          style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}
