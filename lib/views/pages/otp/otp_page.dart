import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/views/pages/root/root_page.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(21)),
          child: Column(
            children: [
              SizedBox(height: Adaptive.px(110)),
              Text(
                'Welcome to',
                style: GoogleFonts.lato(
                    fontSize: 14,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? const Color(0xff5E5E5E)
                            : const Color(0xffAEAEAE),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Odopo',
                style: GoogleFonts.lato(
                    fontSize: 28,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? ColorClass.textColor
                            : const Color(0xff03F4C2),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: Adaptive.px(124)),
              SizedBox(
                width: Get.width * 0.85,
                child: Text(
                  'We just sent you a mail with 4-digit code. Looks like very soon you will be logged in!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: Adaptive.px(24)),
              OTPTextField(
                controller: otpController,
                length: 4,
                otpFieldStyle: OtpFieldStyle(
                  focusBorderColor:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? const Color(0xffd6d6d6)
                          : const Color(0xff242424),
                  enabledBorderColor:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? const Color(0xffd6d6d6)
                          : const Color(0xff242424),
                  backgroundColor:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xff242424),
                  borderColor:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? const Color(0xffd6d6d6)
                          : const Color(0xff242424),
                ),
                width: MediaQuery.of(context).size.width,
                fieldWidth: Get.width * 0.12,
                style: GoogleFonts.lato(
                    fontSize: Adaptive.px(14), fontWeight: FontWeight.w400),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {},
              ),
              SizedBox(height: Adaptive.px(15.5)),
              _start == 0
                  ? Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          resetTimer();
                        },
                        child: Text(
                          'Resend code',
                          style: GoogleFonts.roboto(
                              color: AdaptiveTheme.of(context).brightness ==
                                      Brightness.light
                                  ? const Color(0xff989898)
                                  : const Color(0xffaeaeae),
                              fontSize: 12),
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
                                  color: AdaptiveTheme.of(context).brightness ==
                                          Brightness.light
                                      ? const Color(0xff989898)
                                      : const Color(0xff004e52),
                                  fontSize: 12),
                            ),
                            TextSpan(
                                text: _start.toString(),
                                style: TextStyle(
                                    color:
                                        AdaptiveTheme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : const Color(0xff989898),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ),
              SizedBox(height: Adaptive.px(24)),
              CommonButton(
                onTap: () => Get.offAll(() => const RootPage()),
                child: Text(
                  'Verify',
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
