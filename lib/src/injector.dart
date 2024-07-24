import 'package:get_it/get_it.dart';
import 'package:moviemax/src/core/database/local_database.dart';
import 'package:moviemax/src/core/network/dio_client.dart';
import 'package:moviemax/src/core/theme/cubit/theme_cubit.dart';
import 'package:moviemax/src/data/datasources/local/movie/movie_local_data_source.dart';
import 'package:moviemax/src/data/datasources/local/movie/movie_local_data_source_impl.dart';
import 'package:moviemax/src/data/datasources/remote/actor/actor_remote_data_source.dart';
import 'package:moviemax/src/data/datasources/remote/actor/actor_remote_data_source_impl.dart';
import 'package:moviemax/src/data/datasources/remote/movie/movie_remote_data_source.dart';
import 'package:moviemax/src/data/datasources/remote/movie/movie_remote_data_sources_impl.dart';
import 'package:moviemax/src/data/repositories/actor/actor_repository_impl.dart';
import 'package:moviemax/src/data/repositories/movie/movie_repository_impl.dart';
import 'package:moviemax/src/domain/repositories/actor/actor_repository.dart';
import 'package:moviemax/src/domain/repositories/movie/movie_repository.dart';
import 'package:moviemax/src/domain/usecases/export_usecases.dart';
import 'package:moviemax/src/presentation/cubits/movie/get_popular_movies/get_popular_movies_cubit.dart';


final injector = GetIt.instance;

Future<void> setup () async {
  // Lazy run when requested
  // without lazy run when setup runs
  // --Singleton only one instantiation (there always be one object for every request) (fits for remote, repository anything that is alike to place or tool and not a product)
  // --Factory distinct instantiation for every request (fits for entities)

  // NETWORK
  injector.registerLazySingleton<DioClient>(() => DioClient());

  // LOCAL 
  injector.registerLazySingleton<LocalDatabase>(() => LocalDatabase());

  // DATA SOURCES 
  injector.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourcesImpl(injector()));
  injector.registerLazySingleton<ActorRemoteDataSource>(() => ActorRemoteDataSourceImpl(injector()));
  injector.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl(injector()));

  // REPOSITORIES 
  injector.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(movieRemoteDataSource: injector(), movieLocalDataSource: injector()));
  injector.registerLazySingleton<ActorRepository>(() => ActorRepositoryImpl(injector()));

  // USECASES

  injector.registerLazySingleton<MovieUsecases>(() => MovieUsecases(movieRepository: injector())); // it can be automatically injected with the required params

  // CUBITS 
  injector.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  injector.registerLazySingleton<GetPopularMoviesCubit>(() => GetPopularMoviesCubit(injector()));
}