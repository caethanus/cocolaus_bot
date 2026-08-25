import 'package:cocolaus_bot/hub/command_hub/command_hub.dart';
import 'package:dotenv/dotenv.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

Future<void> main() async {
  var env = DotEnv(includePlatformEnvironment: true)..load();

  final token = env['TOKEN_BOT_DISCORD'];
  if (token == null) {
    throw StateError('DISCORD_TOKEN não encontrado nas variáveis de ambiente');
  }

  final commands = CommandsPlugin(prefix: mentionOr((_) => '!'));
  CommandHub(commands).registerAll();

  final client = await Nyxx.connectGateway(token, GatewayIntents.allUnprivileged | GatewayIntents.messageContent, options: GatewayClientOptions(plugins: [logging, cliIntegration, commands]));

  final botUser = await client.user.get();
  print('Conectado como ${botUser.username}');
}