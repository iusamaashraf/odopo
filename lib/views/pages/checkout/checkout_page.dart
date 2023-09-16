import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/controllers/subscription_controller.dart';
import 'package:odopa/views/pages/root/root_page.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:odopa/views/widgets/common_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isDefaultPaymentCard = false;
  int selectedIndex = -1;
  final TextEditingController cardHolderNameController =
      TextEditingController();

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final SubscriptionController subscriptionController =
      Get.put(SubscriptionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.white
                : ColorClass.darkScaffoldColor,
        leading: IconButton(
            onPressed: () => Get.off(() => const RootPage()),
            icon: Icon(
              Icons.arrow_back,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.textColor
                  : Colors.white,
            )),
        centerTitle: true,
        title: Text(
          'Checkout',
          style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.textColor
                  : Colors.white),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Adaptive.px(24)),
              const Divider(color: Colors.grey),
              SizedBox(height: Adaptive.px(22)),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Total payment',
                      style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? const Color(0xff5D5D5D)
                              : const Color(0xffaeaeae)),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: '\$100',
                              style: GoogleFonts.lato(
                                fontSize: 32,
                                color: AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? ColorClass.textColor
                                    : Colors.white,
                                fontWeight: FontWeight.w500,
                              )),
                          TextSpan(
                              text: '/month',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? ColorClass.textColor
                                    : Colors.white,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Adaptive.px(24)),
              const Divider(color: Colors.grey),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, top: Adaptive.px(24), right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Card',
                      style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? ColorClass.textColor
                              : Colors.white),
                    ),
                    SizedBox(height: Adaptive.px(16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectCard(IconClass.visa, 0),
                        selectCard(IconClass.mastercard, 1),
                        selectCard(IconClass.paypal, 2),
                        selectCard(IconClass.webmoney, 3),
                      ],
                    ),
                    SizedBox(height: Adaptive.px(21)),
                    CommonField(
                      controller: cardHolderNameController,
                      title: 'Card holder name',
                      onChanged: (value) {},
                      validator: (value) {
                        return '';
                      },
                      keyBoardType: TextInputType.number,
                    ),
                    CommonField(
                      controller: cardNumberController,
                      title: 'Card number',
                      onChanged: (value) {},
                      validator: (value) {
                        return '';
                      },
                      keyBoardType: TextInputType.number,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            controller: expireDateController,
                            title: 'Expire date',
                            onChanged: (value) {},
                            validator: (value) {
                              return '';
                            },
                            keyBoardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CommonField(
                            controller: cvcController,
                            title: 'CVV',
                            onChanged: (value) {},
                            validator: (value) {
                              return '';
                            },
                            keyBoardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDefaultPaymentCard = !isDefaultPaymentCard;
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                color: isDefaultPaymentCard
                                    ? ColorClass.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: ColorClass.primaryColor, width: 2),
                              ),
                              child: isDefaultPaymentCard
                                  ? const Center(
                                      child: Icon(
                                        Icons.done,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const SizedBox()),
                          const SizedBox(width: 8),
                          Text(
                            'Set as default payment card',
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                color: AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    CommonButton(
                        onTap: () {
                          subscriptionController.subscribed();
                          if (kDebugMode) {
                            print(
                                'value is${subscriptionController.isSubscribed}');
                          }
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return subscriptionPopUp(context);
                            },
                          );
                        },
                        child: Text(
                          'Pay now',
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            ],
          ),
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
                ? AdaptiveTheme.of(context).brightness == Brightness.light
                    ? ColorClass.primaryColor
                    : AdaptiveTheme.of(context).brightness == Brightness.light
                        ? const Color(0xff004e52)
                        : const Color(0xff242424)
                : AdaptiveTheme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade300
                    : const Color(0xff242424),
          ),
        ),
        child: Center(
          child: Image.asset(image),
        ),
      ),
    );
  }

  subscriptionPopUp(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      content: SizedBox(
        width: Adaptive.px(343),
        height: Adaptive.px(329),
        child: Stack(
          children: [
            Image.asset(IconClass.baloons),
            Positioned(
              left: 0,
              right: 0,
              top: Get.height * 0.06,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    IconClass.done,
                    color: const Color(0xff03f4c2),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  Text(
                    'Congratulation!',
                    style: GoogleFonts.lato(
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? ColorClass.primaryColor
                          : Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Text(
                    'Payment successful!',
                    style: GoogleFonts.lato(
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? ColorClass.primaryColor
                          : Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonButton(
                      onTap: () => Get.offAll(() => RootPage()),
                      child: Text(
                        'Back to Home',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: 10,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: ColorClass.primaryColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
