import 'package:comic_book/app/data/datasource/remote/issue_api.dart';
import 'package:comic_book/app/domain/models/issue_model.dart';
import 'package:comic_book/app/domain/models/responses/issue_response.dart';
import 'package:comic_book/app/domain/repositories/issue_repository.dart';

class IssueRepositoryImp extends IssueRepository {
  final IssueAPI _api;

  IssueRepositoryImp(this._api);
  @override
  Future<List<Issue>> getIssues() => _api.getIssues();

  @override
  Future<IssueResponse?> getIssue({required String detailUrl}) =>
      _api.getIssue(detailUrl);
}
