import 'package:equatable/equatable.dart';

class Repo extends Equatable {
  final int id;
  final String name;
  final String fullName;
  final String? description;
  final String? language;
  final int stargazersCount;
  final int forksCount;
  final int openIssuesCount;
  final int watchersCount;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;
  final String htmlUrl;
  final String ownerLogin;
  final String ownerAvatar;
  final bool isPrivate;
  final bool isFork;
  final num? size; // KB

  const Repo({
    required this.id,
    required this.name,
    required this.fullName,
    this.description,
    this.language,
    required this.stargazersCount,
    required this.forksCount,
    required this.openIssuesCount,
    required this.watchersCount,
    required this.createdAt,
    this.updatedAt,
    this.pushedAt,
    required this.htmlUrl,
    required this.ownerLogin,
    required this.ownerAvatar,
    required this.isPrivate,
    required this.isFork,
    this.size,
  });

  @override
  List<Object?> get props => [id];
}