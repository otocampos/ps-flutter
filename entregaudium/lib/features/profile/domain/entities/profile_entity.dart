import 'historico_entity.dart';

class ProfileEntity {
  ProfileEntity({
      this.nome, 
      this.cargo, 
      this.descricao, 
      this.historico,});


  String? nome;
  String? cargo;
  String? descricao;
  List<Historico>? historico;



}