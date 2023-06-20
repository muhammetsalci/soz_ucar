import 'dart:io';

import 'package:dio/dio.dart';

import '../model/model.dart';

class PostService {
  late final Dio _networkManager;
  dynamic message;
  PostService()
      : _networkManager = Dio(BaseOptions(baseUrl: 'https://mocki.io/v1/'));
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response =
          await _networkManager.get('a7643350-bf86-42a9-85df-279eca8c16d1');

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } catch (error) {
      message = error;
    }
    return null;
  }
}
