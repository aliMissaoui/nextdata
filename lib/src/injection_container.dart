import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:nextdata/src/features/home/data/repositories/posts_repository_impl.dart';
import 'package:nextdata/src/features/home/domain/usecases/fetch_post_by_id_usecase.dart';
import 'package:nextdata/src/features/home/domain/usecases/fetch_posts_usecase.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:nextdata/src/features/home/presentation/bloc/posts_bloc.dart';
import 'features/auth/data/datasources/authentication_remote_data_source.dart';
import 'features/auth/data/repositories/authentication_repository.dart';
import 'features/auth/data/repositories/authentication_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/register_usecase.dart';
import 'core/network/network_info.dart';
import 'features/auth/presentation/bloc/authentication_bloc.dart';
import 'features/home/data/datasources/posts_remote_data_source.dart';
import 'features/home/data/repositories/posts_repository.dart';

/// [sl] is the service locator instance, which is used for dependency injection.
final sl = GetIt.instance;

/// Initializes the dependency injection system with all necessary services and repositories.
void init() {
  // Register HomeBloc with the service locator
  sl.registerFactory(() => HomeBloc());

  // Register AuthBloc with the service locator
  sl.registerFactory(() => AuthBloc(
        loginUseCase: sl(),
        registerUseCase: sl(),
      ));

  // Register use cases as lazy singletons
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // Register the authentication repository implementation
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // Register the remote data source for authentication
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: sl(), firebaseAuth: sl()),
  );

  // Register HomeBloc with the service locator
  sl.registerFactory(() => PostsBloc(
        getPostsUseCase: sl(),
        getPostByIdUseCase: sl(),
      ));

  // Register use cases as lazy singletons
  sl.registerLazySingleton(() => FetchPostsUseCase(sl()));
  sl.registerLazySingleton(() => FetchPostByIdUseCase(sl()));

  // Register the authentication repository implementation
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // Register the remote data source for authentication
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(
      dio: sl(),
      secureStorage: sl(),
    ),
  );

  // Register the network info implementation
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Register third-party services
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
