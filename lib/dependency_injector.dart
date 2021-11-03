import 'package:comic_book/app/data/datasource/remote/issue_api.dart';
import 'package:comic_book/app/data/repository_impl/issue_repository_impl.dart';
import 'package:comic_book/app/domain/repositories/issue_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

const String apiKey = "API_KEY";
void injectDependencies() {
  Dio _dio = Dio();

  Get.i.lazyPut<Dio>(() => _dio);

  Get.i.lazyPut<IssueRepository>(() => IssueRepositoryImp(IssueAPI()));
}
