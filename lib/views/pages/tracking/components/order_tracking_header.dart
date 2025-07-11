import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderTrackingHeader extends StatelessWidget {
  const OrderTrackingHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            'assets/images/watch.png',
            height: Adaptive.px(101),
            width: Adaptive.px(116),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: Adaptive.px(8)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Adaptive.px(220),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wrist watch',
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? ColorClass.textColor
                            : Colors.white),
                  ),
                  Text(
                    '20 mar 2022',
                    style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.005),
            Text(
              'Matrix',
              style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff5D5D5D)),
            ),
            SizedBox(height: Get.height * 0.005),
            Text(
              'Analog Day & Date',
              style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff5D5D5D)),
            ),
            SizedBox(height: Get.height * 0.005),
            Text(
              '\$ 100',
              style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? ColorClass.textColor
                          : Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
