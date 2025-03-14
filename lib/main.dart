import 'package:flutter/material.dart';

import 'screens/Features/main_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // lw el mobile dark mood el app hyb2a kda
      initialRoute: MainScreen.routeName,
      routes: {

        MainScreen.routeName: (_) => MainScreen(),
    },
    );

  }
}
