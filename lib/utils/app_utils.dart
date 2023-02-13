import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:msa_software/constants/app_keys.dart';

void showSnackBar({BuildContext? context, required String text}) {
  SnackBar mainContent = SnackBar(
    content: Text(text),
    behavior: SnackBarBehavior.floating,
  );
  if (context == null) {
    snackBarKey.currentState?.showSnackBar(mainContent);
  } else {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(mainContent);
  }
}

extension UsersList<T> on List<T> {
  static String? _error;

  set withError(String message) => _error = message;

  String? get errorMessage => _error;
}


void notifyDataSource(Response response) {
  if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
    showSnackBar(text: "Data is being loaded from cache");
  }
}