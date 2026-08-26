import 'package:cocolaus_bot/shared/enums/enum_canais_exclusivos.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class CommandHub {
  final CommandsPlugin plugin;

  List<ChatCommand> get commands => [presentation, takeIt, coffeTime];

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

  ChatCommand takeIt = ChatCommand('tome', 'Mostra uma mensagem especial para um determinado usuario, ou para todos.', (ChatContext context, [@Description('Quem') String? user]) async {
    String mensagem;
    if (user != null) {
      mensagem = '$user pois tomeeeee';
    } else {
      mensagem = 'pois tomeeeee';
    }

    await context.respond(MessageBuilder(content: mensagem));
  });

  ChatCommand coffeTime = ChatCommand('coffe-time', 'Chama todos para tomarem café.', (ChatContext context) async {

    if (context.channel.id.toString() != EnumCanaisExclusivos.coffe.id) {
      await context.respond(MessageBuilder(content: 'Esse comando só pode ser usado no canal #coffe-time'));

      return;
    }
    await context.respond(MessageBuilder(content: '@here coffe time!!!'));
  });
}
