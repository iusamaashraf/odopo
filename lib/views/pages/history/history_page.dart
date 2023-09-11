import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/models/history_model.dart';
import 'package:odopa/views/pages/root/root_page.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<String> _historyHeader = [
    'Ongoing',
    'History',
    'Draft',
  ];

  int selectedIndex = 0;

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
          'Order history',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  _historyHeader.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _historyHeader[index],
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : const Color(0xffaeaeae)),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 2,
                            width: 27,
                            color: index == selectedIndex
                                ? AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? ColorClass.primaryColor
                                    : const Color(0xffaeaeae)
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            Expanded(
              child: ListView.builder(
                itemCount: historyLits.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(8),
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
                                : const Color(0xff242424))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                historyLits[index].image,
                                width: Adaptive.px(94),
                                height: Adaptive.px(94),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: Get.width * 0.01),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        historyLits[index].title,
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: AdaptiveTheme.of(context)
                                                        .brightness ==
                                                    Brightness.light
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        historyLits[index].date,
                                        style: GoogleFonts.lato(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.015),
                                Text(
                                  historyLits[index].detail1,
                                  style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: Get.height * 0.015),
                                Text(
                                  historyLits[index].detail2,
                                  style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: Get.height * 0.015),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: Adaptive.px(26),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xff03F4C2),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Gift as 24th Birthday',
                                            style: GoogleFonts.lato(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        historyLits[index].price,
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.04),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: Adaptive.px(44),
                          // width: Adaptive.px(200),
                          child: CommonButton(
                              onTap: () {},
                              child: Text(
                                'Order details',
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
