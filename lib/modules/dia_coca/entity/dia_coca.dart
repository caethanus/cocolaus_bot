import 'package:cocolaus_bot/modules/dia_coca/enums/enum_status_dia_coca.dart';
import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:cocolaus_bot/shared/entity/base_entity_interface.dart';

class DiaCocaEntity implements IBaseEntity {
  @override
  BaseEntity base;

  String nomePessoa;

  DateTime? data;

  EnumStatusDiaCoca statusDiaCoca;

  DiaCocaEntity({required this.base, required this.nomePessoa, this.data, required this.statusDiaCoca});
}
