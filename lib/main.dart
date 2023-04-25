
import 'package:expense_tracker/expenses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const  Color.fromARGB(19, 237, 122, 212));
var kDarkColorscheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn){
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorscheme,
    ),
    theme: ThemeData().copyWith(useMaterial3: true,
    colorScheme: kColorScheme,
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.onPrimaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
      color: kColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
        foregroundColor: kDarkColorscheme.onPrimaryContainer,
      )
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: const TextStyle(fontWeight: FontWeight.normal,
      color: Colors.red,fontSize: 14)
    )
   ),   
    themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
  // });
}

