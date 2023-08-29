import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  RxBool isSubscribed = false.obs;
  subscribed() {
    isSubscribed.value = true;
  }
}
