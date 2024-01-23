import 'package:entregaudium/core/widgets/custom_toast.dart';
import 'package:entregaudium/core/widgets/custom_toast_msg_impl.dart';
import 'package:entregaudium/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:entregaudium/features/profile/domain/repositories/profile_repository.dart';
import 'package:get_it/get_it.dart';

import '../networking/api_service.dart';
import '../networking/dio_client.dart';

final instance = GetIt.instance;

Future<GetIt> initAppModule() async {
  GetIt.I.registerSingleton<DioClient>(DioClient());
  GetIt.I.registerSingleton<ApiService>(ApiService());
  GetIt.I.registerSingleton<ProfileRepository>(ProfileRepositoryImpl());
  return instance;
}