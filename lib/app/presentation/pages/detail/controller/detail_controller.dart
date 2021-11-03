import 'package:comic_book/app/domain/models/character_model.dart';
import 'package:comic_book/app/domain/models/responses/issue_response.dart';
import 'package:comic_book/app/domain/repositories/issue_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class DetailController extends SimpleNotifier {
  final _issueRepository = Get.i.find<IssueRepository>();

  DetailController(String url) {
    _url = url;
    _init();
  }

  //vars
  IssueResponse? _issueResponse;
  bool _fetching = true;
  List<CustomDetailModel> _characters = [];
  List<CustomDetailModel> _teams = [];
  List<CustomDetailModel> _locations = [];
  List<CustomDetailModel> _concepts = [];
  String? _url;
  //get's
  IssueResponse get issueResponse => _issueResponse!;
  bool get fetching => _fetching;
  List<CustomDetailModel> get characters => _characters;
  List<CustomDetailModel> get teams => _teams;
  List<CustomDetailModel> get locations => _locations;
  List<CustomDetailModel> get concepts => _concepts;
  //set's
  set issueResponse(IssueResponse newIssueResponse) {
    _issueResponse = newIssueResponse;
    notify(['issueResponse']);
  }

  set fetching(bool newFetching) {
    _fetching = newFetching;
    notify(['fetching']);
  }

  set characters(List<CustomDetailModel> newCharacters) {
    _characters = newCharacters;
    notify(['characters']);
  }

  set teams(List<CustomDetailModel> newTeams) {
    _teams = newTeams;
    notify(['teams']);
  }

  set locations(List<CustomDetailModel> newLocations) {
    _locations = newLocations;
    notify(['locations']);
  }

  set concepts(List<CustomDetailModel> newConcepts) {
    _concepts = newConcepts;
    notify(['locations']);
  }

//methods
  void _init() {
    _issueRepository.getIssue(detailUrl: _url!).then((value) async {
      _issueResponse = value;
      if (_issueResponse != null && _issueResponse!.results != null) {
        for (Detail detail in _issueResponse!.results!.characterCredits!) {
          CustomDetailModel character = CustomDetailModel();
          character.name = detail.name;
          character.id = detail.id;
          final String imageUrl = await _issueRepository.getCharacterImage(
              detailUrl: detail.apiDetailUrl!);

          character.image = imageUrl;
          _characters.add(character);
        }
        notify(['characters']);
        for (Detail detail in _issueResponse!.results!.teamCredits!) {
          CustomDetailModel team = CustomDetailModel();
          team.name = detail.name;
          team.id = detail.id;
          final String imageUrl = await _issueRepository.getCharacterImage(
              detailUrl: detail.apiDetailUrl!);
          team.image = imageUrl;
          //print(team.toJson());
          _teams.add(team);
        }
        notify(['teams']);
        for (Detail detail in _issueResponse!.results!.locationCredits!) {
          CustomDetailModel location = CustomDetailModel();
          location.name = detail.name;
          location.id = detail.id;
          final String imageUrl = await _issueRepository.getCharacterImage(
              detailUrl: detail.apiDetailUrl!);
          location.image = imageUrl;
          _locations.add(location);
        }
        notify(['locations']);
        for (Detail detail in _issueResponse!.results!.conceptCredits!) {
          CustomDetailModel concept = CustomDetailModel();
          concept.name = detail.name;
          concept.id = detail.id;
          final String imageUrl = await _issueRepository.getCharacterImage(
              detailUrl: detail.apiDetailUrl!);
          concept.image = imageUrl;
          //print(team.toJson());
          _concepts.add(concept);
        }
        notify(['concepts']);
      }

      fetching = false;
      notify(['fetching']);
      notify(['issueResponse']);
    });
  }
}
