import 'package:flutter/material.dart';
import 'package:flutter_bloc_tdd/core/res/colours.dart';
import 'package:flutter_bloc_tdd/core/res/fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colours.primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        fontFamily: Fonts.poppins,
      ),
    );
  }
}
