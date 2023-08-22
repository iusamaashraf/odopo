import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            width: Get.width,
          ),
          Positioned(
            bottom: 10,
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
