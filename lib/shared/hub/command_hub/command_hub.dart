import 'dart:io';

import 'package:cocolaus_bot/shared/enums/enum_canais_exclusivos.dart';
import 'package:cocolaus_bot/shared/module/base_module.dart';
import 'package:cocolaus_bot/shared/module/base_module_interface.dart';
import 'package:nyxx/nyxx.dart';
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
  ChatCommand presentation = ChatCommand('apresentacao', 'Comando para testes iniciais do bot no discord', (ChatContext context) async {
    await context.respond(MessageBuilder(content: 'Salve tropa!'));
  });

  ChatCommand registerUser = ChatCommand('registrar', 'Cadastra no banco do bot um dos guys para trazer a coquinha da semana.', (ChatContext context, @Description('Nome do usuário') String username, [@Description('Usuário cadastrado') User? discordUser]) async {
    final idDiscord = discordUser?.id.toString() ?? context.user.id.toString();

    //TODO Caetano: aqui vai ter que ser implemntado o método correspondente para cadastrar no banco do bot

    await context.respond(MessageBuilder(content: '${'$username $idDiscord'} Cadastrado com sucesso!'));
  });

  ChatCommand takeIt = ChatCommand('tome', 'Pois tome um gif maroto', id('tome_gif_id', (ChatContext context) async {

    final gifTomePath = File('assets/pois-tome.gif');

    if (await gifTomePath.exists()) {

      final bytes = await gifTomePath.readAsBytes();
      final gifAnexo = AttachmentBuilder(data: bytes, fileName: 'pois-tome.gif');

      await context.respond(MessageBuilder(content: 'POIS TOMEE', attachments: [gifAnexo]), level: ResponseLevel.public);

    } else {
      print('Erro ao carregar o gif: Arquivo ausente.');
      await context.respond(MessageBuilder(content: 'Não consegui encontrar o gif no meu sistema. 😢'), level: ResponseLevel.public);
    }
  }),
  );

  ChatCommand coffeTime = ChatCommand('coffe-time', 'Chama todos para tomarem café.', (ChatContext context) async {
    if (context.channel.id.toString() != EnumCanaisExclusivos.coffe.id) {
      await context.respond(MessageBuilder(content: 'Esse comando só pode ser usado no canal #coffe-time'));

      return;
    }
    await context.respond(MessageBuilder(content: '@here coffe time!!!'));
  });
}
