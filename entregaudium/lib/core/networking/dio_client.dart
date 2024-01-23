import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;
//Estava configurando um interceptor no cliente centrlizador de requisições, com exibição de toast msg
  //quando o usuario estivesse sem conexo ou outros erros de requisição
  //preferi nao deixar implementado pois não deu tempo de testar direito e garntir a execução do meu código

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
