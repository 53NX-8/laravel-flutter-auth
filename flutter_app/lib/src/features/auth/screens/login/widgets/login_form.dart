import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/widgets/auth_input.dart';
import 'package:flutter_app/src/features/auth/controllers/auth_controller.dart';
import 'package:flutter_app/src/features/auth/screens/forgot_password/forgot_password.dart';
import 'package:flutter_app/src/utils/constants/palette.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final AuthController authController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    authController = Get.put(AuthController());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
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
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => Get.to(const ForgotPasswordScreen()),
                  child: Text(
                    "Forgot password?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(decoration: TextDecoration.underline),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<AuthController>(
              init: authController,
              builder: (controller) {
                return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          await controller.login(emailController.text.trim(),
                              passwordController.text.trim());
                        },
                        child: controller.isLoading
                            ? const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Palette.white,
                                ))
                            : const Text("Log in")));
              }),
        ],
      ),
    ));
  }
}
