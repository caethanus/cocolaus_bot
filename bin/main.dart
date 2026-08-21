import 'package:nyxx/nyxx.dart';

void main() async {
  final client = await Nyxx.connectGateway('<TOKEN>', GatewayIntents.allUnprivileged);

  final botUser = await client.users.fetchCurrentUser();

  client.onMessageCreate.listen((event) async {
    if (event.mentions.contains(botUser)) {
      await event.message.channel.sendMessage(MessageBuilder(
        content: 'You mentioned me!',
        referencedMessage: MessageReferenceBuilder.reply(messageId: event.message.id),
      ));
    }
  });
}