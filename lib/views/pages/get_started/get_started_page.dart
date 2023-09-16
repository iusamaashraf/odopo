import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/views/pages/authentication/login_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: Get.height * 0.05,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(IconClass.getsrated),
                  SizedBox(height: Adaptive.px(91.5)),
                  Text(
                    'Welcome to',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? const Color(0xff5E5E5E)
                            : const Color(0xffAEAEAE),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Odopo',
                    style: GoogleFonts.lato(
                        fontSize: 28,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? ColorClass.textColor
                            : const Color(0xff03F4C2),
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: Adaptive.px(34)),
                  SizedBox(
                    width: Get.width * 0.85,
                    child: Text(
                      'Celebrate your special event with someone special here. You can enrich your relationship by wishing timely and sending gifts',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? const Color(0xff5E5E5E)
                              : const Color(0xffAEAEAE),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: Adaptive.px(40)),
                  GestureDetector(
                    onTap: () => Get.offAll(() => const LoginPage()),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Adaptive.px(44),
                          vertical: Adaptive.px(16)),
                      width: Adaptive.px(343),
                      decoration: BoxDecoration(
                        color: ColorClass.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get Started',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Adaptive.px(28)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
