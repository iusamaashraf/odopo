import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/constants.dart';
import 'package:odopa/views/pages/get_started/get_started_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? themex;

AdaptiveThemeMode? savedThemeMode;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  savedThemeMode = await AdaptiveTheme.getThemeMode();
  if (prefs.containsKey("theme")) {
    themex = prefs.getString("theme");
  }
  print(themex);

  runApp(
    Phoenix(
      child: MyApp(),
    ),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => Phoenix(
    //     child: MyApp(),
    //   ), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
        // statusBarColor: AdaptiveTheme.of(context).brightness == Brightness.light
        //     ? Colors.transparent
        //     : const Color(0xff141416),
        ));
    return AdaptiveTheme(
      light: lighttheme,
      dark: darktheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) =>
          ResponsiveSizer(builder: (context, orientation, screenType) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,

          theme: theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: const GetStartedPage(),
          // home: Circle(),
        );
      }),
    );
    // return ResponsiveSizer(builder: (context, orientation, screenType) {
    //   return GetMaterialApp(
    //     title: 'Odopo',
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       fontFamily: 'Lato',
    //     ),
    //     home: const GetStartedPage(),
    //   );
    // });
  }
}
