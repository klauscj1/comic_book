// To parse this JSON data, do
//
//     final issueResponse = issueResponseFromJson(jsonString);

import 'dart:convert';

IssueResponse issueResponseFromJson(String str) =>
    IssueResponse.fromJson(json.decode(str));

String issueResponseToJson(IssueResponse data) => json.encode(data.toJson());

class IssueResponse {
  IssueResponse({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  String? error;
  int? limit;
  int? offset;
  int? numberOfPageResults;
  int? numberOfTotalResults;
  int? statusCode;
  IssueResult? results;
  String? version;

  factory IssueResponse.fromJson(Map<String, dynamic> json) => IssueResponse(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: IssueResult.fromJson(json["results"]),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results!.toJson(),
        "version": version,
      };
}

class IssueResult {
  IssueResult({
    this.apiDetailUrl,
    this.characterCredits,
    this.conceptCredits,
    this.locationCredits,
    this.teamCredits,
  });

  String? apiDetailUrl;
  List<Detail>? characterCredits;
  List<Detail>? conceptCredits;
  List<Detail>? locationCredits;
  List<Detail>? teamCredits;

  factory IssueResult.fromJson(Map<String, dynamic> json) => IssueResult(
        apiDetailUrl: json["api_detail_url"],
        characterCredits: List<Detail>.from(
            json["character_credits"].map((x) => Detail.fromJson(x))),
        conceptCredits: List<Detail>.from(
            json["concept_credits"].map((x) => Detail.fromJson(x))),
        locationCredits: List<Detail>.from(
            json["location_credits"].map((x) => Detail.fromJson(x))),
        teamCredits: List<Detail>.from(
            json["team_credits"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "character_credits":
            List<dynamic>.from(characterCredits!.map((x) => x.toJson())),
        "concept_credits": List<dynamic>.from(conceptCredits!.map((x) => x)),
        "location_credits": List<dynamic>.from(locationCredits!.map((x) => x)),
        "team_credits": List<dynamic>.from(teamCredits!.map((x) => x)),
      };
}

class Detail {
  Detail({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
    this.role,
  });

  String? apiDetailUrl;
  int? id;
  String? name;
  String? siteDetailUrl;
  String? role;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        role: json["role"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "role": role ?? '',
      };
}
