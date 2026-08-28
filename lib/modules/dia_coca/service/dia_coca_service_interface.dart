import 'package:cocolaus_bot/modules/dia_coca/entity/dia_coca.dart';
import 'package:cocolaus_bot/shared/service/base_service_interface.dart';
import 'package:nyxx/nyxx.dart';

abstract class IDiaCocaService extends IBaseService<DiaCocaEntity> {
  Future<void> avisarTrazerCoca({required NyxxGateway client});
}
