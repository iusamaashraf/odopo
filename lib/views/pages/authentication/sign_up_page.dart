import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/views/widgets/auth_button.dart';
import 'package:odopa/views/widgets/common_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                'Create your own account',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ColorClass.primaryColor,
                ),
              ),
              SizedBox(height: Get.height * 0.1),
              AuthButton(
                onPress: () {},
                iamge: IconClass.google,
                text: 'Continue with Google',
              ),
              SizedBox(height: Get.height * 0.02),
              AuthButton(
                onPress: () {},
                iamge: IconClass.apple,
                text: 'Continue with Apple',
              ),
              SizedBox(height: Get.height * 0.2),
              CommonButton(
                text: 'Sign Up',
                onTap: () {},
              ),
              SizedBox(height: Get.height * 0.02),
              TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  'Already have an account? Sign In',
                  style: GoogleFonts.lato(
                      color: ColorClass.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
