import 'package:cocolaus_bot/modules/pessoa/entity/pessoa_entity.dart';
import 'package:cocolaus_bot/modules/pessoa/service/pessoa_service_interface.dart';
import 'package:cocolaus_bot/shared/entity/base_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class PessoaCommand {
  static ChatCommand registerUser = ChatCommand('registrar', 'Cadastra no banco do bot um dos guys para trazer a coquinha da semana.', (ChatContext context, @Description('Nome do usuário') String username, [@Description('Usuário cadastrado') User? discordUser]) async {
    final idDiscord = discordUser?.id.toString() ?? context.user.id.toString();

    final pessoaService = GetIt.instance<IPessoaService>();

    await pessoaService.save(PessoaEntity(base: BaseEntity.novo(), nome: username, idDiscord: idDiscord));

    await context.respond(MessageBuilder(content: '${'$username $idDiscord'} Cadastrado com sucesso!'));
  });

  static ChatCommand unregisterUser = ChatCommand('remover', 'Remove algum usuário da lista de coca. OBS: Será necessário cadastrar novamente', (ChatContext context, @Description('Usuário para deletar') User? discordUser) async {
    final discordId = discordUser?.id;
    if(discordId == null) throw StateError('Erro ao deletar, confira se o usuário está cadastrado e tente novamente.');

    final pessoaService = GetIt.instance<IPessoaService>();

    await pessoaService.delete(discordId.toString());
  },);

  static ChatCommand takeIt = ChatCommand('tome', 'Mostra uma mensagem especial para um determinado usuario, ou para todos.', (ChatContext context, [@Description('Quem') String? user]) async {
    String mensagem;

    if (user != null) {
      mensagem = '$user pois tomeeeee';
    } else {
      mensagem = 'pois tomeeeee';
    }

    await context.respond(MessageBuilder(content: mensagem));
  });
}
