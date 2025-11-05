// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepoModelImpl _$$RepoModelImplFromJson(Map<String, dynamic> json) =>
    _$RepoModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      description: json['description'] as String?,
      language: json['language'] as String?,
      stargazersCount: (json['stargazers_count'] as num).toInt(),
      forksCount: (json['forks_count'] as num).toInt(),
      openIssuesCount: (json['open_issues_count'] as num).toInt(),
      watchersCount: (json['watchers_count'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      pushedAt: json['pushed_at'] == null
          ? null
          : DateTime.parse(json['pushed_at'] as String),
      htmlUrl: json['html_url'] as String,
      owner: json['owner'] as Map<String, dynamic>,
      private: json['private'] as bool,
      fork: json['fork'] as bool,
      size: json['size'] as num?,
    );

Map<String, dynamic> _$$RepoModelImplToJson(_$RepoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'description': instance.description,
      'language': instance.language,
      'stargazers_count': instance.stargazersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
      'watchers_count': instance.watchersCount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'pushed_at': instance.pushedAt?.toIso8601String(),
      'html_url': instance.htmlUrl,
      'owner': instance.owner,
      'private': instance.private,
      'fork': instance.fork,
      'size': instance.size,
    };
