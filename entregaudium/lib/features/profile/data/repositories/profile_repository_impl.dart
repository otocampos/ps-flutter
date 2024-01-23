import 'package:entregaudium/features/profile/domain/entities/historico_entity.dart';
import 'package:entregaudium/features/profile/domain/entities/profile_entity.dart';
import 'package:entregaudium/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  //Adicionei essa camada de dados para pegar os dados de um objeto para facilitar o desenvolvimento da proxima etapa
  //Na próxima etapa apenas mudarei a fonte de dados do aplicativo onde farei o consumo da api
  @override
  Future<ProfileEntity?> getProfile() async {
    return ProfileEntity(
        nome: "Marcelo Coelho",
        cargo: 'Entregador de rua',
        descricao:
            'Trabalho no ramo de entregas há 3 anos e dizem que sou mais rápido que o Titanic! Aguarde um pouco que logo logo levarei seu pedido com segurança e rapidez! Até mais e obrigado pela preferência!',
        historico: [
          Historico(
              quando: '01/09/2020 20:35', qtd: 1, valor: 1.2, avaliacao: 5),
          Historico(
              quando: '01/09/2020 20:35', qtd: 1, valor: 1.2, avaliacao: 5),
          Historico(
              quando: '01/09/2020 20:35', qtd: 1, valor: 1.2, avaliacao: 5)
        ]);
  }
}
