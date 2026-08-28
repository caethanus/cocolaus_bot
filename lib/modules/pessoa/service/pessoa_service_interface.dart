import 'package:cocolaus_bot/modules/pessoa/entity/pessoa_entity.dart';
import 'package:cocolaus_bot/shared/service/base_service_interface.dart';

abstract class IPessoaService extends IBaseService<PessoaEntity> {
  Future<String> getNomePessoaByIdPessoa(String idPessoa);
}
