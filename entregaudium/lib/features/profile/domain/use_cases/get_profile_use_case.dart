import 'package:entregaudium/features/profile/domain/repositories/profile_repository.dart';

import '../entities/profile_entity.dart';

class GetProfileUseCase {
  ProfileRepository profileRepository;

  GetProfileUseCase(this.profileRepository);

  Future<ProfileEntity?> call() {
    return profileRepository.getProfile();
  }
}
