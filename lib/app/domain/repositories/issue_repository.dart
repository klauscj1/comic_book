import 'package:comic_book/app/domain/models/issue_model.dart';
import 'package:comic_book/app/domain/models/responses/issue_response.dart';

abstract class IssueRepository {
  Future<List<Issue>> getIssues();
  Future<IssueResponse?> getIssue({required String detailUrl});
}
