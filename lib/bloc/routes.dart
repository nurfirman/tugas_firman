
import 'package:tugas_firman/pages/absensi_page.dart';
import 'package:tugas_firman/pages/home_page.dart';
import 'package:tugas_firman/pages/login_page.dart';
import 'package:tugas_firman/pages/splash_screen.dart';

class AppRoutes {
  static String get home => "/home";
  static String get absensi => "/absensi";
  static String get login => "/login";
  static String get splash => "/splash";
}

final routes = {
  AppRoutes.splash: (context) => const SplashScreen(),
  AppRoutes.home: (context) => const HomePage(),
  AppRoutes.absensi: (context) => const AbsensiPage(),
  AppRoutes.login: (context) => const LoginPage(),
};