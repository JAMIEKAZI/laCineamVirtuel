import 'package:flutter/material.dart';
import 'package:lecinemavirtuel/common/route_constants.dart';
import 'package:lecinemavirtuel/screens/authentication/forgot-password-success.dart';
import 'package:lecinemavirtuel/screens/authentication/forgot-password.dart';
import 'package:lecinemavirtuel/screens/authentication/login.dart';
import 'package:lecinemavirtuel/screens/authentication/register.dart';
import 'package:lecinemavirtuel/screens/authentication/splash.dart';
import 'package:lecinemavirtuel/screens/home/movie_premiere.dart';
import 'package:lecinemavirtuel/screens/my-movies/movies.dart';
import 'package:lecinemavirtuel/screens/my-movies/watch-screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashRoute:
      return MaterialPageRoute(builder: (context) => Splash());
    case LoginRoute:
      return MaterialPageRoute(builder: (context) => Login());
    case RegisterRoute:
      return MaterialPageRoute(builder: (context) => Register());
    case MoviePremiereRoute:
      return MaterialPageRoute(builder: (context) => MoviePremiere());

    case MoviesHomeRoute:
      return MaterialPageRoute(builder: (context) => MoviesHome());

    case WatchScreenRoute:
      return MaterialPageRoute(builder: (context) => WatchScreen());

    case ForgotPasswordRoute:
      return MaterialPageRoute(builder: (context) => ForgotPassword());
    case ForgotPasswordSuccessRoute:
      return MaterialPageRoute(builder: (context) => ForgotPasswordSuccess());

    default:
      return MaterialPageRoute(builder: (context) => Register());
  }
}
