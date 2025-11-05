import 'package:dartz/dartz.dart';

import '../../Common/Error/failure.dart';
import '../Entities/repo.dart';
import '../Entities/user.dart';

abstract class GitHubRepository {
  Future<Either<Failure, User>> getUser(String username);
  Future<Either<Failure, List<Repo>>> getUserRepos(String username);
}