import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/views/pages/event/create_event_page.dart';
import 'package:odopa/views/pages/home/home_page.dart';
import 'package:odopa/views/pages/notifications/notifications_page.dart';
import 'package:odopa/views/pages/shop/shop_page.dart';
import 'package:odopa/views/pages/wishlist/wishlist_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedpage = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _pages = [
    HomePage(),
    WishListPage(),
    CreateEventPage(),
    ShopPage(),
    NotificationsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => _key.currentState!.openDrawer(),
            icon: SvgPicture.asset(IconClass.drawer)),
        iconTheme: const IconThemeData(color: ColorClass.primaryColor),
        elevation: 0,
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
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        activeColor: ColorClass.primaryColor,
        backgroundColor: Colors.white,
        elevation: 10,
        color: Colors.grey,
        height: 70,
        shadowColor: Colors.black12,
        curveSize: 95,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.favorite, title: 'Wishlist'),
          TabItem(
              icon: Icon(Icons.add, size: 29, color: Colors.white),
              title: 'Create Event'),
          TabItem(icon: Icons.shop, title: 'Shop'),
          TabItem(icon: Icons.notification_add, title: 'Notification'),
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
          children: [
            Expanded(child: _pages[selectedpage]),
          ],
        ),
      ),
    );
  }
}
