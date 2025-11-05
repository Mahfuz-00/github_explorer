import 'package:dio/dio.dart';

import '../../Models/repo_model.dart';
import '../../Models/user_model.dart';


class GitHubApi {
  final Dio dio;

  GitHubApi(this.dio);

  Future<UserModel> fetchUser(String username) async {
    final response = await dio.get('/users/$username');
    print('Response Data User: ${response.data}');
    return UserModel.fromJson(response.data);
  }

  Future<List<RepoModel>> fetchUserRepos(String username) async {
    final response = await dio.get('/users/$username/repos');
    print('Response Data Repo (RAW): ${response.data}');

    final List<dynamic> data = response.data;
    print('Trying to parse ${data.length} repos...');

    final List<RepoModel> repos = [];
    for (var json in data) {
      try {
        final repo = RepoModel.fromJson(json as Map<String, dynamic>);
        repos.add(repo);
      } catch (e) {
        print('Failed to parse repo: $e');
        print('JSON: $json');
      }
    }

    print('Successfully parsed ${repos.length} repos');
    return repos;
  }
}