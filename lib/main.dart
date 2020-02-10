import 'package:flutter/material.dart';
import 'package:money_manager/presentation/pages/home/tabs/setting/main/categories_page.dart';
import 'package:money_manager/presentation/pages/home/tabs/setting/main/passcode_page.dart';
import 'presentation/pages/splash/onboard_page.dart';
import 'presentation/pages/splash/splash_page.dart';
import 'presentation/pages/home/home_page.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  /// Create a Application widget.
  Application({
    Key key,
  }) : super(key: key);

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (setting) {
        switch (setting.name) {
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
          case '/home':
            return MaterialPageRoute(
              builder: (context) => HomePage(),
            );
            break;
          case '/settings/categories':
            return MaterialPageRoute(
              builder: (_) => CategoriePage(),
            );
            break;
          case '/settings/passcodepage':
            return MaterialPageRoute(
              builder: (_) => PassCodePage(),
            );
            break;
          default:
            return MaterialPageRoute(
              builder: (context) => HomePage(),
            );
            break;
        }
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: (_) => Text('Round name does not exist'),
        );
      },
    );
  }
}
