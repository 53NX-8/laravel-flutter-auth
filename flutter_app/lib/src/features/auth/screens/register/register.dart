import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/widgets/auth_footer.dart';
import 'package:flutter_app/src/common/widgets/auth_header.dart';
import 'package:flutter_app/src/features/auth/screens/login/login.dart';
import 'package:flutter_app/src/features/auth/screens/register/widgets/register_form.dart';
import 'package:flutter_app/src/utils/constants/palette.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    title: "Create an account",
                    subtitle: "Enter your information to create your account"),
                const SizedBox(
                  height: 20,
                ),
                const RegisterForm(),
                const SizedBox(
                  height: 20,
                ),
                AuthFooter(
                    helper: "Already a member ?  ",
                    link: "Login",
                    onTap: () => Get.to(() => const LoginScreen()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
