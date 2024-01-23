import 'package:entregaudium/core/mapper_entity.dart';
import 'package:entregaudium/features/profile/domain/entities/profile_entity.dart';

import 'historico_model.dart';

class ProfileModel extends DataMapper<ProfileEntity> {
  ProfileModel({
    this.nome,
    this.cargo,
    this.descricao,
    this.historico,
  });

  String? nome;
  String? cargo;
  String? descricao;
  List<HistoricoModel>? historico;

  @override
  ProfileEntity mapToEntity() {

    return ProfileEntity(
        nome: nome,
        cargo: cargo,
        descricao: descricao,
        historico: historico
            !.map((historicoModel) => historicoModel.mapToEntity())
            .toList(),
       );
  }

  @override
  String toString() {
    return 'ProfileModel{nome: $nome, cargo: $cargo, descricao: $descricao, historico: $historico}';
  }

  ProfileModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cargo = json['cargo'];
    descricao = json['descricao'];
    if (json['historico'] != null) {
      historico = <HistoricoModel>[];
      json['historico'].forEach((v) {
        historico!.add(new HistoricoModel.fromJson(v));
      });
    }
  }
}
