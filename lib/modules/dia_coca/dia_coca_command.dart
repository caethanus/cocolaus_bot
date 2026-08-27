import 'package:cocolaus_bot/modules/dia_coca/service/dia_coca_service_interface.dart';
import 'package:get_it/get_it.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class DiaCocaCommand {
  static ChatCommand showCocaDay = ChatCommand('coca', 'mostra quem traz a coca na sexta da semana', (ChatContext context) async {
    final diaCocaService = GetIt.instance<IDiaCocaService>();

    final teste = await diaCocaService.get();
    String message = '';

    teste.isNotEmpty ? message = teste.first.statusDiaCoca.description : message = 'Sem registros.';

    await context.respond(MessageBuilder(content: message));
  });
}
