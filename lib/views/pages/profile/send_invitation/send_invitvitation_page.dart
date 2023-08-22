import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/views/pages/otp/otp_page.dart';
import 'package:odopa/views/pages/root/root_page.dart';
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
            const SizedBox(height: 10),
            Align(
              child: Text(
                'Julia',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(height: Get.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            'assets/icons/edit.png',
                            color: Colors.black,
                          )),
                      const SizedBox(height: 10),
                      const InvitationRowData(
                        subtitle: 'Julia@gmail.com',
                        title: 'E-mail',
                      ),
                      const InvitationRowData(
                        subtitle: 'Travelling, Gardening',
                        title: 'Interest:',
                      ),
                      const InvitationRowData(
                        subtitle: 'January 01, 2001',
                        title: 'Birthday:',
                      ),
                      const InvitationRowData(
                        subtitle: 'January 01, 2001',
                        title: 'Anniversary:',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: CommonButton(
                onTap: () => Get.offAll(() => const OtpPage()),
                child: Text(
                  'Send Invitation',
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class InvitationRowData extends StatelessWidget {
  const InvitationRowData({
    Key? key,
    required this.subtitle,
    required this.title,
  }) : super(key: key);
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              subtitle,
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const Divider(color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }
}
