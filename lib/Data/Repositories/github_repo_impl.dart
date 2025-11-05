import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../Data/Models/repo_model.dart';
import '../../Data/Models/user_model.dart';
import '../../Domain/Repositories/github_repository.dart';
import '../../Common/Error/failure.dart';
import '../../Domain/Entities/repo.dart';
import '../../Domain/Entities/user.dart';
import '../Sources/Remote/github_api.dart';

class GitHubRepoImpl implements GitHubRepository {
  final GitHubApi api;

  GitHubRepoImpl(this.api);

  @override
  Future<Either<Failure, User>> getUser(String username) async {
    try {
      final model = await api.fetchUser(username);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(_handleError(e));
    }
  }

  @override
  Future<Either<Failure, List<Repo>>> getUserRepos(String username) async {
    try {
      final models = await api.fetchUserRepos(username);
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(_handleError(e));
    }
  }

  Failure _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return NetworkFailure();
    }
    if (e.response?.statusCode == 404) {
      return NotFoundFailure();
    }
    return ServerFailure();
  }
}