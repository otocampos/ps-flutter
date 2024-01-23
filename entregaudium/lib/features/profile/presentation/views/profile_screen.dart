import 'package:entregaudium/core/utils/constants_colors.dart';
import 'package:entregaudium/core/utils/images_constants.dart';
import 'package:entregaudium/core/utils/entregaudium_typography.dart';
import 'package:entregaudium/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:entregaudium/features/profile/domain/entities/profile_entity.dart';
import 'package:entregaudium/features/profile/domain/repositories/profile_repository.dart';
import 'package:entregaudium/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:entregaudium/features/profile/presentation/notifiers/profile_notifier.dart';
import 'package:entregaudium/features/profile/presentation/providers/provider.dart';
import 'package:entregaudium/features/profile/presentation/views/widgets/stats_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(profileNotifierProvider).getProfile(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final profileNotifier = ref.watch(profileNotifierProvider);
          ProfileEntity profileEntity = profileNotifier.profile;

          return profileNotifier.isLoading
              ? const Center(
              child: CircularProgressIndicator())
              : Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(
                'assets/images/img_entregador.png',
                fit: BoxFit.cover,
              )),
              Positioned(
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color:
                            EntregaudiumColors.transparentBlueBackGroundColor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24, top: 16, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profileEntity.nome!,
                                style: EntregaudiumTypography.title(),
                              ),
                              Text(
                                profileEntity.cargo!,
                                style: EntregaudiumTypography.subTitle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: EntregaudiumColors.blueBackGroundColor,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24.0, top: 20, right: 24, bottom: 35),
                              child: Text(
                                profileEntity.descricao!,
                                style: EntregaudiumTypography.desc(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: Row(
                                children: [
                                  StatsProfileRowWidget(
                                    image: ImagesConstants.starImage,
                                    value: '4.7',
                                    desc: 'Nota',
                                  ),
                                  StatsProfileRowWidget(
                                    image: ImagesConstants.walletImage,
                                    value: 'R\$ 33,50',
                                    desc: 'Saldo',
                                  ),
                                  StatsProfileRowWidget(
                                    image: ImagesConstants.cartImage,
                                    value: '254',
                                    desc: 'Entregas',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
