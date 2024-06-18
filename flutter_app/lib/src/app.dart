import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/constants/palette.dart';
import 'package:flutter_app/src/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        title: 'Flutter-Laravel-Starter',
        home: const Scaffold(
            backgroundColor: Palette.white,
            body: Center(
                child: CircularProgressIndicator(color: Palette.grey8))));
  }
}
