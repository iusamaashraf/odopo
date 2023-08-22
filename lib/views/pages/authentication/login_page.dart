import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/views/pages/root/root_page.dart';
import 'package:odopa/views/widgets/auth_button.dart';
import 'package:odopa/views/widgets/common_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Odopo',
                style: GoogleFonts.lato(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Sign In to your account',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ColorClass.primaryColor,
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Image.asset(IconClass.logo),
              SizedBox(height: Get.height * 0.1),
              AuthButton(
                icon: SvgPicture.asset(
                  IconClass.google,
                ),
                onPress: () => Get.offAll(() => RootPage()),
                text: 'Continue with Google',
              ),
              SizedBox(height: Get.height * 0.02),
              AuthButton(
                isFilled: true,
                icon: SvgPicture.asset(
                  IconClass.apple,
                  color: Colors.white,
                ),
                onPress: () => Get.offAll(() => RootPage()),
                text: 'Continue with Apple',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
