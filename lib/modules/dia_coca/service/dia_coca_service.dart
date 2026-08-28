import 'package:cocolaus_bot/modules/dia_coca/entity/dia_coca.dart';
import 'package:cocolaus_bot/modules/dia_coca/repository/dia_coca_repository_interface.dart';
import 'package:cocolaus_bot/modules/dia_coca/service/dia_coca_service_interface.dart';
import 'package:cocolaus_bot/shared/enums/enum_canais_exclusivos.dart';
import 'package:cocolaus_bot/shared/service/base_service.dart';
import 'package:nyxx/nyxx.dart';

class DiaCocaService extends BaseService<DiaCocaEntity, IDiaCocaRepository> implements IDiaCocaService {
  DiaCocaService(super.repository);

  @override
  Future<void> avisarTrazerCoca({required NyxxGateway client, String idCanalDiscord = ''}) async {
    final idCanal = idCanalDiscord.isEmpty ? EnumCanaisExclusivos.geral.id : idCanalDiscord;

    final channel = await client.channels.fetch(Snowflake.parse(idCanal));

    if (channel is! TextChannel) {
      throw StateError('O canal $idCanalDiscord não é um canal de texto.');
    }



    await channel.sendMessage(MessageBuilder(content: 'Funalo, você trará a coca hoje!'));
  }

  @override
  Future<String> getPessoaByData(String data) async => await repository.getPessoaByData(data);
}
