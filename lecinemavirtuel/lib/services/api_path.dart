import 'package:lecinemavirtuel/services/config.dart';

class APIPath {
  // Auth routes
  static String userSignIn() => '${Config.baseUrl}/auth/login';
  static String userSignUp() => '${Config.baseUrl}/auth/register';
  static String updateAccount() => '${Config.baseUrl}/me';

  static String forgotPassword() => '${Config.baseUrl}/auth/forgot-password';
  static String updatePassword() => '${Config.baseUrl}/auth/change-password';

  static String countries() => '${Config.baseUrl}/countries';
  static String profile() => '${Config.baseUrl}/me';
  static String genre() => '${Config.baseUrl}/genres';
  static String categories() => '${Config.baseUrl}/categories';
  static String moviePremiereList() => '${Config.baseUrl}/movie-premieres';
  static String moviePremiereDetail(id) =>
      '${Config.baseUrl}/movie-premieres/$id';
}
