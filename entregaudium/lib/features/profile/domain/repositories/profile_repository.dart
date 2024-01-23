import 'package:dartz/dartz.dart';
import 'package:entregaudium/core/models/Failure.dart';
import 'package:entregaudium/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository{
  Future<Either<Failure, ProfileEntity?>>  getProfile();
}