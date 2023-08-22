import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';

class PartnerWishlist extends StatelessWidget {
  const PartnerWishlist({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.06,
        width: Get.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check your Partner’s Wishlist',
                style: GoogleFonts.lato(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: ColorClass.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
