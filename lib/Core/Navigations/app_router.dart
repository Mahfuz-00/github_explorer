import 'package:flutter/material.dart';

import '../../Domain/Entities/repo.dart';
import '../../Presenation/Pages/home_page.dart';
import '../../Presenation/Pages/repo_detail_page.dart';
import '../../Presenation/Pages/username_page.dart';


class AppRouter {
  static const String username = '/';
  static const String home = '/home';
  static const String detail = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case username:
        return MaterialPageRoute(builder: (_) => const UsernamePage());
      case home:
        final username = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HomePage(username: username));
      case detail:
        final repo = settings.arguments as Repo;
        return MaterialPageRoute(builder: (_) => RepoDetailPage(repo: repo));
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}