import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Domain/Entities/repo.dart';
import '../../../Domain/Usecases/get_user_repos.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class ReposBloc extends Bloc<ReposEvent, ReposState> {
  final GetUserRepos getUserRepos;

  ReposBloc(this.getUserRepos) : super(ReposState.initial()) {
    on<FetchRepos>(_onFetchRepos);
    on<ChangeSort>(_onChangeSort);
    on<ToggleView>(_onToggleView);
    on<ExpandSearch>(_onExpandSearch);
    on<CollapseSearch>(_onCollapseSearch);
    on<SearchRepos>(_onSearchRepos);
  }

  Future<void> _onFetchRepos(FetchRepos event, Emitter<ReposState> emit) async {
    emit(state.copyWith(isLoading: true, clearError: true));
    final result = await getUserRepos(event.username);
    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
          (repos) {
        final sorted = _applySort(repos, state.sort);
        emit(state.copyWith(
          repos: repos,
          filtered: sorted,
          isLoading: false,
        ));
      },
    );
  }

  void _onChangeSort(ChangeSort event, Emitter<ReposState> emit) {
    final sorted = _applySort(state.repos, event.sort);
    emit(state.copyWith(sort: event.sort, filtered: sorted));
  }

  void _onToggleView(ToggleView event, Emitter<ReposState> emit) {
    emit(state.copyWith(isGrid: !state.isGrid));
  }

  void _onExpandSearch(ExpandSearch event, Emitter<ReposState> emit) {
    emit(state.copyWith(isSearchExpanded: true));
  }

  void _onCollapseSearch(CollapseSearch event, Emitter<ReposState> emit) {
    emit(state.copyWith(isSearchExpanded: false, searchQuery: ''));
    add(const SearchRepos(''));
  }

  void _onSearchRepos(SearchRepos event, Emitter<ReposState> emit) {
    final query = event.query;
    var filtered = state.repos;

    if (query.isNotEmpty) {
      filtered = filtered.where((r) {
        final name = (r.name ?? '').toLowerCase();
        return name.startsWith(query);
      }).toList();
    }

    final sorted = _applySort(filtered, state.sort);
    emit(state.copyWith(searchQuery: query, filtered: sorted));
  }

  List<Repo> _applySort(List<Repo> repos, RepoSort sort) {
    final List<Repo> list = List.from(repos);
    switch (sort) {
      case RepoSort.nameAsc:
        list.sort((a, b) {
          final nameA = (a.name ?? '').toLowerCase();
          final nameB = (b.name ?? '').toLowerCase();
          return nameA.compareTo(nameB);
        });
        break;
      case RepoSort.nameDesc:
        list.sort((a, b) {
          final nameA = (a.name ?? '').toLowerCase();
          final nameB = (b.name ?? '').toLowerCase();
          return nameB.compareTo(nameA);
        });
        break;
      case RepoSort.dateNewest:
        list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case RepoSort.dateOldest:
        list.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case RepoSort.starsDesc:
        list.sort((a, b) => b.stargazersCount.compareTo(a.stargazersCount));
        break;
    }
    return list;
  }
}