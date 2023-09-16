import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/views/pages/profile/profile_page.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Column(
        children: [
          SizedBox(height: Adaptive.px(43)),
          Text(
            'Odopa',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: AdaptiveTheme.of(context).brightness == Brightness.light
                    ? ColorClass.textColor
                    : Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: Adaptive.px(24)),
          Text(
            'By creating a profile of your spouse you can easily know your partner’s wishes and get an opportunity to win his/her heart',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                color: AdaptiveTheme.of(context).brightness == Brightness.light
                    ? const Color(0xff5D5D5D)
                    : const Color(0xffaeaeae),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: Adaptive.px(44)),
          Image.asset('assets/images/empty_home.png'),
          SizedBox(height: Adaptive.px(16)),
          CommonButton(
            onTap: () => Get.to(() => const ProfilePage()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create profile for your spouse',
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 21,
                )
              ],
            ),
          ),
          Container(height: Adaptive.px(106)),
        ],
      ),
    );
  }
}
