// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/views/pages/profile/send_invitation/send_invitvitation_page.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:odopa/views/widgets/common_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController interestController = TextEditingController();
  File? image;
  Future pickImage(ImageSource sr) async {
    try {
      final image = await ImagePicker().pickImage(source: sr);
      if (image == null) {}
      final imageTemporary = File(image!.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('failed to pick image: $e');
    }
  }

//drop down implementation
  final List<String> _locations = ['Birthday', 'Anniversary', 'First meet'];
  String? _selectedLocation;

  // set date

  DateTime selectedDate = DateTime.now();

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    final String formatted = formatter.format(selectedDate);
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
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
                  ? Colors.black
                  : Colors.white,
            )),
        title: Text(
          'Create Profile',
          style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 16,
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: Get.height * 0.1),
                image != null
                    ? GestureDetector(
                        onTap: () {
                          pickImage(ImageSource.camera);
                        },
                        child: SizedBox(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor:
                                AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : const Color(0xff242424),
                            backgroundImage: FileImage(image!),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          pickImage(ImageSource.camera);
                        },
                        child: Container(
                          height: 105,
                          width: 105,
                          decoration: BoxDecoration(
                              color: AdaptiveTheme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.white
                                  : const Color(0xff242424),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.grey
                                    : Colors.grey.shade600,
                              )),
                          child: Center(
                            child: SvgPicture.asset(
                              IconClass.camera,
                              color: AdaptiveTheme.of(context).brightness ==
                                      Brightness.light
                                  ? const Color(0xff004E52)
                                  : const Color(0xff03F4C2),
                            ),
                          ),
                        )),
                SizedBox(height: Get.height * 0.06),
                CommonField(
                  controller: nameController,
                  title: 'Full name',
                  keyBoardType: TextInputType.name,
                  onChanged: (value) {},
                  validator: (value) {
                    return '';
                  },
                ),
                CommonField(
                  controller: emailController,
                  title: 'Email',
                  keyBoardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  validator: (value) {
                    return '';
                  },
                ),
                CommonField(
                  controller: interestController,
                  title: 'Interest',
                  keyBoardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  validator: (value) {
                    return '';
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add special event',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: ColorClass.secondayColor),
                    ),
                    Icon(Icons.add,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? ColorClass.primaryColor
                            : Colors.white),
                  ],
                ),
                SizedBox(height: Get.height * 0.01),
                Container(
                  height: Get.height * 0.06,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? Colors.white
                          : ColorClass.darkScaffoldColor,
                      border: Border.all(
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? Colors.grey
                              : const Color(0xff242424),
                          width: 1.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: Icon(Icons.keyboard_arrow_down_sharp,
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? ColorClass.primaryColor
                                : Colors.white),
                        hint: Text('Please choose a event',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: ColorClass.secondayColor)),
                        value: _selectedLocation,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLocation = newValue!;
                          });
                        },
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            value: location,
                            child: Text(
                              location,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color:
                                        AdaptiveTheme.of(context).brightness ==
                                                Brightness.light
                                            ? ColorClass.primaryColor
                                            : Colors.white,
                                  ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Set Date',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: ColorClass.secondayColor),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Container(
                      height: Get.height * 0.06,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.white
                            : ColorClass.darkScaffoldColor,
                        border: Border.all(
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? Colors.grey
                                : const Color(0xff242424),
                            width: 1.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (selectedDate != null)
                              Expanded(
                                child: Text(
                                  formatted,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            GestureDetector(
                                onTap: _selectDate,
                                child: Image.asset(
                                    AdaptiveTheme.of(context).brightness ==
                                            Brightness.light
                                        ? IconClass.calendar
                                        : 'assets/icons/calendardark.png'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: Get.height * 0.05),
                CommonButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendInvitationPage(
                          name: nameController.text,
                          email: emailController.text,
                          interest: interestController.text,
                          eventDate: selectedDate,
                        ),
                      ),
                    );
                    // if (_selectedLocation == 'Birthday') {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => SendInvitationPage(
                    //         name: nameController.text,
                    //         email: emailController.text,
                    //         interest: interestController.text,
                    //         eventDate: selectedDate,
                    //       ),
                    //     ),
                    //   );
                    // }
                  },
                  child: Text(
                    'Save and continue',
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
