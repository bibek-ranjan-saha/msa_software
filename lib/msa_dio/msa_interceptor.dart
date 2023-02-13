import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:msa_software/utils/app_utils.dart';

import '../constants/app_keys.dart';

class MSAInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
      showSnackBar(
          context: snackBarKey.currentContext!,
          text: "data is coming from cache may be older");
    }
    super.onResponse(response, handler);
  }
}
