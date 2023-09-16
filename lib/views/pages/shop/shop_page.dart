import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/views/pages/shop/shopping_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Adaptive.px(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Adaptive.px(25),
          ),
          Text(
            'Select Place to shop from ',
            style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AdaptiveTheme.of(context).brightness == Brightness.light
                    ? const Color(0xff181F20)
                    : Colors.white),
          ),
          SizedBox(
            height: Adaptive.px(24),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.to(
                  () => const ShoppingPage(storeName: 'Amazon'),
                ),
                child: Container(
                  width: Adaptive.px(137),
                  height: 166,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.grey.shade300
                            : const Color(0xff242424)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconClass.amazon,
                        // color: AdaptiveTheme.of(context).brightness ==
                        //         Brightness.light
                        //     ? Colors.black
                        //     : Color(0xff242424),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        'Amazon',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: Get.width * 0.02),
              GestureDetector(
                onTap: () => Get.to(
                  () => const ShoppingPage(storeName: 'Other'),
                ),
                child: Container(
                  width: 137,
                  height: 166,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.grey.shade300
                            : const Color(0xff242424)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(IconClass.other),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        'Others',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
