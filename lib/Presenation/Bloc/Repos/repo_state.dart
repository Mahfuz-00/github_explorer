part of 'repo_bloc.dart';

enum RepoSort { nameAsc, nameDesc, dateNewest, dateOldest, starsDesc }

class ReposState extends Equatable {
  final List<Repo> repos;
  final List<Repo> filtered;
  final RepoSort sort;
  final bool isGrid;
  final bool isLoading;
  final String? error;

  const ReposState({
    required this.repos,
    required this.filtered,
    required this.sort,
    required this.isGrid,
    required this.isLoading,
    this.error,
  });

  factory ReposState.initial() => ReposState(
    repos: const [],
    filtered: const [],
    sort: RepoSort.dateNewest,
    isGrid: false,
    isLoading: false,
  );

  ReposState copyWith({
    List<Repo>? repos,
    List<Repo>? filtered,
    RepoSort? sort,
    bool? isGrid,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return ReposState(
      repos: repos ?? this.repos,
      filtered: filtered ?? this.filtered,
      sort: sort ?? this.sort,
      isGrid: isGrid ?? this.isGrid,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props => [repos, filtered, sort, isGrid, isLoading, error];
}