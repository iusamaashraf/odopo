import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/views/pages/root/root_page.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final OtpFieldController otpController = OtpFieldController();
  int _start = 59;
  Timer? _timer;
  bool showResendButton = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_start == 0) {
            timer.cancel();
            showResendButton = true;
          } else {
            _start--;
          }
        });
      },
    );
  }

  void resetTimer() {
    setState(() {
      _start = 59;

      startTimer();
    });
  }

  @override
  void dispose() {
    _timer!.cancel();

    super.dispose();
  }

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
                'Welcome',
                style: GoogleFonts.lato(
                    fontSize: 14,
                    color: ColorClass.secondayColor,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Odopo',
                style: GoogleFonts.lato(
                    fontSize: 28,
                    color: ColorClass.primaryColor,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: Get.height * 0.03),
              SizedBox(
                width: Get.width * 0.85,
                child: Text(
                  'We just sent you a mail with 4-digit code. Looks like very soon you will be logged in!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              OTPTextField(
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: Get.width * 0.12,
                style: const TextStyle(fontSize: (17)),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {},
              ),
              SizedBox(height: Get.height * 0.04),
              _start == 0
                  ? Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          resetTimer();
                        },
                        child: Text(
                          'Resend code in',
                          style: GoogleFonts.roboto(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Resend code in: ',
                              style: GoogleFonts.lato(
                                  color: ColorClass.primaryColor, fontSize: 18),
                            ),
                            TextSpan(
                                text: _start.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ),
              SizedBox(height: Get.height * 0.02),
              CommonButton(
                  onTap: () => Get.offAll(() => RootPage()), text: 'Verify'),
            ],
          ),
        ),
      ),
    );
  }
}
