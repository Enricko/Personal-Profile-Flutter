import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  final controller = ValueNotifier<bool>(false).obs;

  @override
  void onInit() {
    super.onInit();
    if (GetStorage().read("isDarkMode") != null) {
      isDarkMode.value = GetStorage().read("isDarkMode");
      controller.value.value = GetStorage().read("isDarkMode");
    }
    controller.value.addListener(() {
      isDarkMode.value = controller.value.value;

      GetStorage().write("isDarkMode", isDarkMode.value);
      Get.changeThemeMode(GetStorage().read("isDarkMode") ? ThemeMode.dark : ThemeMode.light);
    });
  }

  @override
  void onClose() {
    super.onClose();
    // controller.value.dispose();
  }
}
