import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

ChatCommand presentation = ChatCommand('apresentacao', 'Comando para testes iniciais do bot no discord', (ChatContext context) async {
  await context.respond(MessageBuilder(content: 'Hey there! My name is Cocolaus!'));
});
