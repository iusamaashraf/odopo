import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';

class MyCalendarClass {
  DateTime selectedDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  void customCalendar(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor:
                  AdaptiveTheme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : const Color(0xff242424),
              content: StatefulBuilder(
                  builder: ((context, setState) => Container(
                        width: Get.width,
                        height: 310,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "${monthNames[currentDate.month - 1]} ${currentDate.year}",
                                      style: GoogleFonts.lato(
                                        color: AdaptiveTheme.of(context)
                                                    .brightness ==
                                                Brightness.light
                                            ? const Color(0xff181F20)
                                            : Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      )),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentDate = DateTime(
                                              currentDate.year,
                                              currentDate.month - 1,
                                            );
                                          });
                                        },
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          color: AdaptiveTheme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white,
                                          size: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentDate = DateTime(
                                              currentDate.year,
                                              currentDate.month + 1,
                                            );
                                          });
                                        },
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: AdaptiveTheme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white,
                                          size: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Mo',
                                    style: GoogleFonts.lato(
                                        color: AdaptiveTheme.of(context)
                                                    .brightness ==
                                                Brightness.light
                                            ? const Color(0xff181F20)
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Tu',
                                    style: GoogleFonts.lato(
                                        color: AdaptiveTheme.of(context)
                                                    .brightness ==
                                                Brightness.light
                                            ? const Color(0xff181F20)
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'We',
                                    style: GoogleFonts.lato(
                                        color: AdaptiveTheme.of(context)
                                                    .brightness ==
                                                Brightness.light
                                            ? const Color(0xff181F20)
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Th',
                                    style: GoogleFonts.lato(
                                        color: AdaptiveTheme.of(context)
                                                    .brightness ==
                                                Brightness.light
                                            ? const Color(0xff181F20)
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Fr',
                                    style: GoogleFonts.lato(
                                        color: AdaptiveTheme.of(context)
                                                    .brightness ==
                                                Brightness.light
                                            ? const Color(0xff181F20)
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Sa',
                                    style: GoogleFonts.lato(
                                        color: AdaptiveTheme.of(context)
                                                    .brightness ==
                                                Brightness.light
                                            ? const Color(0xff181F20)
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Su',
                                    style: GoogleFonts.lato(
                                        color: AdaptiveTheme.of(context)
                                                    .brightness ==
                                                Brightness.light
                                            ? const Color(0xff181F20)
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7,
                              ),
                              itemCount: _daysInMonth(currentDate),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                DateTime day = DateTime(
                                  currentDate.year,
                                  currentDate.month,
                                  index + 1,
                                );
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDate = day;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: day.day == selectedDate.day &&
                                              day.month == selectedDate.month
                                          ? const Color(0xff03F4C2)
                                          : Colors.transparent,
                                    ),
                                    child: Text("${day.day}",
                                        style: GoogleFonts.inter(
                                            color: AdaptiveTheme.of(context)
                                                        .brightness ==
                                                    Brightness.light
                                                ? const Color(0xff181F20)
                                                : const Color(0xffAEAEAE),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ))));
        });
  }

  int _daysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }
}
