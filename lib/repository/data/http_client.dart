import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final prettyDioLogger = PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
  responseBody: true,
  responseHeader: false,
  error: true,
  compact: true,
  maxWidth: 90,
);

class HttpClients {
  static BaseOptions options = BaseOptions(
    baseUrl:
        "https://port-0-arikkari-backend-mvp-2rrqq2blmy418s6.sel5.cloudtype.app",
    connectTimeout: const Duration(
      milliseconds: 10000,
    ),
    receiveTimeout: const Duration(
      microseconds: 10000,
    ),
    // contentType: Headers.jsonContentType,
    /*headers: {
      "Authorization":
      "Bearer ${getStorageBox.read(GetStorageKey.keyMyAccessToken)}",
    },*/
  );

  static Dio dio = Dio(options)
    ..interceptors.addAll([
      prettyDioLogger,
    ]);

// static DiaryApi get diaryApi => DiaryApi(dio, baseUrl: '$baseUrl/diary');
  /// locationDiary 참조
}
