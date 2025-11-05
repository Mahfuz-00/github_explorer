// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RepoModel _$RepoModelFromJson(Map<String, dynamic> json) {
  return _RepoModel.fromJson(json);
}

/// @nodoc
mixin _$RepoModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int get stargazersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  int get forksCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_issues_count')
  int get openIssuesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchers_count')
  int get watchersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'pushed_at')
  DateTime? get pushedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;
  Map<String, dynamic> get owner => throw _privateConstructorUsedError;
  bool get private => throw _privateConstructorUsedError;
  bool get fork => throw _privateConstructorUsedError;
  num? get size => throw _privateConstructorUsedError;

  /// Serializes this RepoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepoModelCopyWith<RepoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoModelCopyWith<$Res> {
  factory $RepoModelCopyWith(RepoModel value, $Res Function(RepoModel) then) =
      _$RepoModelCopyWithImpl<$Res, RepoModel>;
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'full_name') String fullName,
    String? description,
    String? language,
    @JsonKey(name: 'stargazers_count') int stargazersCount,
    @JsonKey(name: 'forks_count') int forksCount,
    @JsonKey(name: 'open_issues_count') int openIssuesCount,
    @JsonKey(name: 'watchers_count') int watchersCount,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'pushed_at') DateTime? pushedAt,
    @JsonKey(name: 'html_url') String htmlUrl,
    Map<String, dynamic> owner,
    bool private,
    bool fork,
    num? size,
  });
}

/// @nodoc
class _$RepoModelCopyWithImpl<$Res, $Val extends RepoModel>
    implements $RepoModelCopyWith<$Res> {
  _$RepoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullName = null,
    Object? description = freezed,
    Object? language = freezed,
    Object? stargazersCount = null,
    Object? forksCount = null,
    Object? openIssuesCount = null,
    Object? watchersCount = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? pushedAt = freezed,
    Object? htmlUrl = null,
    Object? owner = null,
    Object? private = null,
    Object? fork = null,
    Object? size = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            language: freezed == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String?,
            stargazersCount: null == stargazersCount
                ? _value.stargazersCount
                : stargazersCount // ignore: cast_nullable_to_non_nullable
                      as int,
            forksCount: null == forksCount
                ? _value.forksCount
                : forksCount // ignore: cast_nullable_to_non_nullable
                      as int,
            openIssuesCount: null == openIssuesCount
                ? _value.openIssuesCount
                : openIssuesCount // ignore: cast_nullable_to_non_nullable
                      as int,
            watchersCount: null == watchersCount
                ? _value.watchersCount
                : watchersCount // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            pushedAt: freezed == pushedAt
                ? _value.pushedAt
                : pushedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            htmlUrl: null == htmlUrl
                ? _value.htmlUrl
                : htmlUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            owner: null == owner
                ? _value.owner
                : owner // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            private: null == private
                ? _value.private
                : private // ignore: cast_nullable_to_non_nullable
                      as bool,
            fork: null == fork
                ? _value.fork
                : fork // ignore: cast_nullable_to_non_nullable
                      as bool,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as num?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RepoModelImplCopyWith<$Res>
    implements $RepoModelCopyWith<$Res> {
  factory _$$RepoModelImplCopyWith(
    _$RepoModelImpl value,
    $Res Function(_$RepoModelImpl) then,
  ) = __$$RepoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'full_name') String fullName,
    String? description,
    String? language,
    @JsonKey(name: 'stargazers_count') int stargazersCount,
    @JsonKey(name: 'forks_count') int forksCount,
    @JsonKey(name: 'open_issues_count') int openIssuesCount,
    @JsonKey(name: 'watchers_count') int watchersCount,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'pushed_at') DateTime? pushedAt,
    @JsonKey(name: 'html_url') String htmlUrl,
    Map<String, dynamic> owner,
    bool private,
    bool fork,
    num? size,
  });
}

