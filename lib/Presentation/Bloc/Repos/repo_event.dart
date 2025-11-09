part of 'repo_bloc.dart';

abstract class ReposEvent extends Equatable {
  const ReposEvent();
  @override
  List<Object?> get props => [];
}

class FetchRepos extends ReposEvent {
  final String username;
  const FetchRepos(this.username);
  @override
  List<Object?> get props => [username];
}

class ChangeSort extends ReposEvent {
  final RepoSort sort;
  const ChangeSort(this.sort);
  @override
  List<Object?> get props => [sort];
}

class ToggleView extends ReposEvent {}

class ExpandSearch extends ReposEvent {
  const ExpandSearch();
}

class CollapseSearch extends ReposEvent {
  const CollapseSearch();
}

class SearchRepos extends ReposEvent {
  final String query;
  const SearchRepos(this.query);
  @override
  List<Object?> get props => [query];
}