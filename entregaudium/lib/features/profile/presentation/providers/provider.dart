import 'package:entregaudium/features/profile/domain/repositories/profile_repository.dart';
import 'package:entregaudium/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:entregaudium/features/profile/presentation/notifiers/profile_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final profileNotifierProvider =
ChangeNotifierProvider((ref) => ProfileNotifier(GetProfileUseCase(GetIt.instance<ProfileRepository>())));