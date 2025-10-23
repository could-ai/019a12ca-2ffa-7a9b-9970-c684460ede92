import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:couldai_user_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirstCredi.EI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0A192F),
        scaffoldBackgroundColor: const Color(0xFF0A192F),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00AFFF), // Electric Blue/Cyan
          secondary: Color(0xFFF7B500), // Gold accent
          background: Color(0xFF0A192F), // Deep Navy Blue
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onBackground: Colors.white,
          surface: Color(0xFF172A45), // Charcoal Grey for surfaces
          onSurface: Colors.white,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF172A45),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: const Color(0xFF00AFFF),
          inactiveTrackColor: const Color(0xFF172A45),
          thumbColor: const Color(0xFF00AFFF),
          overlayColor: const Color(0xFF00AFFF).withAlpha(60),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A192F),
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