/// @nodoc
class __$$RepoModelImplCopyWithImpl<$Res>
    extends _$RepoModelCopyWithImpl<$Res, _$RepoModelImpl>
    implements _$$RepoModelImplCopyWith<$Res> {
  __$$RepoModelImplCopyWithImpl(
    _$RepoModelImpl _value,
    $Res Function(_$RepoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullName = null,
    Object? description = freezed,
    Object? language = freezed,
    Object? stargazersCount = null,
    Object? forksCount = null,
    Object? openIssuesCount = null,
    Object? watchersCount = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? pushedAt = freezed,
    Object? htmlUrl = null,
    Object? owner = null,
    Object? private = null,
    Object? fork = null,
    Object? size = freezed,
  }) {
    return _then(
      _$RepoModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        language: freezed == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String?,
        stargazersCount: null == stargazersCount
            ? _value.stargazersCount
            : stargazersCount // ignore: cast_nullable_to_non_nullable
                  as int,
        forksCount: null == forksCount
            ? _value.forksCount
            : forksCount // ignore: cast_nullable_to_non_nullable
                  as int,
        openIssuesCount: null == openIssuesCount
            ? _value.openIssuesCount
            : openIssuesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        watchersCount: null == watchersCount
            ? _value.watchersCount
            : watchersCount // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        pushedAt: freezed == pushedAt
            ? _value.pushedAt
            : pushedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        htmlUrl: null == htmlUrl
            ? _value.htmlUrl
            : htmlUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        owner: null == owner
            ? _value._owner
            : owner // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        private: null == private
            ? _value.private
            : private // ignore: cast_nullable_to_non_nullable
                  as bool,
        fork: null == fork
            ? _value.fork
            : fork // ignore: cast_nullable_to_non_nullable
                  as bool,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as num?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RepoModelImpl implements _RepoModel {
  const _$RepoModelImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'full_name') required this.fullName,
    required this.description,
    required this.language,
    @JsonKey(name: 'stargazers_count') required this.stargazersCount,
    @JsonKey(name: 'forks_count') required this.forksCount,
    @JsonKey(name: 'open_issues_count') required this.openIssuesCount,
    @JsonKey(name: 'watchers_count') required this.watchersCount,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    @JsonKey(name: 'pushed_at') required this.pushedAt,
    @JsonKey(name: 'html_url') required this.htmlUrl,
    required final Map<String, dynamic> owner,
    required this.private,
    required this.fork,
    required this.size,
  }) : _owner = owner;

  factory _$RepoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepoModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final String? description;
  @override
  final String? language;
  @override
  @JsonKey(name: 'stargazers_count')
  final int stargazersCount;
  @override
  @JsonKey(name: 'forks_count')
  final int forksCount;
  @override
  @JsonKey(name: 'open_issues_count')
  final int openIssuesCount;
  @override
  @JsonKey(name: 'watchers_count')
  final int watchersCount;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'pushed_at')
  final DateTime? pushedAt;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  final Map<String, dynamic> _owner;
  @override
  Map<String, dynamic> get owner {
    if (_owner is EqualUnmodifiableMapView) return _owner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_owner);
  }

  @override
  final bool private;
  @override
  final bool fork;
  @override
  final num? size;

  @override
  String toString() {
    return 'RepoModel(id: $id, name: $name, fullName: $fullName, description: $description, language: $language, stargazersCount: $stargazersCount, forksCount: $forksCount, openIssuesCount: $openIssuesCount, watchersCount: $watchersCount, createdAt: $createdAt, updatedAt: $updatedAt, pushedAt: $pushedAt, htmlUrl: $htmlUrl, owner: $owner, private: $private, fork: $fork, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.openIssuesCount, openIssuesCount) ||
                other.openIssuesCount == openIssuesCount) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.pushedAt, pushedAt) ||
                other.pushedAt == pushedAt) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            const DeepCollectionEquality().equals(other._owner, _owner) &&
            (identical(other.private, private) || other.private == private) &&
            (identical(other.fork, fork) || other.fork == fork) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    fullName,
    description,
    language,
    stargazersCount,
    forksCount,
    openIssuesCount,
    watchersCount,
    createdAt,
    updatedAt,
    pushedAt,
    htmlUrl,
    const DeepCollectionEquality().hash(_owner),
    private,
    fork,
    size,
  );

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepoModelImplCopyWith<_$RepoModelImpl> get copyWith =>
      __$$RepoModelImplCopyWithImpl<_$RepoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepoModelImplToJson(this);
  }
}

abstract class _RepoModel implements RepoModel {
  const factory _RepoModel({
    required final int id,
    required final String name,
    @JsonKey(name: 'full_name') required final String fullName,
    required final String? description,
    required final String? language,
    @JsonKey(name: 'stargazers_count') required final int stargazersCount,
    @JsonKey(name: 'forks_count') required final int forksCount,
    @JsonKey(name: 'open_issues_count') required final int openIssuesCount,
    @JsonKey(name: 'watchers_count') required final int watchersCount,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime? updatedAt,
    @JsonKey(name: 'pushed_at') required final DateTime? pushedAt,
    @JsonKey(name: 'html_url') required final String htmlUrl,
    required final Map<String, dynamic> owner,
    required final bool private,
    required final bool fork,
    required final num? size,
  }) = _$RepoModelImpl;

  factory _RepoModel.fromJson(Map<String, dynamic> json) =
      _$RepoModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String? get description;
  @override
  String? get language;
  @override
  @JsonKey(name: 'stargazers_count')
  int get stargazersCount;
  @override
  @JsonKey(name: 'forks_count')
  int get forksCount;
  @override
  @JsonKey(name: 'open_issues_count')
  int get openIssuesCount;
  @override
  @JsonKey(name: 'watchers_count')
  int get watchersCount;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'pushed_at')
  DateTime? get pushedAt;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl;
  @override
  Map<String, dynamic> get owner;
  @override
  bool get private;
  @override
  bool get fork;
  @override
  num? get size;

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepoModelImplCopyWith<_$RepoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
