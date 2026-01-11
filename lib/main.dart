import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'my_app.dart';

void main() {

  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Flutter Native splash
 // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}


