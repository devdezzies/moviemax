import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:moviemax/src/injector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/config/router/app_router.dart';

final router = AppRouter();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          //themeMode: themeState.themeMode,
          //theme: AppTheme.lightTheme,
          //darkTheme: AppTheme.darkTheme,
          routerDelegate: AutoRouterDelegate(router),
          routeInformationParser: router.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
