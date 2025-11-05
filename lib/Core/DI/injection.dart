import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Common/Services/dio_client.dart';
import '../../Data/Repositories/github_repo_impl.dart';
import '../../Data/Sources/Remote/github_api.dart';
import '../../Domain/Repositories/github_repository.dart';
import '../../Domain/Usecases/get_user.dart';
import '../../Domain/Usecases/get_user_repos.dart';
import '../../Presentation/Bloc/Repos/repo_bloc.dart';
import '../../Presentation/Bloc/Theme/theme_bloc.dart';
import '../../Presentation/Bloc/User/user_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => DioClient.create());

  //Theme
  sl.registerFactory(() => ThemeBloc());

  // API
  sl.registerLazySingleton<GitHubApi>(() => GitHubApi(sl<Dio>()));

  // Repositories
  sl.registerLazySingleton<GitHubRepository>(() => GitHubRepoImpl(sl<GitHubApi>()));

  // Usecases
  sl.registerLazySingleton(() => GetUser(sl<GitHubRepository>()));
  sl.registerLazySingleton(() => GetUserRepos(sl<GitHubRepository>()));

  // Blocs
  sl.registerFactory(() => UserBloc(sl<GetUser>()));
  sl.registerFactory(() => ReposBloc(sl<GetUserRepos>()));
}