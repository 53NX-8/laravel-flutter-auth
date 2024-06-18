import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/widgets/auth_input.dart';
import 'package:flutter_app/src/features/auth/controllers/auth_controller.dart';
import 'package:flutter_app/src/utils/constants/palette.dart';
import 'package:get/get.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController nameController;
  late final AuthController authController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    authController = Get.put(AuthController());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          AuthInput(
            controller: nameController,
            prefixIcon: const Icon(Icons.person),
            label: 'Name',
          ),
          const SizedBox(
            height: 20,
          ),
          AuthInput(
            controller: emailController,
            prefixIcon: const Icon(Icons.email),
            label: 'Email',
          ),
          const SizedBox(
            height: 20,
          ),
          AuthInput(
            controller: passwordController,
            prefixIcon: const Icon(Icons.key),
            label: 'Password',
          ),
          const SizedBox(
            height: 30,
          ),
          GetBuilder<AuthController>(
              init: authController,
              builder: (controller) {
                return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          await controller.register(
                            emailController.text.trim(),
                            nameController.text.trim(),
                            passwordController.text.trim(),
                          );
                        },
                        child: controller.isLoading
                            ? const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Palette.white,
                                ))
                            : const Text("Create an account")));
              }),
        ],
      ),
    ));
  }
}
