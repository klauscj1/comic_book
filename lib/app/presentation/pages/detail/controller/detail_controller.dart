import 'package:comic_book/app/domain/models/responses/issue_response.dart';
import 'package:comic_book/app/domain/repositories/issue_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class DetailController extends SimpleNotifier {
  DetailController(String url) {
    _url = url;

    _init();
  }
  final _issueRepository = Get.i.find<IssueRepository>();
  String? _url;
  //vars
  IssueResponse? _issueResponse;
  bool _fetching = true;
  //get's
  IssueResponse get issueResponse => _issueResponse!;
  bool get fetching => _fetching;
  //set's
  set issueResponse(IssueResponse newIssueResponse) {
    _issueResponse = newIssueResponse;
    notify(['issueResponse']);
  }

  set fetching(bool newFetching) {
    _fetching = newFetching;
    notify(['fetching']);
  }

  void _init() {
    _issueRepository.getIssue(detailUrl: _url!).then((value) {
      _issueResponse = value;
      fetching = false;
      notify(['fetching']);
      notify(['issueResponse']);
    });
  }
}
