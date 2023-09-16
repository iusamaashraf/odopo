import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:odopa/views/widgets/common_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddNewPage extends StatelessWidget {
  AddNewPage({super.key});
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController likController = TextEditingController();
  final TextEditingController notController = TextEditingController();
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
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            )),
        title: Text(
          'Add gift item',
          style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Adaptive.px(33)),
                CommonField(
                  controller: productNameController,
                  title: 'Name of the product',
                  onChanged: (value) {},
                  validator: (value) {
                    return '';
                  },
                  keyBoardType: TextInputType.name,
                ),
                CommonField(
                  controller: likController,
                  title: 'Link of the product ',
                  onChanged: (value) {},
                  validator: (value) {
                    return '';
                  },
                  keyBoardType: TextInputType.name,
                ),
                Text(
                  'Add any note',
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? const Color(0xff5d5d5d)
                          : const Color(0xffaeaeae)),
                ),
                SizedBox(height: Get.height * 0.004),
                Container(
                  height: Get.height * 0.2,
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? Colors.grey.shade300
                          : const Color(0xff242424),
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextFormField(
                    maxLines: 30,
                    controller: notController,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: Adaptive.px(24)),
                CommonButton(
                    onTap: () {},
                    child: Text(
                      'Save and continue',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
