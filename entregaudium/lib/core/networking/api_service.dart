import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'dio_client.dart';

class ApiService {

  Future<Response> getProfile() async {
    Response response = await GetIt.instance<DioClient>().dio.get('/perfil.php');
    return response;
  }
}
