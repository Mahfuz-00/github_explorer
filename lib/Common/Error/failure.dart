abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure() : super('Server error. Please try again.');
}

class NotFoundFailure extends Failure {
  NotFoundFailure() : super('User not found.');
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('No internet connection.');
}