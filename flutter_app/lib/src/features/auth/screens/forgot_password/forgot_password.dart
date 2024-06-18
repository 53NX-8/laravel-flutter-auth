import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/widgets/auth_footer.dart';
import 'package:flutter_app/src/common/widgets/auth_header.dart';
import 'package:flutter_app/src/features/auth/screens/forgot_password/widgets/forgot_password_form.dart';
import 'package:flutter_app/src/features/auth/screens/register/register.dart';
import 'package:flutter_app/src/utils/constants/palette.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const AuthHeader(
                    title: "Forgot your password?",
                    subtitle: "Drop your email to reset your password."),
                const SizedBox(
                  height: 20,
                ),
                const ForgotPasswordForm(),
                const SizedBox(
                  height: 20,
                ),
                AuthFooter(
                    helper: "Don't have account yet ?  ",
                    link: "Register",
                    onTap: () => Get.to(() => const RegisterScreen()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
