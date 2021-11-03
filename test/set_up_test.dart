import 'package:comic_book/app/domain/repositories/issue_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app/data/respositories_impl/mock_issue_repository_impl.dart';
import 'app/domain/repositories/mock_repositories.dart';

void setUpTest() {
  setUp(() {
    Get.i.put<IssueRepository>(MockIssueRepository());
    setUpMockIssueRepository();
  });
}
