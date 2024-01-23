import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient() : _dio = Dio() {
    _dio.options = BaseOptions(
        baseUrl: 'https://dbgapi-gamadev.taximachine.com.br/ps',
        contentType: 'application/json',
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        connectTimeout: const Duration(seconds: 15));
  }

  Dio get dio => _dio;
}
