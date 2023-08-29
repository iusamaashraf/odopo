import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odopa/models/notifications_model.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: notificationsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                              getStatus(notificationsList[index].status)),
                        ),
                        SizedBox(width: Get.width * 0.02),
                        SizedBox(
                            width: Get.width * 0.75,
                            child: Text(notificationsList[index].title)),
                      ],
                    ),
                    const Divider(color: Colors.grey),
                  ],
                ),
              );
            },
          ),
        ),
      ],
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
