import 'package:freezed_annotation/freezed_annotation.dart';
import '../../Domain/Entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    required String? name,
    required String? bio,
    required String? location,
    required String? company,
    required String? blog,
    @JsonKey(name: 'public_repos') required int publicRepos,
    required int followers,
    required int following,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  User toEntity() => User(
    login: login,
    avatarUrl: avatarUrl,
    name: name ?? login,
    bio: bio,
    location: location,
    company: company,
    blog: blog,
    publicRepos: publicRepos,
    followers: followers,
    following: following,
    createdAt: createdAt,
  );
}