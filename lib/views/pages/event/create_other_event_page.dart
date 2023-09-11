import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:odopa/views/widgets/common_field.dart';

class CreateOtherEventPage extends StatefulWidget {
  const CreateOtherEventPage({super.key});

  @override
  State<CreateOtherEventPage> createState() => _CreateOtherEventPageState();
}

class _CreateOtherEventPageState extends State<CreateOtherEventPage> {
  final TextEditingController eventController = TextEditingController();
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
          'New event',
          style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(IconClass.event),
            const Spacer(),
            CommonField(
              controller: eventController,
              title: 'Event name',
              onChanged: (value) {},
              validator: (value) {
                return '';
              },
              keyBoardType: TextInputType.name,
            ),
            SizedBox(height: Get.height * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Event date',
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
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
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
                            child: Image.asset(IconClass.calendar))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
            CommonButton(
                onTap: () {},
                child: Text(
                  'Add event',
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
