import 'package:entregaudium/core/utils/constants_colors.dart';
import 'package:entregaudium/core/utils/images_constants.dart';
import 'package:entregaudium/core/utils/entregaudium_typography.dart';
import 'package:entregaudium/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:entregaudium/features/profile/domain/entities/profile_entity.dart';
import 'package:entregaudium/features/profile/domain/repositories/profile_repository.dart';
import 'package:entregaudium/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileRepository profileRepository = ProfileRepositoryImpl();
    GetProfileUseCase getProfileUseCase = GetProfileUseCase(profileRepository);
    return Scaffold(
      body: FutureBuilder(
        future: getProfileUseCase.call(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar o perfil'),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text('Nenhum dado disponível'),
            );
          } else {
          return Stack(
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        color:EntregaudiumColors.transparentBlueBackGroundColor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24, top: 16, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data.nome!,
                                style: EntregaudiumTypography.title(),
                              ),
                              Text(
                                  snapshot.data.cargo!,
                                  style: EntregaudiumTypography.subTitle(),

                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color:EntregaudiumColors.blueBackGroundColor,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24.0, top: 20, right: 24, bottom: 35),
                              child: Text(snapshot.data.descricao,
                                style: EntregaudiumTypography.desc(),),
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
          );}
        },
      ),
    );
  }
}

class StatsProfileRowWidget extends StatelessWidget {
  String image;
  String value;
  String desc;

  StatsProfileRowWidget({required this.image,
    required this.value,
    required this.desc,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            Image.asset(image),
            Text(
              value,
              style: EntregaudiumTypography.numberIndicator(),
            ),
            Text(
              desc,
              style: EntregaudiumTypography.nameIndicator(),
            )
          ],
        ));
  }
}
