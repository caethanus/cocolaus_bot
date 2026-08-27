import 'package:cocolaus_bot/modules/pessoa/entity/pessoa_entity.dart';
import 'package:cocolaus_bot/modules/pessoa/repository/pessoa_repository_interface.dart';
import 'package:cocolaus_bot/modules/pessoa/service/pessoa_service_interface.dart';
import 'package:cocolaus_bot/shared/service/base_service.dart';

class PessoaService extends BaseService<PessoaEntity, IPessoaRepository> implements IPessoaService {
  PessoaService(super.repository);
}
