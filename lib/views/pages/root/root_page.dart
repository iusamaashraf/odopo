import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/controllers/subscription_controller.dart';
import 'package:odopa/views/pages/checkout/checkout_page.dart';
import 'package:odopa/views/pages/event/create_event_page.dart';
import 'package:odopa/views/pages/history/history_page.dart';
import 'package:odopa/views/pages/home/home_page.dart';
import 'package:odopa/views/pages/notifications/notifications_page.dart';
import 'package:odopa/views/pages/profile/profile_page.dart';
import 'package:odopa/views/pages/remainder/remainder_page.dart';
import 'package:odopa/views/pages/settings/settings_page.dart';
import 'package:odopa/views/pages/shop/shop_page.dart';
import 'package:odopa/views/pages/terms_and_conditions/terms_and_conditions_page.dart';
import 'package:odopa/views/pages/tracking/tracking_page.dart';
import 'package:odopa/views/pages/wishlist/wishlist_page.dart';
import 'package:odopa/views/widgets/common_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final SubscriptionController subscriptionController =
      Get.put(SubscriptionController());
  int selectedpage = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _pages = [
    const HomePage(),
    const WishListPage(),
    const CreateEventPage(),
    const ShopPage(),
    const NotificationsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      appBar: AppBar(
        backgroundColor:
            AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.white
                : ColorClass.darkScaffoldColor,
        leading: Builder(builder: (BuildContext context) {
          return PopupMenuButton<String>(
            color: AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.white
                : ColorClass.darkScaffoldColor,
            icon: Padding(
              padding: EdgeInsets.only(left: Adaptive.px(0)),
              child: SvgPicture.asset(
                IconClass.drawer,
                color: AdaptiveTheme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            onSelected: (value) {
              if (value == "item1") {
                Navigator.pop(context);
                Get.to(() => const SettingsPage());
              } else if (value == "item2") {
                Navigator.pop(context);
                Get.to(() => const HistoryPage());
              } else if (value == "item3") {
                Navigator.pop(context);
                Get.to(() => const RemainderPage());
              } else if (value == "item4") {
                Navigator.pop(context);
                Get.to(() => const TrackingPage());
              } else if (value == "item5") {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return subscriptionPopUp(context);
                  },
                );
                // subscriptionPopUp(context);
              } else {
                Navigator.pop(context);
                Get.to(() => const TermsAndConditionsPage());
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: "item1",
                  child: Text(
                    "Settings",
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
                PopupMenuItem<String>(
                  value: "item2",
                  child: Text(
                    "History",
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
                PopupMenuItem<String>(
                  value: "item3",
                  child: Text(
                    "Reminder",
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: "item4",
                  child: RowData(
                    title: 'Order tracking',
                  ),
                ),
                // PopupMenuItem<String>(
                //   value: "item5",
                //   // child: RowData(
                //   //   title: 'Remove ads',
                //   // ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Remove ads',
                //         style: GoogleFonts.lato(
                //             fontSize: 16, fontWeight: FontWeight.w400),
                //       ),
                //       subscriptionController.isSubscribed.value
                //           ? const Icon(
                //               Icons.abc_outlined,
                //               color: ColorClass.primaryColor,
                //             )
                //           : Image.asset(IconClass.lock),
                //     ],
                //   ),
                // ),
                // const PopupMenuItem<String>(
                //   value: "item6",
                //   child: RowData(
                //     title: 'Get discount',
                //   ),
                // ),
                PopupMenuItem<String>(
                  value: "item7",
                  child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Terms and condition',
                        style: GoogleFonts.lato(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                ),
              ];
            },
          );
        }),
        iconTheme: const IconThemeData(color: ColorClass.secondayColor),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () => Get.to(() => const ProfilePage()),
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
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        activeColor: AdaptiveTheme.of(context).brightness == Brightness.light
            ? const Color(0xff004E52)
            : ColorClass.primaryColor,
        backgroundColor:
            AdaptiveTheme.of(context).brightness == Brightness.light
                ? Colors.white
                : const Color(0xff141819),
        elevation: 20,
        color: const Color(0xff005456),
        height: 70,
        shadowColor: Colors.black12,
        curveSize: 95,
        items: [
          TabItem(
            icon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: SvgPicture.asset(IconClass.inactiveHome, height: 20),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(0.0),
              child: SvgPicture.asset(IconClass.home, height: 20),
            ),
            title: 'Home',
          ),
          TabItem(
            icon: SvgPicture.asset(IconClass.wishlist),
            activeIcon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: SvgPicture.asset(IconClass.activeWishlist),
            ),
            title: 'Wishlist',
          ),
          const TabItem(
              icon: Icon(Icons.add, size: 29, color: Colors.white),
              title: 'Create Event'),
          TabItem(
            icon: SvgPicture.asset(IconClass.shop),
            activeIcon: SvgPicture.asset(
              IconClass.shop,
              color: ColorClass.primaryColor,
            ),
            title: 'Shop',
          ),
          TabItem(
              icon: SvgPicture.asset(IconClass.notification),
              activeIcon: SvgPicture.asset(IconClass.inactiveNotification),
              title: 'Notification'),
        ],
        initialActiveIndex: selectedpage,
        onTap: (int index) {
          setState(() {
            selectedpage = index;
          });
        },
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _pages[selectedpage]),
          ],
        ),
      ),
    );
  }

  subscriptionPopUp(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: AdaptiveTheme.of(context).brightness == Brightness.light
          ? Colors.white
          : ColorClass.darkScaffoldColor,
      content: SizedBox(
        width: Adaptive.px(343),
        height: Adaptive.px(360),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                  },
                ),
              ],
            ),
            // SizedBox(height: Adaptive.px(25)),
            Text('Subscription',
                style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color:
                        AdaptiveTheme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white)),
            SizedBox(height: Adaptive.px(34)),
            Container(
              width: Get.width,
              height: Adaptive.px(76),
              color: const Color(0xff04f4c2),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: '\$100',
                          style: GoogleFonts.lato(
                            fontSize: 32,
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? const Color(0xff004E52)
                                : const Color(0xff1b1d1d),
                            fontWeight: FontWeight.w500,
                          )),
                      TextSpan(
                          text: '/month',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: AdaptiveTheme.of(context).brightness ==
                                    Brightness.light
                                ? const Color(0xff004E52)
                                : const Color(0xff1b1d1d),
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Adaptive.px(32)),
            Text(
              "To remove add you need to subscribe.After the subscription you can continue your app without any hassle. ",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:
                      AdaptiveTheme.of(context).brightness == Brightness.light
                          ? const Color(0xff5d5d5d)
                          : const Color(0xffaeaeae)),
            ),
            SizedBox(height: Adaptive.px(24)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonButton(
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(() => const CheckoutPage());
                  },
                  child: Text(
                    'Subscribe',
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class RowData extends StatelessWidget {
  const RowData({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white),
        ),
        // Image.asset(IconClass.lock),
      ],
    );
  }
}
