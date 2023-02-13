import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:msa_software/constants/base_url.dart';
import 'package:msa_software/models/users_model.dart';

import '../msa_dio/msa_dio.dart';

class ApiProvider {
  final Dio _dio = MSASoftwareDioClient.instance.api;

  Future<List<Users>> fetchUsers() async {
    try {
      Response response = await _dio.get("$baseUrl/users",
          options: buildCacheOptions(const Duration(days: 7)));
      return usersFromJson(jsonEncode(response.data));
    } catch (error, stackTrace) {
      return [];
    }
  }
}
