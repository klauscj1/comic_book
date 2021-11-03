import 'package:comic_book/app/presentation/routes/app_routes.dart';
import 'package:comic_book/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'dependency_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comic Book',
      routes: routes,
      initialRoute: Routes.home,
      navigatorObservers: [
        router.observer,
      ],
    );
  }
}
