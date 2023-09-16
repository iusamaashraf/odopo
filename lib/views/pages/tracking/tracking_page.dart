import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/models/tracking_stepper.dart';
import 'package:odopa/views/pages/root/root_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'components/order_tracking_header.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
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
                  ? Colors.black
                  : Colors.white,
            )),
        centerTitle: true,
        title: Text(
          'Order tracking',
          style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My order',
                style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? ColorClass.textColor
                            : Colors.white),
              ),
              SizedBox(height: Adaptive.px(16)),
              const OrderTrackingHeader(),
              AnotherStepper(
                activeBarColor: ColorClass.primaryColor,
                inActiveBarColor: ColorClass.primaryColor,
                stepperList: [
                  StepperData(
                      title: StepperText(
                        "Order Placed",
                        textStyle: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? ColorClass.textColor
                                : Colors.white),
                      ),
                      subtitle: StepperText(
                        "August 10,2023     03:20 pm",
                        textStyle: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? const Color(0xff5D5D5D)
                              : const Color(0xffaeaeae),
                        ),
                      ),
                      iconWidget: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: Color(0xff03F4C2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Image.asset(IconClass.placed),
                      )),
                  StepperData(
                      title: StepperText(
                        "Order dispatched",
                        textStyle: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? ColorClass.textColor
                                : Colors.white),
                      ),
                      subtitle: StepperText(
                        "August 10,2023     03:20 pm",
                        textStyle: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? const Color(0xff5D5D5D)
                              : const Color(0xffaeaeae),
                        ),
                      ),
                      iconWidget: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: Color(0xff03F4C2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Image.asset(IconClass.dispatched),
                      )),
                  StepperData(
                      title: StepperText(
                        "Order in transit",
                        textStyle: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? ColorClass.textColor
                                : Colors.white),
                      ),
                      subtitle: StepperText(
                        "August 10,2023     03:20 pm",
                        textStyle: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? const Color(0xff5D5D5D)
                              : const Color(0xffaeaeae),
                        ),
                      ),
                      iconWidget: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: Color(0xff03F4C2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Image.asset(IconClass.transit),
                      )),
                  StepperData(
                    iconWidget: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Color(0xffEAEAEA),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Image.asset(IconClass.delivered),
                    ),
                    title: StepperText(
                      "Delivered successfully",
                      textStyle: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? const Color(0xff5D5D5D)
                            : const Color(0xffaeaeae),
                      ),
                    ),
                    subtitle: StepperText(
                      "August 10,2023     03:20 pm",
                      textStyle: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? const Color(0xff5D5D5D)
                            : const Color(0xffaeaeae),
                      ),
                    ),
                  ),
                ],
                //  stepperData,
                stepperDirection: Axis.vertical,
                iconWidth: 40,
                iconHeight: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
