import 'dart:io';

import 'package:nyxx/nyxx.dart';

Future<void> main() async {
  final token = Platform.environment['DISCORD_TOKEN'];
  if (token == null) {
    throw StateError('DISCORD_TOKEN não encontrado nas variáveis de ambiente');
  }

  final client = await Nyxx.connectGateway(
    token,
    GatewayIntents.allUnprivileged | GatewayIntents.messageContent,
    options: GatewayClientOptions(plugins: [logging, cliIntegration]),
  );

  final botUser = await client.user.get();
  print('Conectado como ${botUser.username}');
}