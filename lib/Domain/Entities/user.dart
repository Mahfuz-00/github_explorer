import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String login;
  final String avatarUrl;
  final String name;
  final String? bio;
  final String? location;
  final String? company;
  final String? blog;
  final int publicRepos;
  final int followers;
  final int following;
  final DateTime createdAt;

  const User({
    required this.login,
    required this.avatarUrl,
    required this.name,
    this.bio,
    this.location,
    this.company,
    this.blog,
    required this.publicRepos,
    required this.followers,
    required this.following,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [login];
}