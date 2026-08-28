import 'package:cocolaus_bot/modules/dia_coca/service/dia_coca_service_interface.dart';
import 'package:cocolaus_bot/modules/pessoa/service/pessoa_service_interface.dart';
import 'package:cocolaus_bot/shared/extensions/date_time_extensions.dart';
import 'package:get_it/get_it.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class DiaCocaCommand {
  static ChatCommand showCocaDay = ChatCommand('coca', 'mostra quem traz a coca na sexta da semana', (ChatContext context) async {
    final dataCoca = DateTime.now().proximaSexta().toIso8601String();

    final diaCocaService = GetIt.instance<IDiaCocaService>();

    final idPessoa = await diaCocaService.getPessoaByData(dataCoca);

    final pessoaService = GetIt.instance<IPessoaService>();

    final pessoa = await pessoaService.getNomePessoaByIdPessoa(idPessoa);

    String message = '';

    pessoa.isNotEmpty ? message = '$pessoa, você é responsável por trazer a coca nessa semana!' : message = 'Não encontrado... não há ninguém para trazer a coquinha hoje.';

    await context.respond(MessageBuilder(content: message));
  });
}
