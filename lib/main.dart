import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'my_app.dart';

void main() {

  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Flutter Native splash
 // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}


