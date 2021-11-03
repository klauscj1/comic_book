import 'dart:convert';

import 'package:comic_book/app/domain/models/issue_model.dart';
import 'package:comic_book/app/domain/models/responses/issue_response.dart';
import 'package:comic_book/dependency_injector.dart';
import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class IssueAPI {
  final _dio = Get.i.find<Dio>();

  Future<List<Issue>> getIssues() async {
    try {
      final response = await _dio.get(
        'https://comicvine.gamespot.com/api/issues',
        queryParameters: {
          'api_key': apiKey,
          'format': 'json',
          'sort': 'date_added:desc'
        },
      );

      List<Issue> issues = [];
      for (dynamic object in response.data['results']) {
        final data = object as Map<String, dynamic>;
        Issue issue = Issue();
        issue.name = data['name'] ?? "";
        issue.dateAdded = DateTime.parse(data['date_added']);
        issue.image = data['image']['original_url'];
        issue.issueNumber = data['issueNumber'] ?? '';
        issue.apiDetailUrl = data['api_detail_url'] ?? '';
        issues.add(issue);
      }
      return issues;
    } on DioError catch (e) {
      print(" aqui-> $e");
      print(json.decode(e.response.toString()));
      return [];
    } on Exception catch (e) {
      print(" aqui2-> $e");
      return [];
    }
  }

  Future<IssueResponse?> getIssue(String url) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          'api_key': apiKey,
          'format': 'json',
        },
      );
      IssueResponse issueResponse = IssueResponse.fromJson(response.data);
      return issueResponse;
    } on DioError catch (e) {
      print(" aqui-> $e");
      print(json.decode(e.response.toString()));
      return null;
    } on Exception catch (e) {
      print(" aqui2-> $e");
      return null;
    }
  }

  Future<String> getCharacterImage(String url) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          'api_key': apiKey,
          'format': 'json',
        },
      );

      final data = response.data['results'];

      return data['image']['icon_url'];
    } on DioError catch (e) {
      print(" aqui-> $e");
      print(json.decode(e.response.toString()));
      return "";
    } on Exception catch (e) {
      print(" aqui2-> $e");
      return "";
    }
  }
}
