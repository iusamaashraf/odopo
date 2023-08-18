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
          const Positioned(
            bottom: 10,
            left: 20,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/Profile pic.png'),
            ),
          ),
          Positioned(
              bottom: Get.height * 0.05,
              right: 20,
              child: GestureDetector(
                  onTap: () {}, child: Image.asset('assets/icons/edit.png'))),
        ],
      ),
    );
  }
}
