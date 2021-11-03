import 'package:comic_book/app/domain/models/issue_model.dart';
import 'package:comic_book/app/domain/repositories/issue_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class HomeController extends SimpleNotifier {
  final IssueRepository _issueRepository = Get.i.find<IssueRepository>();
  HomeController() {
    init();
  }
  //vars
  List<Issue> _issues = [];
  bool _fetching = true;
  bool _typeView = true; //Grid=true, List =false by default Grid (true)
  Issue? _selectedIssue;

//get's
  List<Issue> get issues => _issues;
  bool get fetching => _fetching;
  bool get typeView => _typeView;
  Issue get selectedIssue => _selectedIssue!;

//set's

  set issues(List<Issue> newIssues) {
    _issues = newIssues;
    notify(['issues']);
  }

  set fetching(bool newFetching) {
    _fetching = newFetching;
    notify(['fetching']);
  }

  set typeView(bool newTypeView) {
    _typeView = _typeView;
    notify(['typeView']);
  }

  set selectedIssue(Issue selectedIssue) {
    _selectedIssue = selectedIssue;
    notify(['selectedIssue']);
  }

  //methods

  void init() async {
    _issueRepository.getIssues().then((value) {
      _fetching = false;
      _issues = value;
      notify(['fetching']);
      notify(['issues']);
    });
  }

  void changeTypeView() {
    _typeView = !_typeView;
    notify(['typeView']);
  }
}
