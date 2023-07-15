import 'dart:io';

import 'package:dio/dio.dart';
import 'package:soz_ucar/features/random_quote/model/random_quote_model.dart';

class RandomQuoteService {
  late final Dio _networkManager;
  dynamic message;
  RandomQuoteService()
      : _networkManager = Dio(BaseOptions(baseUrl: 'https://mocki.io/v1/'));
  Future<List<RandomQuoteReSponseModel>?> fetchPostItemsAdvance() async {
    try {
      final response =
          await _networkManager.get('a7643350-bf86-42a9-85df-279eca8c16d1');

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas
              .map((e) => RandomQuoteReSponseModel.fromJson(e))
              .toList();
        }
      }
    } catch (error) {
      message = error;
    }
    return null;
  }
}
