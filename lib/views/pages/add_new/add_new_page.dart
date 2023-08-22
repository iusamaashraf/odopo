import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:odopa/views/widgets/common_field.dart';

class AddNewPage extends StatelessWidget {
  AddNewPage({super.key});
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController likController = TextEditingController();
  final TextEditingController notController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Add gift item',
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
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
              children: [
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
                Container(
                  height: Get.height * 0.2,
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
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
                SizedBox(height: Get.height * 0.04),
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
