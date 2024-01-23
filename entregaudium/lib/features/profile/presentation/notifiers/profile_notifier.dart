import 'package:dartz/dartz.dart';
import 'package:entregaudium/features/profile/domain/entities/profile_entity.dart';
import 'package:entregaudium/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:flutter/material.dart';

class ProfileNotifier extends ChangeNotifier {
  final GetProfileUseCase _profileService;

  ProfileEntity _profile = ProfileEntity(historico: []);

  ProfileNotifier(this._profileService);

  ProfileEntity get profile => _profile;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getProfile() async {
    setLoader(true);

    final result = await _profileService.execute(unit);
    result.fold(
      (failure) {
        setLoader(false);
      },
      (data) {
        _profile = data!;
        setLoader(false);
        notifyListeners();
      },
    );
  }
}
