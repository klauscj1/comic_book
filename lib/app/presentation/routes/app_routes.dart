import 'package:comic_book/app/presentation/pages/detail/detail_page.dart';
import 'package:comic_book/app/presentation/pages/home/home_page.dart';
import 'package:comic_book/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Routes.home: (_) => const HomePage(),
  Routes.detail: (_) => const DetailPage(),
};
