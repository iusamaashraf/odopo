import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odopa/views/pages/otp/otp_page.dart';
import 'package:odopa/views/widgets/common_button.dart';

import 'components/invite_header.dart';

class SendInvitationPage extends StatelessWidget {
  const SendInvitationPage({
    super.key,
    required this.name,
    required this.email,
    required this.interest,
    required this.eventDate,
  });
  final String name;
  final String email;
  final String interest;
  final DateTime eventDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InviteHeader(),
            SizedBox(height: Get.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: SizedBox(
                height: Get.height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Julia',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      'Julia@gmail.com',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      'Interest:Travelling, Gardening',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      'Birthday:January 01, 2001',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      'Anniversary:January 01, 2001',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    CommonButton(
                        onTap: () => Get.offAll(() => const OtpPage()),
                        text: 'Send Invitation'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
