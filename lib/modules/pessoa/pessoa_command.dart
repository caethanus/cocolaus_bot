import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class PessoaCommand {
  static ChatCommand registerUser = ChatCommand('registrar', 'Cadastra no banco do bot um dos guys para trazer a coquinha da semana.', (ChatContext context, @Description('Nome do usuário') String username, [@Description('Usuário cadastrado') User? discordUser]) async {
    final idDiscord = discordUser?.id.toString() ?? context.user.id.toString();

    await context.respond(MessageBuilder(content: '${'$username $idDiscord'} Cadastrado com sucesso!'));
  });
}
