import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
    static final theme =  ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF781CAD),
          primary: const Color(0xFF781CAD),
          secondary: const Color(0xFF1A0029),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
            
        ),
  
      
    );

    ThemeData customFontTheme(TextTheme textTheme) {
        return theme.copyWith(
          textTheme: textTheme.copyWith(
            bodyMedium: GoogleFonts.gabarito(
              fontSize: 16,
              color: Colors.black
            ),
            headlineMedium: GoogleFonts.lora(
              textStyle: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
             headlineSmall: GoogleFonts.lora(
              textStyle: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            titleLarge: GoogleFonts.lora(
              textStyle: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            titleSmall: GoogleFonts.lora(
              textStyle: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            
          )
        );
    }
}

class DarkAppTheme extends AppTheme{
  static final theme =  ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF781CAD),
          primary: Colors.red,
          secondary: const Color(0xFF1A0029),
          onPrimary: Colors.red,
          onSecondary: Colors.red,
          onSurface: Colors.red,
          background: Colors.black    
        ),
    );
}
ThemeData fontTheme() {
  final theme = AppTheme();
  return theme.customFontTheme(GoogleFonts.gabaritoTextTheme(AppTheme.theme.textTheme));
}


ThemeData fontThemeDark() {
  final theme = DarkAppTheme();
  return theme.customFontTheme(GoogleFonts.gabaritoTextTheme(AppTheme.theme.textTheme));
}

