import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({
    super.key,
    required this.storeName,
  });
  final String storeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.grey.shade50
                : ColorClass.darkScaffoldColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Shop',
          style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              IconClass.search,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.grey.shade50
          : ColorClass.darkScaffoldColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Browse commonly gifted items on $storeName',
                style: GoogleFonts.lato(
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(88),
                    image: IconClass.dress,
                    title: 'Dress',
                  ),
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(127),
                    image: IconClass.ornaments,
                    title: 'Ornaments',
                  ),
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(94),
                    image: IconClass.wallet,
                    title: 'Wallet',
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(119),
                    image: IconClass.footware,
                    title: 'Foot ware',
                  ),
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(105),
                    image: IconClass.reading,
                    title: 'Reading',
                  ),
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(103),
                    image: IconClass.perfumes,
                    title: 'Perfumes',
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(143),
                    image: IconClass.photoframe,
                    title: 'Photo frames',
                  ),
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(121),
                    image: IconClass.gardening,
                    title: 'Gardening',
                  ),
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(64),
                    image: IconClass.art,
                    title: 'Art',
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(119),
                    image: IconClass.bath,
                    title: 'Bath product',
                  ),
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(88),
                    image: IconClass.cards,
                    title: 'Cards',
                  ),
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(91),
                    image: IconClass.tedy,
                    title: 'Teddy',
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.015),
              ////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(103),
                    image: IconClass.camera1,
                    title: 'Camera',
                  ),
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(103),
                    image: IconClass.kitchen,
                    title: 'Kitchen',
                  ),
                  StoreTile(
                    onTap: () {},
                    height: Adaptive.px(92),
                    width: Adaptive.px(97),
                    image: IconClass.other,
                    title: 'Others',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoreTile extends StatelessWidget {
  const StoreTile({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final double height;
  final double width;
  final String image;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.white
                : const Color(0xff1b1d1d),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: AdaptiveTheme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade300
                    : const Color(0xff242424))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(height: Adaptive.px(10)),
            Text(
              title,
              style: GoogleFonts.lato(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
