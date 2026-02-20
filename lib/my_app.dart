import 'package:e_commerce/bindings/bindings.dart';
import 'package:e_commerce/routs/app_routes.dart';

import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: UBindings(),
        debugShowCheckedModeBanner: false,
       themeMode: ThemeMode.system,
      theme: UAppTheme.lightTheme,
      darkTheme: UAppTheme.darkTheme,

      getPages: UAppRoutes.screens,
        home: Scaffold(
          backgroundColor: UColors.primary,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }
}
