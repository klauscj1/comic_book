import 'package:comic_book/app/domain/models/issue_model.dart';
import 'package:comic_book/app/domain/repositories/issue_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:mocktail/mocktail.dart';

void setUpMockIssueRepository() {
  final issueRepository = Get.i.find<IssueRepository>();
  List<Issue> listIssues = [
    Issue(
      image:
          'https://comicvine.gamespot.com/a/uploads/original/11143/111435366/8228032-mad78.jpg',
      dateAdded: DateTime.now(),
      apiDetailUrl: 'https://comicvine.gamespot.com/api/issue/4000-891954/',
      issueNumber: '12',
      name: 'Test one',
    ),
  ];
  when(() => issueRepository.getIssues()).thenAnswer((_) {
    Future.delayed(const Duration(milliseconds: 5000));
    return Future.value(listIssues);
  });
}
