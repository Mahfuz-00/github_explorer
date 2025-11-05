import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Common/Helper/date_formatter.dart';
import '../../Common/Helper/language_color.dart';
import '../../Domain/Entities/repo.dart';
import '../Bloc/Theme/theme_bloc.dart';

class RepoDetailPage extends StatelessWidget {
  final Repo repo;
  const RepoDetailPage({required this.repo, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        final theme = Theme.of(context);
        final isDark = theme.brightness == Brightness.dark;

        return Scaffold(
          appBar: AppBar(
            title: Text(repo.name, overflow: TextOverflow.ellipsis),
            actions: [
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () => context.read<ThemeBloc>().add(ToggleTheme()),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: CachedNetworkImageProvider(repo.ownerAvatar),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(repo.fullName, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                          Text('by ${repo.ownerLogin}', style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Description
                if (repo.description != null && repo.description!.isNotEmpty) ...[
                  Text('Description', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(repo.description!, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 24),
                ],

                // Stats Grid
                _buildStatsGrid(theme),
                const SizedBox(height: 24),

                // Metadata
                _buildMetadataSection(theme),
                const SizedBox(height: 32),

                // Action Button — PASS CONTEXT
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.open_in_browser),
                    label: const Text('Open in GitHub'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () => _launchUrl(context, repo.htmlUrl), // PASS CONTEXT
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatsGrid(ThemeData theme) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 1.2,
      children: [
        _statCard('Stars', repo.stargazersCount, Icons.star, theme),
        _statCard('Forks', repo.forksCount, Icons.fork_left, theme),
        _statCard('Watchers', repo.watchersCount, Icons.visibility, theme),
        _statCard('Issues', repo.openIssuesCount, Icons.info, theme),
        _statCard('Size', '${repo.size ?? 0} KB', Icons.storage, theme),
        _statCard('Private', repo.isPrivate ? 'Yes' : 'No', Icons.lock, theme),
      ],
    );
  }

  Widget _statCard(String label, dynamic value, IconData icon, ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: theme.colorScheme.primary),
            const SizedBox(height: 4),
            Text('$value', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Details', style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        _infoTile('Language', repo.language, LanguageColor.get(repo.language), theme),
        _infoTile('Created', DateFormatter.format(repo.createdAt), Icons.calendar_today, theme),
        if (repo.updatedAt != null)
          _infoTile('Updated', DateFormatter.format(repo.updatedAt!), Icons.update, theme),
        if (repo.pushedAt != null)
          _infoTile('Pushed', DateFormatter.format(repo.pushedAt!), Icons.push_pin, theme),
        _infoTile('Forked', repo.isFork ? 'Yes' : 'No', Icons.fork_right, theme),
      ],
    );
  }

  Widget _infoTile(String label, String? value, dynamic icon, ThemeData theme) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return ListTile(
      leading: icon is Color
          ? Container(width: 16, height: 16, decoration: BoxDecoration(color: icon, shape: BoxShape.circle))
          : Icon(icon, size: 20),
      title: Text(label),
      trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
      contentPadding: EdgeInsets.zero,
    );
  }

  // FIXED: Accept context
  Future<void> _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);

    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        _showSnackBar(context, 'Could not open browser');
      }
    } catch (e) {
      _showSnackBar(context, 'Error: $e');
    }
  }

  // Helper to avoid duplication
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}