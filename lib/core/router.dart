import 'package:flutter/material.dart';

import '../presentation/pages/settings/accounts/accounts_page.dart';
import '../presentation/pages/settings/categories/categories_page.dart';
import '../presentation/pages/passcode/passcode_page.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/splash/onboard_page.dart';
import '../presentation/pages/splash/splash_page.dart';

class Router {
  /// The initial route.
  static const initialRoute = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );
        break;
      case '/onboard':
        return MaterialPageRoute(
          builder: (context) => OnboardPage(),
        );
        break;
      case '/settings/accounts':
        return MaterialPageRoute(
          builder: (_) => AccountsPage(),
        );
        break;
      case '/settings/categories':
        return MaterialPageRoute(
          builder: (_) => CategoriesPage(),
        );
        break;
      case '/settings/passcode':
        return MaterialPageRoute(
          builder: (_) => PasscodePage(),
        );
        break;
      case '/home':
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
        break;
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Text('Round name does not exist'),
    );
  }
}
