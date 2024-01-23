import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:entregaudium/core/models/Failure.dart';
import 'package:entregaudium/core/networking/api_service.dart';
import 'package:entregaudium/core/networking/error_handler.dart';
import 'package:entregaudium/features/profile/data/models/base_response_model.dart';
import 'package:entregaudium/features/profile/data/models/profile_model.dart';
import 'package:entregaudium/features/profile/domain/entities/profile_entity.dart';
import 'package:entregaudium/features/profile/domain/repositories/profile_repository.dart';
import 'package:get_it/get_it.dart';

class ProfileRepositoryImpl implements ProfileRepository {


  @override
  Future<Either<Failure, ProfileEntity?>> getProfile() async {
    try {
      final Response response =  await GetIt.instance<ApiService>().getProfile();
      print(response.data);

      ProfileModel profileModel = BaseResponseModel.fromJson(response.data).response;
      return Right(profileModel.mapToEntity());
    } on DioException catch (e) {
    return Left(ErrorHandler.handle(e).failure);
    }
  }
}
