import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/icons.dart';

List<StepperData> stepperData = [
  StepperData(
      title: StepperText(
        "Order Placed",
        textStyle: GoogleFonts.lato(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      subtitle: StepperText(
        "August 10,2023     03:20 pm",
        textStyle: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xff5D5D5D),
        ),
      ),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color(0xff03F4C2),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Image.asset(IconClass.placed),
      )),
  StepperData(
      title: StepperText(
        "Order dispatched",
        textStyle: GoogleFonts.lato(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      subtitle: StepperText(
        "August 10,2023     03:20 pm",
        textStyle: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xff5D5D5D),
        ),
      ),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color(0xff03F4C2),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Image.asset(IconClass.dispatched),
      )),
  StepperData(
      title: StepperText(
        "Order in transit",
        textStyle: GoogleFonts.lato(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      subtitle: StepperText(
        "August 10,2023     03:20 pm",
        textStyle: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xff5D5D5D),
        ),
      ),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color(0xff03F4C2),
            borderRadius: BorderRadius.all(Radius.circular(30))),
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
        color: const Color(0xff5D5D5D),
      ),
    ),
    subtitle: StepperText(
      "August 10,2023     03:20 pm",
      textStyle: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xff5D5D5D),
      ),
    ),
  ),
];
