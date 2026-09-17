import 'package:cocolaus_bot/modules/dia_coca/service/dia_coca_service_interface.dart';
import 'package:get_it/get_it.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class DiaCocaCommand {
  static ChatCommand showCocaDay = ChatCommand('coca', 'mostra quem traz a coca na sexta da semana', (ChatContext context) async {
    final diaCocaService = GetIt.instance<IDiaCocaService>();

    final listaDiasCoca = await diaCocaService.get();
    String message = '';

    listaDiasCoca.isNotEmpty ? message = '${listaDiasCoca.first.nomePessoa} você quem traz a coca bro, se liga!' : message = 'Sem registros.';

    await context.respond(MessageBuilder(content: message));
  });

  static ChatCommand passTurn = ChatCommand('pular', 'pula a semana para trazer a coca na outra', (ChatContext context) async {
    final diaCocaService = GetIt.instance<IDiaCocaService>();

    diaCocaService.pulaDiaCoca();

    await context.respond(MessageBuilder(content: '${context.user.username} adiou a coquinha para próxima semana.'));

  });
}
