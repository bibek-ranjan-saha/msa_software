import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../constants/base_url.dart';
import 'msa_interceptor.dart';

class MSASoftwareDioClient {
  static MSASoftwareDioClient? _instance;

  Dio api = Dio();

  MSASoftwareDioClient._() {
    api.interceptors.addAll([
      DioCacheManager(
        CacheConfig(
          baseUrl: baseUrl,
          defaultMaxAge: const Duration(days: 7),
          defaultMaxStale: const Duration(days: 10),
        ),
      ).interceptor,
      // MSAInterceptor()
    ]);
  }

  static MSASoftwareDioClient get instance {
    _instance ??= MSASoftwareDioClient._();
    return _instance!;
  }
}
