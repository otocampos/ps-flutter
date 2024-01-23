
import 'package:entregaudium/core/entities/mapper_entity.dart';
import 'package:entregaudium/features/profile/domain/entities/historico_entity.dart';


class HistoricoModel extends DataMapper<HistoricoEntity> {
  String? quando;
  int? qtd;
  dynamic? valor;
  int? avaliacao;

  HistoricoModel({this.quando, this.qtd, this.valor, this.avaliacao});

  HistoricoModel.fromJson(Map<String, dynamic> json) {
    quando = json['quando'];
    qtd = json['qtd'];
    valor = json['valor'];
    avaliacao = json['avaliacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quando'] = this.quando;
    data['qtd'] = this.qtd;
    data['valor'] = this.valor;
    data['avaliacao'] = this.avaliacao;
    return data;
  }

  @override
  HistoricoEntity mapToEntity() {
    return HistoricoEntity(
      quando: quando,
      valor: valor,
      qtd: qtd,
      avaliacao: avaliacao,
    );
  }
}