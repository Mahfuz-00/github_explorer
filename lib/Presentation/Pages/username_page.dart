import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Common/Services/search_history_service.dart';
import '../../Core/Config/Constants/constants.dart';
import '../../Core/Navigations/app_router.dart';
import '../Bloc/Theme/theme_bloc.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final _controller = TextEditingController();
  List<String> _searchHistory = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final history = await SearchHistoryService.getHistory();
    if (mounted) {
      setState(() => _searchHistory = history);
    }
  }

  void _onContinue() async {
    final username = _controller.text.trim();
    if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a username')),
      );
      return;
    }

    await SearchHistoryService.addUsername(username);
    if (mounted) {
      Navigator.pushNamed(context, AppRouter.home, arguments: username);
    }
  }

  void _onSuggestionTap(String username) {
    _controller.text = username;
    _onContinue();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        final isDark = themeState.isDark;
        final theme = Theme.of(context);

        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(AppConstants.appName),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () => context.read<ThemeBloc>().add(ToggleTheme()),
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Image.asset(
                    'Assets/Images/github-logo.png',
                    width: 100,
                    height: 100,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Welcome to GitHub Explorer',
                    style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  Text(
                    'Enter a GitHub username to view their repositories',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.go,
                    onSubmitted: (_) => _onContinue(),
                    decoration: InputDecoration(
                      labelText: 'GitHub Username',
                      hintText: 'e.g. mahfuz-00',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.03),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_searchHistory.isNotEmpty) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recent Searches',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _searchHistory.map((name) {
                        return GestureDetector(
                          onTap: () => _onSuggestionTap(name),
                          child: Chip(
                            label: Text(name),
                            avatar: const Icon(Icons.history, size: 16),
                            backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.6),
                            labelStyle: theme.textTheme.bodySmall,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onContinue,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Continue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
