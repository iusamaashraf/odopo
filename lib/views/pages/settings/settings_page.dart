import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';

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
  bool isLightTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notification',
                style:
                    GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: Get.height * 0.025),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notification enable',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEnabledNotification = !isEnabledNotification;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: isEnabledNotification
                              ? ColorClass.primaryColor
                              : Colors.white,
                          border: Border.all(color: ColorClass.primaryColor),
                          borderRadius: BorderRadius.circular(4)),
                      child: isEnabledNotification
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 14,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              const Divider(color: Colors.grey),
              SizedBox(height: Get.height * 0.01),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remind me of occassion',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRemind = !isRemind;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color:
                              isRemind ? ColorClass.primaryColor : Colors.white,
                          border: Border.all(color: ColorClass.primaryColor),
                          borderRadius: BorderRadius.circular(4)),
                      child: isEnabledNotification
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 14,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              const Divider(color: Colors.grey),
              SizedBox(height: Get.height * 0.01),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remind me of occassion',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const AnimatedSwitch(),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              const Divider(color: Colors.grey),
              SizedBox(height: Get.height * 0.01),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'One-tap wishes',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOneTapWishes = !isOneTapWishes;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: isOneTapWishes
                              ? ColorClass.primaryColor
                              : Colors.white,
                          border: Border.all(color: ColorClass.primaryColor),
                          borderRadius: BorderRadius.circular(4)),
                      child: isOneTapWishes
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 14,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              const Divider(color: Colors.grey),
              SizedBox(height: Get.height * 0.025),
              Text(
                'General',
                style:
                    GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: Get.height * 0.025),
              Text(
                'App Theme',
                style:
                    GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLightTheme = true;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: isLightTheme
                            ? ColorClass.primaryColor
                            : Colors.white,
                        border: Border.all(color: ColorClass.primaryColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: isLightTheme
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 14,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Light',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: Get.width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLightTheme = false;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: !isLightTheme
                            ? ColorClass.primaryColor
                            : Colors.white,
                        border: Border.all(color: ColorClass.primaryColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: !isLightTheme
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 14,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Dark',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              const Divider(color: Colors.grey),
              SizedBox(height: Get.height * 0.01),
              Text(
                'Delete account',
                style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
