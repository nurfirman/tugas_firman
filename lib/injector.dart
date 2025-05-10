import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_firman/bloc/theme_local_storage.dart';
import 'package:tugas_firman/db/app_db.dart';
import 'package:tugas_firman/db/auth_local_storage.dart';
import 'package:tugas_firman/db/remote_data/auth_remote_data.dart';
import 'package:tugas_firman/db/remote_data/network_service/network_service.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  await hiveInjector();
  localStorageInjector(); 
  networkInjector();
  getIt.registerSingleton(AppDatabase());
  final sp = await SharedPreferences.getInstance();
  getIt.registerSingleton(sp);
  
}

Future<void> hiveInjector() async {
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  var box = await Hive.openBox('app');
  getIt.registerSingleton<Box>(box);
}

void localStorageInjector() {
  getIt.registerSingleton(AuthLocalStorage(getIt.get<Box>()));
    getIt.registerSingleton(ThemeLocalStorage(getIt.get<Box>()));
}

void networkInjector() {
  final networkService = NetworkService(
    getIt.get<AuthLocalStorage>()
  );
  getIt.registerSingleton(networkService);
  getIt.registerSingleton<AuthRemoteData>(AuthRemoteData(networkService, baseUrl: 'https://test.dooski.id'),);
}