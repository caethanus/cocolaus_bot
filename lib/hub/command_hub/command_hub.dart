import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class CommandHub {
  final CommandsPlugin plugin;

  List<ChatCommand> get commands => [presentation, registerUser];

  CommandHub(this.plugin);

  void registerAll() {
    for (var command in commands) {
      plugin.addCommand(command);
      print('${command.name} registrado com sucesso!');
    }
  }

  ///Lista de comandos, declarados em variáveis para passar na lista de commands e registrar na instância de criação do bot
  ChatCommand presentation = ChatCommand('apresentacao', 'Comando para testes iniciais do bot no discord', (ChatContext context) async {
    await context.respond(MessageBuilder(content: 'Salve tropa!'));
  });

  ChatCommand registerUser = ChatCommand('registrar', 'Cadastra no banco do bot um dos guys para trazer a coquinha da semana.', (ChatContext context, @Description('Nome do usuário') String username, [@Description('Usuário cadastrado') User? discordUser]) async {
    final idDiscord = discordUser?.id.toString() ?? context.user.id.toString();

    await context.respond(MessageBuilder(content: '${'$username $idDiscord'} Cadastrado com sucesso!'));
  });
}
