import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'ui/login.dart';

void main() {
  runApp(SkinBalanceApp());
}

class SkinBalanceApp extends StatelessWidget {
  SkinBalanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkinBalance',
      theme: ThemeData(
        // Mengganti font bawaan Roboto menjadi Plus Jakarta Sans secara global
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Color(0xFFF7F8F6),
      ),
      home: LoginScreen(),
    );
  }
}