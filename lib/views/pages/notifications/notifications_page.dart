import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odopa/models/notifications_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Adaptive.px(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Adaptive.px(37)),
          Text(
            'Today',
            style: GoogleFonts.lato(
              fontSize: Adaptive.px(18),
              color: AdaptiveTheme.of(context).brightness == Brightness.light
                  ? const Color(0xff181F20)
                  : Colors.white,
            ),
          ),
          SizedBox(
            height: Adaptive.px(16),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notificationsList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: Adaptive.px(30),
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                              getStatus(notificationsList[index].status)),
                        ),
                        SizedBox(width: Adaptive.px(12)),
                        SizedBox(
                          width: Get.width * 0.72,
                          child: Text(
                            notificationsList[index].title,
                            style: GoogleFonts.lato(
                                color: AdaptiveTheme.of(context).brightness ==
                                        Brightness.light
                                    ? const Color(0xff181F20)
                                    : Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                        color: AdaptiveTheme.of(context).brightness ==
                                Brightness.light
                            ? Colors.grey
                            : Colors.grey.shade700),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String getStatus(NotificationStatus status) {
    switch (status) {
      case NotificationStatus.accept:
        return 'assets/images/girl.png';
      case NotificationStatus.reminder:
        return 'assets/icons/reminder.png';
      case NotificationStatus.share:
        return 'assets/images/girl.png';

      default:
        return 'assets/images/girl.png'; // Default color
    }
  }
}
