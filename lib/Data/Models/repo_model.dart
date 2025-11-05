import 'package:freezed_annotation/freezed_annotation.dart';
import '../../Domain/Entities/repo.dart';

part 'repo_model.freezed.dart';
part 'repo_model.g.dart';

@freezed
class RepoModel with _$RepoModel {
  const factory RepoModel({
    required int id,
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required String? description,
    required String? language,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(name: 'forks_count') required int forksCount,
    @JsonKey(name: 'open_issues_count') required int openIssuesCount,
    @JsonKey(name: 'watchers_count') required int watchersCount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @JsonKey(name: 'pushed_at') required DateTime? pushedAt,
    @JsonKey(name: 'html_url') required String htmlUrl,
    required Map<String, dynamic> owner,
    required bool private,
    required bool fork,
    required num? size,
  }) = _RepoModel;

  factory RepoModel.fromJson(Map<String, dynamic> json) => _$RepoModelFromJson(json);
}

extension RepoModelX on RepoModel {
  Repo toEntity() => Repo(
    id: id,
    name: name,
    fullName: fullName,
    description: description,
    language: language,
    stargazersCount: stargazersCount,
    forksCount: forksCount,
    openIssuesCount: openIssuesCount,
    watchersCount: watchersCount,
    createdAt: createdAt,
    updatedAt: updatedAt,
    pushedAt: pushedAt,
    htmlUrl: htmlUrl,
    ownerLogin: owner['login'] as String,
    ownerAvatar: owner['avatar_url'] as String,
    isPrivate: private,
    isFork: fork,
    size: size,
  );
}