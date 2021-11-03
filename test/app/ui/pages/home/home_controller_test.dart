import 'package:comic_book/app/presentation/pages/home/controller/home_controller.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../../set_up_test.dart';

void main() {
  setUpTest();
  test('home controller', () async {
    final controller = HomeController();
    expect(controller.fetching, true);
    await Future.delayed(const Duration(milliseconds: 2000));
    expect(controller.fetching, false);
    expect(controller.issues.length, 1);
  });
}
