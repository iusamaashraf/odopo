import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/models/wish_list_header_model.dart';
import 'package:odopa/views/pages/settings/components/animated_switch.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:odopa/views/widgets/common_field.dart';
import 'package:odopa/views/widgets/my_calendar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'components/event_field.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  int selectedIndex = 0;
  DateTime selectedDate = DateTime.now();

  final TextEditingController shortNoteController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController setReminderController = TextEditingController();
  final TextEditingController setBudgetController = TextEditingController();
  final TextEditingController chooseGiftController = TextEditingController();

  final TextEditingController notesController = TextEditingController();
  final TextEditingController hourController = TextEditingController();

  String selectedOption = '';

  void handleCheckboxChange(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  final List<String> repeatOn = [
    'Do not repear',
    'Everyday',
    'Every Week',
    'Every month',
    'Every year'
  ];
  String? selectedRepeat;

  final List<String> endsOn = [
    'After 1 minute',
    'After 15 minutes',
    'After hour',
  ];
  String? selectedEnds;
  bool isDoNotDisturb = false;
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    final String formatted = formatter.format(selectedDate);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Adaptive.px(16)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add your Special days',
              style: GoogleFonts.lato(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: List.generate(
                headerList.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      right: Adaptive.px(24), top: Adaptive.px(24)),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventField(
                  isReadOnly: true,
                  suffix: const SizedBox(),
                  controller: typeController,
                  onChanged: (value) {},
                  validator: (value) {
                    return '';
                  },
                  hintText: selectedIndex == 0
                      ? 'Birthday'
                      : selectedIndex == 1
                          ? 'Anniversary'
                          : selectedIndex == 2
                              ? 'First Meet'
                              : 'Other',
                ),
                SizedBox(height: Adaptive.px(16)),
                Container(
                  height: Get.height * 0.06,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : ColorClass.darkScaffoldColor,
                    border: Border.all(
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.grey
                            : const Color(0xff242424),
                        width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ignore: unnecessary_null_comparison
                        if (selectedDate != null)
                          Expanded(
                            child: Text(
                              formatted,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AdaptiveTheme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        GestureDetector(
                            onTap: () {
                              MyCalendarClass().customCalendar(context);
                            },
                            child: Image.asset(IconClass.calendar))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Adaptive.px(16)),
                EventField(
                  isSuffix: true,
                  suffix: GestureDetector(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return reminderPopUp(context);
                        },
                      );
                    },
                    child: Image.asset(IconClass.clock),
                  ),
                  isReadOnly: true,
                  controller: setReminderController,
                  onChanged: (value) {},
                  validator: (value) {
                    return '';
                  },
                  hintText: 'Set reminder',
                ),
                SizedBox(height: Adaptive.px(16)),
                EventField(
                  suffix: const SizedBox(),
                  controller: setBudgetController,
                  onChanged: (value) {},
                  validator: (value) {
                    return '';
                  },
                  hintText: 'Set budget',
                ),
                SizedBox(height: Adaptive.px(16)),
                EventField(
                  suffix: const SizedBox(),
                  controller: chooseGiftController,
                  onChanged: (value) {},
                  validator: (value) {
                    return '';
                  },
                  hintText: 'Choose gifts',
                ),
                SizedBox(height: Adaptive.px(16)),
                TextFormField(
                  controller: notesController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    hintText: 'Add notes',
                    hintStyle: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? ColorClass.secondayColor
                              : const Color(0xff242424),
                          width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? ColorClass.secondayColor
                              : const Color(0xff242424),
                          width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? ColorClass.secondayColor
                              : const Color(0xff242424),
                          width: 1),
                    ),
                  ),
                ),
                SizedBox(height: Adaptive.px(16)),
                CommonButton(
                    onTap: () {},
                    child: Text(
                      'Save',
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  reminderPopUp(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      content: SizedBox(
          width: Get.width,
          height: Adaptive.px(490),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? Colors.black
                          : const Color(0xffaeaeae),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Text(
                  'Add Reminder',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : const Color(0xffaeaeae),
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  'Birthday',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : const Color(0xffaeaeae),
                  ),
                ),
                const Divider(),
                // SizedBox(height: Get.height * 0.01),
                TextFormField(
                  controller: shortNoteController,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : const Color(0xffaeaeae),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Write short note',
                    hintStyle: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? Colors.black
                          : const Color(0xffaeaeae),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Row(
                  children: [
                    Image.asset(IconClass.calendar),
                    const SizedBox(width: 5),
                    Text(
                      'January 01, 2001',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : const Color(0xffaeaeae),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.close,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : const Color(0xffaeaeae),
                      ),
                    )
                  ],
                ),
                Divider(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? Colors.grey
                          : const Color(0xffaeaeae),
                ),

                SizedBox(height: Get.height * 0.02),
                Row(
                  children: [
                    Image.asset(IconClass.clock),
                    const SizedBox(width: 5),
                    Text(
                      '8.00 pm',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : const Color(0xffaeaeae),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.add,
                      color: AdaptiveTheme.of(context).brightness ==
                              Brightness.light
                          ? Colors.black
                          : const Color(0xff03f4c2),
                      size: 14,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Add more time',
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? Colors.grey
                              : const Color(0xff03f4c2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.close,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : const Color(0xff03f4c2),
                      ),
                    )
                  ],
                ),
                Divider(
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? Colors.grey
                          : const Color(0xffaeaeae),
                ),
                SizedBox(height: Get.height * 0.02),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return remindMeBfore(context);
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        IconClass.remind,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? const Color(0xff181f20)
                            : const Color(0xffaeaeae),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Remind me before',
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? Colors.black
                              : const Color(0xffaeaeae),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : const Color(0xffaeaeae),
                      )
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(height: Get.height * 0.02),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return repeatPopup(context);
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        IconClass.repeat,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? const Color(0xff181f20)
                            : const Color(0xffaeaeae),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Repeat: No repeat',
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? Colors.black
                              : const Color(0xffaeaeae),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AdaptiveTheme.of(context).brightness ==
                                  Brightness.light
                              ? Colors.black
                              : const Color(0xffaeaeae),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(height: Get.height * 0.02),
                CommonButton(
                  onTap: () {},
                  child: Text(
                    'Save',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  remindMeBfore(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      content: SizedBox(
        width: Get.width,
        height: Adaptive.px(490),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : const Color(0xff03f4c2),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Remind me before',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                  height: Adaptive.px(320),
                  child: StatefulBuilder(
                    builder: ((context, setState) => ListView(
                          children: [
                            CheckboxListTile(
                              activeColor: ColorClass.primaryColor,
                              title: Text(
                                'No advance',
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              value: selectedOption == 'No advance',
                              onChanged: (value) {
                                setState(() {
                                  handleCheckboxChange('No advance');
                                });
                              },
                            ),
                            CheckboxListTile(
                              activeColor: ColorClass.primaryColor,
                              title: Text(
                                '10 min',
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              value: selectedOption == '10 min',
                              onChanged: (value) {
                                setState(() {
                                  handleCheckboxChange('10 min');
                                });
                              },
                            ),
                            CheckboxListTile(
                              activeColor: ColorClass.primaryColor,
                              title: Text(
                                '15 min',
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              value: selectedOption == '15 min',
                              onChanged: (value) {
                                setState(() {});
                                handleCheckboxChange('15 min');
                              },
                            ),
                            CheckboxListTile(
                              activeColor: ColorClass.primaryColor,
                              title: Text(
                                '30 min',
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              value: selectedOption == '30 min',
                              onChanged: (value) {
                                setState(() {});
                                handleCheckboxChange('30 min');
                              },
                            ),
                            CheckboxListTile(
                              activeColor: ColorClass.primaryColor,
                              title: Text(
                                '1 Hr',
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              value: selectedOption == '1 Hr',
                              onChanged: (value) {
                                setState(() {});
                                handleCheckboxChange('1 Hr');
                              },
                            ),
                            CheckboxListTile(
                              activeColor: ColorClass.primaryColor,
                              title: Text(
                                'More',
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              value: selectedOption == 'More',
                              onChanged: (value) {
                                setState(() {});
                                handleCheckboxChange('More');
                              },
                            ),
                          ],
                        )),
                  )),
              SizedBox(height: Get.height * 0.04),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height * 0.07,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5),
                          backgroundColor: MaterialStateProperty.all(
                              AdaptiveTheme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.white
                                  : ColorClass.darkScaffoldColor),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color: AdaptiveTheme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorClass.primaryColor
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AdaptiveTheme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorClass.primaryColor
                                  : Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CommonButton(
                      onTap: () {},
                      child: Text(
                        'Done',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  repeatPopup(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      content: SizedBox(
        width: Get.width,
        height: Adaptive.px(490),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : const Color(0xffaeaeae),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Repeat',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: Get.height * 0.02),
              CommonField(
                isSuffix: true,
                controller: hourController,
                title: 'Every ',
                onChanged: (value) {},
                validator: (value) {
                  return '';
                },
                keyBoardType: TextInputType.number,
              ),
              // SizedBox(height: Get.height * 0.02),
              Text(
                'Repeat on',
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : const Color(0xffaeaeae),
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              StatefulBuilder(
                  builder: ((context, setState) => Container(
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
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down_sharp,
                                  color: AdaptiveTheme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorClass.primaryColor
                                      : Colors.white),
                              hint: Text('Please choose a repeat',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: AdaptiveTheme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? ColorClass.secondayColor
                                              : Colors.white)),
                              value: selectedRepeat,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedRepeat = newValue!;
                                });
                              },
                              items: repeatOn.map((location) {
                                return DropdownMenuItem(
                                  value: location,
                                  child: Text(
                                    location,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: AdaptiveTheme.of(context)
                                                      .brightness ==
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
                      ))),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Ends',
                style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : const Color(0xffaeaeae)),
              ),
              SizedBox(height: Get.height * 0.01),
              StatefulBuilder(
                  builder: ((context, setState) => Container(
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
                              hint: Text('Please choose a end',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: AdaptiveTheme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? ColorClass.secondayColor
                                              : Colors.white)),
                              value: selectedEnds,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedEnds = newValue!;
                                });
                              },
                              items: endsOn.map((location) {
                                return DropdownMenuItem(
                                  value: location,
                                  child: Text(
                                    location,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: AdaptiveTheme.of(context)
                                                      .brightness ==
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
                      ))),
              SizedBox(height: Get.height * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Do Not Disturb',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const AnimatedSwitch(),
                ],
              ),
              SizedBox(height: Get.height * 0.04),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height * 0.07,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5),
                          backgroundColor: MaterialStateProperty.all(
                              AdaptiveTheme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.white
                                  : ColorClass.darkScaffoldColor),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color: AdaptiveTheme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorClass.primaryColor
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AdaptiveTheme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorClass.primaryColor
                                  : Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CommonButton(
                      onTap: () {},
                      child: Text(
                        'Done',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
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
