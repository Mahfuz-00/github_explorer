import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Presentation/Bloc/Repos/repo_bloc.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReposBloc, ReposState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        final bloc = context.read<ReposBloc>();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.18), blurRadius: 20, spreadRadius: 2, offset: const Offset(0, 8)),
              BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 2)),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: state.isSearchExpanded ? constraints.maxWidth : 40,
                      height: 40,
                      child: OverflowBox(
                        maxWidth: constraints.maxWidth,
                        child: state.isSearchExpanded
                            ? _buildSearchBar(context, state, theme)
                            : _buildSearchIcon(context, theme),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 8),

              if (!state.isSearchExpanded)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 140,
                  height: 40,
                  child: _buildSortDropdown(context, state),
                )
              else
                const SizedBox(width: 0),

              const SizedBox(width: 8),

              SizedBox(
                height: 40,
                width: 40,
                child: _buildViewToggle(context, state),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchIcon(BuildContext context, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.search, size: 20, color: theme.colorScheme.primary),
        onPressed: () {
          context.read<ReposBloc>().add(const ExpandSearch());
        },
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, ReposState state, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.3)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Icon(Icons.search, size: 18),
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              autofocus: true,
              onChanged: (query) {
                context.read<ReposBloc>().add(SearchRepos(query.trim().toLowerCase()));
              },
              decoration: const InputDecoration(
                hintText: '  Search...',
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<ReposBloc>().add(const CollapseSearch());
            },
            child: const Icon(Icons.close, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSortDropdown(BuildContext context, ReposState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<RepoSort>(
          value: state.sort,
          icon: Icon(Icons.keyboard_arrow_down, size: 18, color: Theme.of(context).colorScheme.primary),
          dropdownColor: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          elevation: 3,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF0D1117)),
          isDense: true,
          items: RepoSort.values.map((sort) {
            return DropdownMenuItem(
              value: sort,
              child: Row(
                children: [
                  _sortIcon(sort, context),
                  const SizedBox(width: 4),
                  Text(_sortLabel(sort), style: const TextStyle(fontSize: 13)),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              context.read<ReposBloc>().add(ChangeSort(value));
            }
          },
        ),
      ),
    );
  }

  Widget _buildViewToggle(BuildContext context, ReposState state) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          state.isGrid ? Icons.format_list_bulleted : Icons.grid_view,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          context.read<ReposBloc>().add(ToggleView());
        },
      ),
    );
  }

  Icon _sortIcon(RepoSort sort, BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return switch (sort) {
      RepoSort.nameAsc || RepoSort.nameDesc => Icon(Icons.sort_by_alpha, size: 14, color: color),
      RepoSort.dateNewest || RepoSort.dateOldest => Icon(Icons.access_time, size: 14, color: color),
      RepoSort.starsDesc => Icon(Icons.star, size: 14, color: color),
    };
  }

  String _sortLabel(RepoSort sort) {
    return switch (sort) {
      RepoSort.nameAsc => 'A-Z',
      RepoSort.nameDesc => 'Z-A',
      RepoSort.dateNewest => 'Newest',
      RepoSort.dateOldest => 'Oldest',
      RepoSort.starsDesc => 'Stars',
    };
  }
}