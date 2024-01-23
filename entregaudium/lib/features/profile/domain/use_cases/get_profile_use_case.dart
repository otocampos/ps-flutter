import 'package:dartz/dartz.dart';
import 'package:entregaudium/core/models/Failure.dart';
import 'package:entregaudium/core/use_case/base_use_case.dart';
import 'package:entregaudium/features/profile/domain/repositories/profile_repository.dart';

import '../entities/profile_entity.dart';

class GetProfileUseCase extends BaseUseCase<Unit,ProfileEntity?> {
  ProfileRepository profileRepository;

  GetProfileUseCase(this.profileRepository);



  @override
  Future<Either<Failure, ProfileEntity?>> execute(Unit input)async {
  final result =   await profileRepository.getProfile();
  print(result);
  return result;
  }
}
