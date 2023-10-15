import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/app.dart';
import 'package:weteam/src/binding/init_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0.0),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData()),
      home: const App(),
      initialBinding: InitBinding(),
    );
  }
}
