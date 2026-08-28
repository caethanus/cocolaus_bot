import 'package:cocolaus_bot/modules/dia_coca/entity/dia_coca.dart';
import 'package:cocolaus_bot/modules/dia_coca/repository/dia_coca_repository_interface.dart';
import 'package:cocolaus_bot/modules/dia_coca/service/dia_coca_service_interface.dart';
import 'package:cocolaus_bot/shared/service/base_service.dart';

class DiaCocaService extends BaseService<DiaCocaEntity, IDiaCocaRepository> implements IDiaCocaService {
  DiaCocaService(super.repository);
}
