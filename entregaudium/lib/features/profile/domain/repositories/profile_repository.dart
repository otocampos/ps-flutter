import 'package:entregaudium/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository{
  Future<ProfileEntity?> getProfile();
}