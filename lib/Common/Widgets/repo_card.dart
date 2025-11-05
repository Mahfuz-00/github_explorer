// lib/common/widgets/repo_card.dart
import 'package:flutter/material.dart';
import '../../Common/Helper/date_formatter.dart';
import '../../Domain/Entities/repo.dart';
import '../Helper/language_color.dart';

class RepoCard extends StatelessWidget {
  final Repo repo;
  final VoidCallback onTap;
  final bool isGrid;

  const RepoCard({
    super.key,
    required this.repo,
    required this.onTap,
    this.isGrid = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                repo.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (repo.isPrivate)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Private',
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                ),

              // DESCRIPTION: Smart spacing
              if (repo.description != null && repo.description!.trim().isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: _buildDescription(theme),
                )
              else if (isGrid)
                const SizedBox(height: 12 + 2 * 21), // Only in grid

              // Language + Stats
              const SizedBox(height: 8),

              _buildLanguageRow(theme),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStat(Icons.star, repo.stargazersCount, theme),
                  _buildStat(Icons.fork_left, repo.forksCount, theme),
                  _buildStat(Icons.visibility, repo.watchersCount, theme),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                'Updated ${DateFormatter.format(repo.updatedAt ?? repo.createdAt)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(ThemeData theme) {
    final maxLines = isGrid ? 2 : 3;
    final hasDesc = repo.description != null && repo.description!.trim().isNotEmpty;

    if (!hasDesc) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: repo.description!, style: theme.textTheme.bodyMedium),
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final usedLines = textPainter.computeLineMetrics().length;
        final lineHeight = theme.textTheme.bodyMedium?.height ?? 1.5;
        final fontSize = theme.textTheme.bodyMedium?.fontSize ?? 14;
        final totalReserved = maxLines * lineHeight * fontSize;
        final usedHeight = usedLines * lineHeight * fontSize;
        final double paddingHeight = isGrid ? (totalReserved - usedHeight) : 0;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repo.description!,
              style: theme.textTheme.bodyMedium,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
            if (paddingHeight > 0) SizedBox(height: paddingHeight),
          ],
        );
      },
    );
  }

  Widget _buildLanguageRow(ThemeData theme) {
    final hasLanguage = repo.language != null && repo.language!.trim().isNotEmpty;

    if (hasLanguage) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: LanguageColor.get(repo.language),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              repo.language!,
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    } else if (isGrid) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 2),
        child: SizedBox(height: 18),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildStat(IconData icon, int count, ThemeData theme) {
    return Row(
      children: [
        Icon(icon, size: 16, color: theme.colorScheme.primary),
        const SizedBox(width: 4),
        Text('$count', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}