import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fourth_flutter/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(212, 185, 248, 175),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(212, 32, 57, 32),
);

void main() {
  /*
  // 锁定代码的转换方向
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    fn,
  ) {

  });*/

  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
        // scaffoldBackgroundColor: Colors.orange,
      ),
      themeMode: ThemeMode.system, // 默认模式
      home: Expenses(),
    ),
  );
}
