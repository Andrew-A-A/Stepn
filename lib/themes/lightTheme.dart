import 'package:flutter/material.dart';

ThemeData lightTheme() {
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

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: basicTextTheme(base.textTheme),
  primaryColor: Colors.deepPurple[300],
 // scaffoldBackgroundColor: Color(0xFFD8CCE7),
  secondaryHeaderColor: Colors.deepPurple[300],
  iconTheme: IconThemeData(
  color: Colors.deepPurple[300],
  size: 20.0,
  ),
  buttonTheme: ButtonThemeData(
  buttonColor: Colors.deepPurple[300],
  shape:  const RoundedRectangleBorder(),
  textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme:  ElevatedButtonThemeData(
      style:ElevatedButton.styleFrom(
          backgroundColor:  const Color(0xFFEADDFF),
      foregroundColor: Colors.black)
  ),
  sliderTheme: SliderThemeData(
  activeTrackColor: Colors.deepPurple[300],
  overlayColor: Colors.deepPurple[300]?.withAlpha(32),
  thumbColor: Colors.deepPurple[300],
  )
  );
}