import 'package:flutter_app/src/features/auth/screens/login/login.dart';
import 'package:flutter_app/src/features/core/screens/home/home.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class InitialRepository extends GetxController {
  static InitialRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.read('token') != null
        ? Get.offAll(() => const HomeScreen())
        : Get.offAll(() => const LoginScreen());
  }
}
