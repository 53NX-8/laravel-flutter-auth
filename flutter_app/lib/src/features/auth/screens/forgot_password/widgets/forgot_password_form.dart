import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/widgets/auth_input.dart';
import 'package:flutter_app/src/features/auth/controllers/auth_controller.dart';
import 'package:flutter_app/src/utils/constants/palette.dart';
import 'package:get/get.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late final TextEditingController emailController;
  late final AuthController authController;

  @override
  void initState() {
    emailController = TextEditingController();
    authController = Get.put(AuthController());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
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
          GetBuilder<AuthController>(
              init: authController,
              builder: (controller) {
                return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          await controller
                              .forgotPassword(emailController.text.trim());
                        },
                        child: controller.isLoading
                            ? const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Palette.white,
                                ))
                            : const Text("Reset")));
              }),
        ],
      ),
    ));
  }
}
