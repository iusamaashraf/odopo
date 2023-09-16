import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/views/pages/root/root_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/animated_switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isEnabledNotification = false;
  bool isRemind = false;
  bool isOneTapWishes = false;
  bool isChangeTheme = true;

  void _toggleTheme(bool isLightTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isLightTheme) {
      prefs.setString("theme", "light");
      // ignore: use_build_context_synchronously
      AdaptiveTheme.of(context).setLight();
    } else {
      prefs.setString("theme", "dark");
      // ignore: use_build_context_synchronously
      AdaptiveTheme.of(context).setDark();
    }
    setState(() {
      isChangeTheme = isLightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : const Color(0xff151515),
      appBar: AppBar(
        backgroundColor:
            AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.white
                : ColorClass.darkScaffoldColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.off(() => const RootPage()),
          icon: Icon(
            Icons.arrow_back,
            color: AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? const Color(0xff181F20)
                  : Colors.white),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Adaptive.px(24)),
              Text(
                'Notification',
                style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white),
              ),
              SizedBox(height: Adaptive.px(24)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notification enable',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white),
                  ),
                  const AnimatedSwitch(),
                ],
              ),
              SizedBox(height: Adaptive.px(8)),
              const Divider(color: Colors.grey),
              SizedBox(height: Adaptive.px(16)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remind me of occassion',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white),
                  ),
                  const AnimatedSwitch(),
                ],
              ),
              SizedBox(height: Adaptive.px(8)),
              const Divider(color: Colors.grey),
              SizedBox(height: Adaptive.px(16)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notification Sound',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white),
                  ),
                  const AnimatedSwitch(),
                ],
              ),
              SizedBox(height: Adaptive.px(8)),
              const Divider(color: Colors.grey),
              SizedBox(height: Adaptive.px(16)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'One-tap wishes',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white),
                  ),
                  const AnimatedSwitch(),
                ],
              ),
              SizedBox(height: Adaptive.px(8)),
              const Divider(color: Colors.grey),
              SizedBox(height: Adaptive.px(24)),
              Text(
                'App Theme',
                style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? const Color(0xff1F1C1C)
                            : Colors.white),
              ),
              SizedBox(height: Adaptive.px(17)),
              RadioListTile<bool>(
                title: Text(
                  'Light',
                  style: GoogleFonts.lato(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                value: isChangeTheme == true,
                activeColor: ColorClass.primaryColor,
                groupValue: true,
                onChanged: (b) {
                  _toggleTheme(true);
                },
              ),
              // SizedBox(height: Adaptive.px(11)),
              RadioListTile<bool>(
                title: Text(
                  'Dark',
                  style: GoogleFonts.lato(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                value: isChangeTheme == false,
                activeColor: ColorClass.primaryColor,
                groupValue: true,
                onChanged: (b) {
                  _toggleTheme(false);
                },
              ),
              const Spacer(),
              SizedBox(
                width: Get.width,
                height: Get.height * 0.07,
                child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Delete account',
                      style: GoogleFonts.lato(
                          color: const Color(0xffFD2D2D),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(height: Adaptive.px(16)),
            ],
          ),
        ),
      ),
    );
  }
}
