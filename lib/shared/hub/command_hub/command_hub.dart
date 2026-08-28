import 'package:cocolaus_bot/shared/module/base_module.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class CommandHub {
  final CommandsPlugin plugin;

  final List<BaseModule> modules;

  CommandHub(this.plugin, this.modules);

  void registerAll() {
    for (var module in modules) {
      module.registerModule();

      for (var command in module.commands) {
        plugin.addCommand(command);
      }
    }
  }

  ///Lista de comandos, declarados em variáveis para passar na lista de commands e registrar na instância de criação do bot
  //todo: Reaver esse comando ChatCommand presentation = ChatCommand('apresentacao', 'Comando para testes iniciais do bot no discord', (ChatContext context) async {await context.respond(MessageBuilder(content: 'Salve tropa!'));});


  //todo: Reaver esse comando ChatCommand coffeTime = ChatCommand('coffe-time', 'Chama todos para tomarem café.', (ChatContext context) async {
  //   if (context.channel.id.toString() != EnumCanaisExclusivos.coffe.id) {
  //     await context.respond(MessageBuilder(content: 'Esse comando só pode ser usado no canal #coffe-time'));
  //
  //     return;
  //   }
  //   await context.respond(MessageBuilder(content: '@here coffe time!!!'));
  // });
}
