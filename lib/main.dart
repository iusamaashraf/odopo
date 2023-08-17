import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/views/pages/get_started/get_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Odopo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          titleSmall:
              GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.w700),
          // bodyText1:
          //     GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
      home: const GetStartedPage(),
    );
  }
}
