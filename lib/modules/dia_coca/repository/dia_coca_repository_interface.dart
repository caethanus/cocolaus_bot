import 'package:cocolaus_bot/modules/dia_coca/entity/dia_coca.dart';
import 'package:cocolaus_bot/shared/repository/base_repository_interface.dart';

abstract class IDiaCocaRepository extends IBaseRepository<DiaCocaEntity> {
  Future<String> getPessoaByData(String data);
}
