import 'package:flutter/material.dart';

ThemeData darkTheme() {
  TextTheme basicTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge!.copyWith(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato',
        color: Colors.white,
      ),
      titleLarge: base.titleLarge!.copyWith(
        fontSize: 23.0,
        fontFamily: 'Lato',
      ),
      bodyMedium: base.bodyMedium!.copyWith(
          fontSize: 16.0,
          fontFamily: 'Lato',
          color: const Color(0xFF16042E)
      ),
      headlineMedium: base.headlineMedium!.copyWith(
          fontSize: 18.0,
          fontFamily: 'Lato',
          color: const Color(0xFF16042E)
      ),
      headlineSmall: base.headlineSmall!.copyWith(
        fontSize: 18.0,
        fontFamily: 'Lato',
        color: Colors.deepPurple[50],
        //buttons
      ),
      bodySmall: base.bodySmall!.copyWith(
        fontSize: 12.0,
        fontFamily: 'Lato',
      ),
      bodyLarge: base.bodyLarge!.copyWith(
        color: Colors.deepPurple[300],
        fontSize: 14,
      ),
    );
  }

  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      appBarTheme: const AppBarTheme(color: Color(0xFF16042E),),
      scaffoldBackgroundColor: const Color(0xFF16042E),
      elevatedButtonTheme:  ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
              backgroundColor:  const Color(0xFF250C46),
              foregroundColor: Colors.white)
      ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color(0xFF16042E))
  );
}