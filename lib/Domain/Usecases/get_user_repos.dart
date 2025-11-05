import 'package:dartz/dartz.dart';
import '../../Common/Error/failure.dart';
import '../Entities/repo.dart';
import '../Repositories/github_repository.dart';

class GetUserRepos {
  final GitHubRepository repository;

  GetUserRepos(this.repository);

  Future<Either<Failure, List<Repo>>> call(String username) {
    return repository.getUserRepos(username);
  }
}