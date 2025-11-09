class ApiConstants {
  static const String baseUrl = 'https://api.github.com';
  static String user(String username) => '$baseUrl/users/$username';
  static String repos(String username) => '$baseUrl/users/$username/repos';
}