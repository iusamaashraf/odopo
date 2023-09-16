import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/views/pages/root/root_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      appBar: AppBar(
        backgroundColor:
            AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.white
                : ColorClass.darkScaffoldColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.off(() => RootPage()),
            icon: Icon(
              Icons.arrow_back,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.textColor
                  : Colors.white,
            )),
        title: Text(
          'Terms and condition',
          style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.textColor
                  : Colors.white),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(16)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Adaptive.px(24)),
                Text(
                  '1. Terms and condition is given below:',
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? const Color(0xff004E52)
                          : const Color(0xff03F4C2)),
                ),
                SizedBox(height: Adaptive.px(8)),
                Text(
                  'A Terms and Conditions agreement is where you let the public know the terms, rules and guidelines for using your website or mobile app. They include topics such as acceptable use, restricted behavior and limitations of liability.',
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? const Color(0xff181F20)
                          : Colors.white),
                ),
                SizedBox(height: Adaptive.px(4)),
                Text(
                  "This article will get you started with creating your own custom Terms and Conditions agreement. We've also put together a Sample Terms and Conditions Template that you can use to help you write your own.",
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? const Color(0xff181F20)
                          : Colors.white),
                ),
                SizedBox(height: Adaptive.px(4)),
                Text(
                  "They include topics such as acceptable use, restricted behavior and limitations of liability. This article will get you started with creating your own custom Terms and Conditions agreement. We've also put together a Sample Terms and Conditions Template that you can use to help you write your own.",
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? const Color(0xff181F20)
                          : Colors.white),
                ),
                SizedBox(height: Adaptive.px(16)),
                Text(
                  '2. Privacy policy',
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? const Color(0xff004E52)
                          : const Color(0xff03F4C2)),
                ),
                SizedBox(height: Adaptive.px(8)),
                Text(
                  "What are Terms and Conditions Agreements?\nA Terms and Conditions agreement acts as a legal contract between you (the company) and the user. It's where you maintain your rights to exclude users from your app in the event that they abuse your website/app, set out the rules for using your service and note other important details and disclaimers.",
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? const Color(0xff181F20)
                          : Colors.white),
                ),
                SizedBox(height: Adaptive.px(8)),
                Text(
                  "Terms and Conditions Agreements?\nA Terms and Conditions agreement acts as a legal contract between you (the company) and the user. It's where you maintain your rights to exclude users from your app in the event that they abuse your website/app, set out the rules for using your service and note other important details and disclaimers.",
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? const Color(0xff181F20)
                          : Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
