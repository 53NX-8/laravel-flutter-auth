import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/widgets/auth_footer.dart';
import 'package:flutter_app/src/common/widgets/auth_header.dart';
import 'package:flutter_app/src/features/auth/screens/login/widgets/login_form.dart';
import 'package:flutter_app/src/features/auth/screens/register/register.dart';
import 'package:flutter_app/src/utils/constants/palette.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    title: "Login",
                    subtitle: "Enter your credentials to login"),
                const SizedBox(
                  height: 20,
                ),
                const LoginForm(),
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
