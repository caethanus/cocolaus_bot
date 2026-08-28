import 'package:cocolaus_bot/shared/enums/enum_canais_exclusivos.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class CafeCommand {
  static ChatCommand coffeTime = ChatCommand('coffe-time', 'Chama todos para tomarem café.', (ChatContext context) async {
    if (context.channel.id.toString() != EnumCanaisExclusivos.coffe.id) {
      await context.respond(MessageBuilder(content: 'Esse comando só pode ser usado no canal #coffe-time'));

      return;
    }
    await context.respond(MessageBuilder(content: '@here coffe time!!!'));
  });
}