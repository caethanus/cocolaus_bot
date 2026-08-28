import 'package:cocolaus_bot/modules/dia_coca/entity/dia_coca.dart';
import 'package:cocolaus_bot/modules/dia_coca/enums/enum_status_dia_coca.dart';
import 'package:cocolaus_bot/modules/dia_coca/service/dia_coca_service_interface.dart';
import 'package:cocolaus_bot/modules/pessoa/entity/pessoa_entity.dart';
import 'package:cocolaus_bot/modules/pessoa/repository/pessoa_repository_interface.dart';
import 'package:cocolaus_bot/modules/pessoa/service/pessoa_service_interface.dart';
import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/service/base_service.dart';
import 'package:get_it/get_it.dart';

class PessoaService extends BaseService<PessoaEntity, IPessoaRepository> implements IPessoaService {
  PessoaService(super.repository);

  @override
  Future<void> save(PessoaEntity e) {
    final diaCocaService = GetIt.instance<IDiaCocaService>();

    diaCocaService.save(DiaCocaEntity(base: BaseEntity.novo(), idPessoaSemana: e.idDiscord, data: null, statusDiaCoca: EnumStatusDiaCoca.pendente));

    return super.save(e);
  }
}
