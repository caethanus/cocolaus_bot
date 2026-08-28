import 'package:cocolaus_bot/modules/pessoa/entity/pessoa_entity.dart';
import 'package:cocolaus_bot/shared/repository/base_repository_interface.dart';

abstract class IPessoaRepository extends IBaseRepository<PessoaEntity> {
  Future<String> getNomePessoaByIdPessoa(String idPessoa);
}