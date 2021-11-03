import 'package:comic_book/app/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.appRoutes, this.initialRoute}) : super(key: key);
  final Map<String, Widget Function(BuildContext)>? appRoutes;
  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic Book',
      routes: appRoutes ?? routes,
      initialRoute: initialRoute ?? Routes.home,
      navigatorObservers: [
        router.observer,
      ],
    );
  }
}
