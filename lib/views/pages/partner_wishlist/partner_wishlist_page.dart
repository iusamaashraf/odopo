import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/models/wish_list_header_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PartnerWishlistPage extends StatefulWidget {
  const PartnerWishlistPage({super.key});

  @override
  State<PartnerWishlistPage> createState() => _PartnerWishlistPageState();
}

class _PartnerWishlistPageState extends State<PartnerWishlistPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.white
                : ColorClass.darkScaffoldColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.textColor
                  : Colors.white,
            )),
        title: Text(
          'Wishlist',
          style: GoogleFonts.lato(
              fontSize: 20,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? ColorClass.textColor
                  : Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 16,
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      body: SizedBox(
        height: Adaptive.h(100),
        width: Adaptive.w(100),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Adaptive.px(30)),
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
              SizedBox(height: Adaptive.px(16)),
              Text(
                'Recently added',
                style: GoogleFonts.lato(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? ColorClass.textColor
                          : Colors.white,
                  fontSize: Adaptive.px(18),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Adaptive.px(10)),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.transparent
                                    : const Color(0xff1B1D1D),
                                border: Border.all(
                                  color: AdaptiveTheme.of(context).brightness ==
                                          Brightness.light
                                      ? const Color(0xffE5E5E5)
                                      : const Color(0xff242424),
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: Adaptive.px(86),
                                    width: Adaptive.px(86),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/watch.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: Adaptive.px(8),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                      SizedBox(
                                        width: Adaptive.w(62),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '20 July, 2022',
                                              style: GoogleFonts.lato(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AdaptiveTheme.of(
                                                                  context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? const Color(0xff8B8B8B)
                                                      : Colors.white
                                                          .withOpacity(.4)),
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
                                      ),
                                      Text(
                                        'www.abcdshopping.com',
                                        style: GoogleFonts.lato(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
