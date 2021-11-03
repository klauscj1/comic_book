import 'package:comic_book/app/presentation/my_app.dart';
import 'package:comic_book/app/presentation/pages/home/widgets/issues_gridview_widget.dart';
import 'package:comic_book/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../set_up_test.dart';

void main() {
  setUpTest();
  testWidgets(
    'Home page',
    (tester) async {
      await tester.pumpWidget(
        const MyApp(initialRoute: Routes.home),
      );
      //await Future.delayed(const Duration(milliseconds: 1500));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      expect(find.byType(IssuesGridView), findsOneWidget);
    },
  );
}
