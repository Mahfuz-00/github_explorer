import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Presentation/Bloc/Repos/repo_bloc.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReposBloc, ReposState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildSortDropdown(context, state),
              ),
              const SizedBox(width: 16),
              _buildViewToggle(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSortDropdown(BuildContext context, ReposState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<RepoSort>(
          value: state.sort,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          dropdownColor: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          elevation: 4,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          isDense: true,
          items: RepoSort.values.map((sort) {
            return DropdownMenuItem(
              value: sort,
              child: Row(
                children: [
                  _sortIcon(sort, context),
                  const SizedBox(width: 8),
                  Text(_sortLabel(sort)),
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
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(
          state.isGrid ? Icons.format_list_bulleted : Icons.grid_view,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        tooltip: state.isGrid ? 'Switch to List' : 'Switch to Grid',
        onPressed: () {
          context.read<ReposBloc>().add(ToggleView());
        },
      ),
    );
  }

  Icon _sortIcon(RepoSort sort, BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    switch (sort) {
      case RepoSort.nameAsc:
      case RepoSort.nameDesc:
        return Icon(Icons.sort_by_alpha, size: 16, color: color);
      case RepoSort.dateNewest:
      case RepoSort.dateOldest:
        return Icon(Icons.access_time, size: 16, color: color);
      case RepoSort.starsDesc:
        return Icon(Icons.star, size: 16, color: color);
    }
  }

  String _sortLabel(RepoSort sort) {
    switch (sort) {
      case RepoSort.nameAsc:
        return 'Name A-Z';
      case RepoSort.nameDesc:
        return 'Name Z-A';
      case RepoSort.dateNewest:
        return 'Newest';
      case RepoSort.dateOldest:
        return 'Oldest';
      case RepoSort.starsDesc:
        return 'Most Stars';
    }
  }
}
