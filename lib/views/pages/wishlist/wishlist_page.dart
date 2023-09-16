import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/models/wish_list_header_model.dart';
import 'package:odopa/views/pages/add_new/add_new_page.dart';
import 'package:odopa/views/pages/event/create_other_event_page.dart';
import 'package:odopa/views/pages/partner_wishlist/partner_wishlist_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'components/partner_wishlist.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.px(16)),
        child: Column(
          children: [
            PartnerWishlist(
              onTap: () => Get.to(() => PartnerWishlistPage()),
            ),
            SizedBox(height: Adaptive.px(16)),
            Row(
              children: List.generate(
                headerList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          headerList[index].title,
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              color: AdaptiveTheme.of(context).brightness ==
                                      Brightness.light
                                  ? const Color(0xff004E52)
                                  : const Color(0xffaeaeae),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 6),
                        index == selectedIndex
                            ? Container(
                                width: 27,
                                height: 2,
                                color: AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? const Color(0xff004E52)
                                    : const Color(0xffaeaeae),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            selectedIndex < 3
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recently added',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? ColorClass.textColor
                                : Colors.white),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => AddNewPage()),
                        // onTap: () => Get.to(() => const CreateOtherEventPage()),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? ColorClass.primaryColor
                                    : const Color(0xff03f4c2)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              'Add New',
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AdaptiveTheme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorClass.primaryColor
                                      : const Color(0xff03f4c2)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            SizedBox(height: Adaptive.px(32)),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: selectedIndex == 3
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(bottom: 20),
                itemCount: selectedIndex == 3 ? 1 : 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: Adaptive.px(8)),
                    child: selectedIndex < 3
                        ? Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        AdaptiveTheme.of(context).brightness ==
                                                Brightness.light
                                            ? const Color(0xffFCFFFF)
                                            : const Color(0xff242424),
                                    border: Border.all(
                                      color: AdaptiveTheme.of(context)
                                                  .brightness ==
                                              Brightness.light
                                          ? const Color(0xffE5E5E5)
                                          : const Color(0xff242424),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AdaptiveTheme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? const Color(0xffFCFFFF)
                                              : const Color(0xff242424),
                                          blurRadius: 8),
                                    ]),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/watch.png',
                                        fit: BoxFit.cover,
                                        width: Get.width,
                                      ),
                                      SizedBox(height: Get.height * 0.01),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Wrist watch',
                                            style: GoogleFonts.lato(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AdaptiveTheme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? const Color(0xff1F1C1C)
                                                    : Colors.white),
                                          ),
                                          Text(
                                            '20 July, 2022',
                                            style: GoogleFonts.lato(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AdaptiveTheme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? const Color(0xff8B8B8B)
                                                    : Colors.white
                                                        .withOpacity(.4)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Get.height * 0.015),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'www.abcdshopping.com',
                                            style: GoogleFonts.lato(
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          Image.asset(
                                            IconClass.document,
                                            color: AdaptiveTheme.of(context)
                                                        .brightness ==
                                                    Brightness.light
                                                ? const Color(0xff181F20)
                                                : Colors.white,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: Get.height * 0.015),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(
                            height: Get.height,
                            width: Get.width,
                            child: const CreateOtherEventPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
