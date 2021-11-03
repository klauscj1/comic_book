import 'package:comic_book/app/data/datasource/remote/issue_api.dart';
import 'package:comic_book/app/data/repository_impl/issue_repository_impl.dart';
import 'package:comic_book/app/domain/repositories/issue_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

const String apiKey = "ca774c6ed30f32d93a7aaac2eeb8d2205ac70872";
void injectDependencies() {
  Dio _dio = Dio(
      //BaseOptions(baseUrl: 'https://comicvine.gamespot.com/api/issues/'),
      );

  Get.i.lazyPut<Dio>(() => _dio);

  Get.i.lazyPut<IssueRepository>(() => IssueRepositoryImp(IssueAPI()));
}
