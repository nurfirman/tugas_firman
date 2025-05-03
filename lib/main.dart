import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_firman/bloc/auth/auth_cubit.dart';
import 'package:tugas_firman/bloc/routes.dart';
import 'package:tugas_firman/bloc/theme_cubit.dart';
import 'package:tugas_firman/db/auth_local_storage.dart';
import 'package:tugas_firman/db/remote_data/auth_remote_data.dart';
import 'package:tugas_firman/injector.dart';
import 'package:tugas_firman/theme/dark_theme.dart';
import 'package:tugas_firman/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(
          getIt.get<AuthLocalStorage>(),
          getIt.get<AuthRemoteData>(),
        )),
        BlocProvider(
          create: (context) => ThemeCubit(
            getIt.get()
          )..init(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Flutter FInal Project',
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: lightTheme(context),
            darkTheme: darkTheme(context),
            initialRoute: AppRoutes.splash,
            routes: routes,
          );
        }
      ),
    );
  }
}
