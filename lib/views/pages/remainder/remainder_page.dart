import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/models/remainder_model.dart';
import 'package:odopa/views/pages/root/root_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RemainderPage extends StatelessWidget {
  const RemainderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.grey.shade50
          : ColorClass.darkScaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.grey.shade50
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
          'Reminder',
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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: Get.height * 0.03),
                itemCount: remainderList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.px(16), vertical: Adaptive.px(16)),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.white
                            : const Color(0xff1b1d1d),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? Colors.grey.shade300
                                : const Color(0xff242424)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                remainderList[index].bday,
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        AdaptiveTheme.of(context).brightness ==
                                                Brightness.light
                                            ? ColorClass.textColor
                                            : Colors.white),
                              ),
                              PopupMenuButton<String>(
                                color: AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : ColorClass.darkScaffoldColor,
                                onSelected: (value) {},
                                itemBuilder: (BuildContext context) {
                                  return <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                      value: "item1",
                                      child: Text(
                                        "Edit",
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AdaptiveTheme.of(context)
                                                        .brightness ==
                                                    Brightness.light
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                    ),
                                    PopupMenuItem<String>(
                                      value: "item2",
                                      child: Text(
                                        "Delete",
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AdaptiveTheme.of(context)
                                                        .brightness ==
                                                    Brightness.light
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                    ),
                                    // Add more PopupMenuItem widgets as needed
                                  ];
                                },
                              )
                            ],
                          ),
                          Text(
                            remainderList[index].date,
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorClass.textColor),
                          ),
                          SizedBox(height: Adaptive.px(12)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(IconClass.reminderBell),
                              const SizedBox(width: 5),
                              Text(
                                remainderList[index].time,
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        AdaptiveTheme.of(context).brightness ==
                                                Brightness.light
                                            ? ColorClass.textColor
                                            : Colors.white),
                              ),
                              const Spacer(),
                              Text(
                                remainderList[index].day,
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        AdaptiveTheme.of(context).brightness ==
                                                Brightness.light
                                            ? ColorClass.textColor
                                            : Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
