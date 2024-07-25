import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:moviemax/src/core/theme/app_theme.dart';
import 'package:moviemax/src/core/theme/cubit/theme_cubit.dart';
import 'package:moviemax/src/injector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviemax/src/presentation/cubits/movie/get_movie_credits/get_movie_credits_cubit.dart';
import 'package:moviemax/src/presentation/cubits/movie/get_popular_movies/get_popular_movies_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'src/config/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

final router = AppRouter();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setup();
  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: directory);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => injector<ThemeCubit>(),
        ),
        BlocProvider<GetMovieCreditsCubit>(
          create: (context) => injector<GetMovieCreditsCubit>(),
        ),
        BlocProvider(
            create: (_) =>
                GetIt.I<GetPopularMoviesCubit>()..getPopularMovies()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                themeMode: themeState.themeMode,
                theme: AppTheme.darkTheme,
                darkTheme: AppTheme.darkTheme,
                routerDelegate: AutoRouterDelegate(router),
                routeInformationParser: router.defaultRouteParser(),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
