import 'historico_entity.dart';

class ProfileEntity {
  ProfileEntity(
      {this.nome,
      this.cargo,
      this.descricao,
      this.historico,
      this.mediaAvaliacao,
      this.totalEntregas,
      this.totalSaldo});

  String? nome;
  String? cargo;
  String? descricao;
  List<HistoricoEntity>? historico;
  double? mediaAvaliacao;
  double? totalSaldo;
  int? totalEntregas;
}
