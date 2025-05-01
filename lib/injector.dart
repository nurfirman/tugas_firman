import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  final sp = await SharedPreferences.getInstance();
  getIt.registerSingleton(sp);
}