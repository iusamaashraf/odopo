import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:odopa/constants/colors.dart';
import 'package:odopa/constants/icons.dart';
import 'package:odopa/views/widgets/auth_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Column(
            children: [
              Text(
                'Odopo',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: ColorClass.primaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: Get.height * 0.04),
              Text(
                'By creating a profile of your spouse you can easily know your partner’s wishes and get an opportunity to win his/her heart',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: Get.height * 0.04),
              Image.asset('assets/images/empty_home.png'),
              AuthButton(
                onPress: () {},
                iamge: '',
                text: 'Create profile for your spouse',
                isCircular: false,
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(IconClass.heart),
        ),
      ],
    );
  }
}
