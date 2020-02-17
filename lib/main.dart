import 'package:flutter/material.dart';
import 'core/router.dart';

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
      initialRoute: Router.initialRoute,
      onGenerateRoute: Router.onGenerateRoute,
      onUnknownRoute: Router.onUnknownRoute,
    );
  }
}
