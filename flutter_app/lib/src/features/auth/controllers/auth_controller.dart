import 'package:flutter_app/src/features/auth/screens/login/login.dart';
import 'package:flutter_app/src/features/core/screens/home/home.dart';
import 'package:flutter_app/src/services/api_service.dart';
import 'package:flutter_app/src/utils/constants/palette.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class AuthController extends GetxController {
  bool isLoading = false;
  var logger = Logger();
  final deviceStorage = GetStorage();

  final ApiService _apiService =
      ApiService(baseUrl: 'http://localhost:8000/api');

  void responseLoad() {
    isLoading = !isLoading;
    update();
  }

  Future<void> register(String email, String name, String password) async {
    responseLoad();
    try {
      final response = await _apiService.post(
        '/register',
        {'email': email, 'name': name, 'password': password},
      );
      if (response['success'] == true) {
        Get.snackbar(
          'Success',
          'Welcome',
          backgroundColor: Palette.success,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(0),
          duration: const Duration(seconds: 8),
          borderRadius: 0,
        );
        var token = response['token'];
        var user = response['user'];
        deviceStorage.write('token', token);
        deviceStorage.write('user', user);
        Get.offAll(
          () => const HomeScreen(),
        );
      } else {
        Get.snackbar(
          'Error',
          response['message'],
          backgroundColor: Palette.error,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(0),
          duration: const Duration(seconds: 8),
          borderRadius: 0,
        );
      }
    } catch (e) {
      logger.e(e.toString());
    } finally {
      responseLoad();
    }
  }

  Future<void> login(String email, String password) async {
    responseLoad();
    try {
      final response = await _apiService.post(
        '/login',
        {'email': email, 'password': password},
      );
      if (response['success'] == true) {
        Get.snackbar(
          'Welcome',
          'You\'re now logged in!',
          backgroundColor: Palette.success,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(0),
          duration: const Duration(seconds: 8),
          borderRadius: 0,
        );
        var token = response['token'];
        var user = response['user'];
        deviceStorage.write('token', token);
        deviceStorage.write('user', user);
        Get.offAll(
          () => const HomeScreen(),
        );
      } else {
        Get.snackbar(
          'Error',
          response['message'],
          backgroundColor: Palette.error,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(0),
          duration: const Duration(seconds: 8),
          borderRadius: 0,
        );
      }
    } catch (e) {
      logger.e(e.toString());
    } finally {
      responseLoad();
    }
  }

  Future<void> forgotPassword(String email) async {
    responseLoad();
    try {} catch (e) {
    } finally {
      responseLoad();
    }
  }

  Future<void> logout() async {
    responseLoad();
    try {
      await deviceStorage.remove("token");
      await deviceStorage.remove("user");
      if (!deviceStorage.hasData("token") && !deviceStorage.hasData("user")) {
        Get.snackbar(
          'Success',
          'You are logged out',
          backgroundColor: Palette.grey8,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(0),
          duration: const Duration(seconds: 8),
          borderRadius: 0,
        );

        Get.offAll(
          () => const LoginScreen(),
        );
      } else {
        Get.snackbar(
          'Error',
          'Something went wrong!',
          backgroundColor: Palette.error,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(0),
          duration: const Duration(seconds: 8),
          borderRadius: 0,
        );
      }
    } catch (e) {
      logger.e(e.toString());
    } finally {
      responseLoad();
    }
  }
}
