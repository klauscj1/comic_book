class Issue {
  Issue(
      {this.issueNumber,
      this.name,
      this.dateAdded,
      this.image,
      this.apiDetailUrl});

  String? issueNumber;
  String? name;
  DateTime? dateAdded;
  String? image;
  String? apiDetailUrl;

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        issueNumber: json["issue_number"],
        name: json["name"],
        dateAdded: DateTime.parse(json["date_added"]),
        image: json["image"],
        apiDetailUrl: json["api_detail_url"],
      );

  Map<String, dynamic> toJson() => {
        "issue_number": issueNumber,
        "name": name,
        "date_added": dateAdded!.toIso8601String(),
        "image": image,
        "api_detail_url": apiDetailUrl
      };
}
