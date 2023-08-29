enum NotificationStatus {
  accept,
  reminder,
  share,
}

class NotificationsModel {
  String title;
  NotificationStatus status;
  NotificationsModel({
    required this.status,
    required this.title,
  });
}

List<NotificationsModel> notificationsList = [
  NotificationsModel(
    status: NotificationStatus.accept,
    title: 'Julie just accepted your invitation',
  ),
  NotificationsModel(
    status: NotificationStatus.reminder,
    title: 'Reminder for your next celebration. please check here',
  ),
  NotificationsModel(
    status: NotificationStatus.share,
    title: 'Julie share her Wishlist for Anniversary',
  ),
  NotificationsModel(
    status: NotificationStatus.reminder,
    title: 'Reminder for your next celebration. please check here',
  ),
];
