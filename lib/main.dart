import 'package:comic_book/app/presentation/my_app.dart';

import 'package:flutter/material.dart';

import 'dependency_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  runApp(const MyApp());
}
