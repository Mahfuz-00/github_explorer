import 'package:dartz/dartz.dart';

import '../../Common/Error/failure.dart';
import '../Entities/user.dart';
import '../Repositories/github_repository.dart';

class GetUser {
  final GitHubRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, User>> call(String username) {
    return repository.getUser(username);
  }
}