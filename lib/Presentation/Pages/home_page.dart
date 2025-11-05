import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Common/Widgets/filter_bar.dart';
import '../../Common/Widgets/repo_card.dart';
import '../../Core/DI/injection.dart';
import '../../Core/Navigations/app_router.dart';
import '../../Domain/Entities/repo.dart';
import '../../Domain/Entities/user.dart';
import '../Bloc/Repos/repo_bloc.dart';
import '../Bloc/Theme/theme_bloc.dart';
import '../Bloc/User/user_bloc.dart';
import '../Widgets/loading_widget.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({required this.username, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<UserBloc>()..add(FetchUser(username))),
        BlocProvider(create: (_) => sl<ReposBloc>()..add(FetchRepos(username))),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return Theme(
            data: themeState.isDark ? ThemeData.dark() : ThemeData.light(),
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: SafeArea(
                    child: Column(
                      children: [
                        BlocBuilder<UserBloc, UserState>(
                          builder: (context, userState) {
                            if (userState is UserLoading) {
                              return const LinearProgressIndicator();
                            }
                            if (userState is UserLoaded) {
                              return _buildUserHeader(userState.user, context, themeState.isDark);
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        const FilterBar(),
                        Expanded(
                          child: BlocBuilder<ReposBloc, ReposState>(
                            builder: (context, state) {
                              if (state.isLoading) return const LoadingWidget();
                              if (state.error != null) return Center(child: Text(state.error!));
                              if (state.filtered.isEmpty) return const Center(child: Text('No repositories'));

                              return state.isGrid
                                  ? _buildGrid(state.filtered)
                                  : _buildList(state.filtered);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserHeader(User user, BuildContext context, bool isDark) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TOP ROW: Avatar + Info (NO THEME BUTTON HERE)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 36,
                backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '@${user.login}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (user.bio != null && user.bio!.trim().isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        user.bio!,
                        style: theme.textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // BOTTOM ROW: Stats + Theme Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatChip(user.publicRepos, 'Repos', Icons.folder_open, theme),
              _buildStatChip(user.followers, 'Followers', Icons.people, theme),
              _buildStatChip(user.following, 'Following', Icons.person_add, theme),

              // THEME TOGGLE — SAME ROW
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    color: theme.colorScheme.primary,
                    size: 22,
                  ),
                  tooltip: isDark ? 'Switch to Light' : 'Switch to Dark',
                  onPressed: () {
                    context.read<ThemeBloc>().add(ToggleTheme());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

// NEW: Stat Chip with Icon
  Widget _buildStatChip(int count, String label, IconData icon, ThemeData theme) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: theme.colorScheme.primary),
            const SizedBox(width: 4),
            Text(
              '$count',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildStatColumn(int count, String label) {
    return Column(
      children: [
        Text('$count', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildList(List<Repo> repos) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: repos.length,
      itemBuilder: (context, index) {
        final repo = repos[index];
        return RepoCard(
          repo: repo,
          onTap: () => _openDetail(context, repo),
          isGrid: false,
        );
      },
    );
  }

  Widget _buildGrid(List<Repo> repos) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: repos.length,
      itemBuilder: (context, index) {
        final repo = repos[index];
        return RepoCard(
          repo: repo,
          onTap: () => _openDetail(context, repo),
          isGrid: true,
        );
      },
    );
  }

  void _openDetail(BuildContext context, Repo repo) {
    Navigator.pushNamed(context, AppRouter.detail, arguments: repo);
  }
}