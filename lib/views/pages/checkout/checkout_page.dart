import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/views/pages/root/root_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.off(() => const RootPage()),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          'Checkout',
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Colors.grey),
            SizedBox(height: Get.height * 0.02),
            Center(
              child: Column(
                children: [
                  Text(
                    'Total payment',
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff5D5D5D)),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '\$100',
                            style: GoogleFonts.lato(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            )),
                        TextSpan(
                            text: '/month',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            const Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Card',
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      selectCard(IconClass.visa, 0),
                      selectCard(IconClass.mastercard, 1),
                      selectCard(IconClass.paypal, 2),
                      selectCard(IconClass.webmoney, 3),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectCard(String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: Adaptive.px(73),
        width: Adaptive.px(73),
        decoration: BoxDecoration(
            color:
                index == selectedIndex ? ColorClass.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: index == selectedIndex
                    ? ColorClass.primaryColor
                    : Colors.grey.shade300)),
        child: Center(
          child: Image.asset(image),
        ),
      ),
    );
  }
}
