import 'package:adaptive_theme/adaptive_theme.dart';
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
            color: AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.white
                : const Color(0xff1b1d1d),
            border: Border.all(
                color: AdaptiveTheme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade300
                    : const Color(0xff242424)),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check your Partner’s Wishlist',
                style: GoogleFonts.lato(
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? const Color(0xff005456)
                            : Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Icon(Icons.arrow_forward_ios,
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? ColorClass.primaryColor
                          : Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
