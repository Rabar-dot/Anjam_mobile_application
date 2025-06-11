import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFFE8F5E9);
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color accentGreen = Color(0xFF69F0AE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9E9E9E);
}

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.grey,
  );
}

class RoutePaths {
  static const String splash = '/';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String patientHome = '/patient/home';
  static const String doctorHome = '/doctor/home';
  static const String receptionHome = '/reception/home';
  static const String results = '/results';
  static const String appointments = '/appointments';
  static const String profile = '/profile';
}

class AppConstants {
  static const String appName = 'Anjam Hospital';
  static const String appVersion = '1.0.0';
}