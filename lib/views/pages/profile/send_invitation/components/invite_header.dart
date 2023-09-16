import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InviteHeader extends StatelessWidget {
  const InviteHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.4,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Cover photo.png',
            fit: BoxFit.cover,
            height: Adaptive.px(226),
            width: Get.width,
          ),
          Positioned(
            top: Adaptive.px(172),
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 60,
              child: Image.asset('assets/images/Profile pic.png'),
            ),
          ),
        ],
      ),
    );
  }
}
