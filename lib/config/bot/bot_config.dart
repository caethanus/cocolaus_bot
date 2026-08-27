import 'package:cocolaus_bot/shared/hub/command_hub/command_hub.dart';
import 'package:cocolaus_bot/shared/module/base_module.dart';
import 'package:dotenv/dotenv.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class BotConfig {
  late final NyxxGateway client;
  final CommandsPlugin _commands = CommandsPlugin(prefix: mentionOr((_) => '!'));
  final List<BaseModule> modules;

  BotConfig(this.modules);

  Future<void> init() async {
    var env = DotEnv(includePlatformEnvironment: true)..load();

    client = await Nyxx.connectGateway(_getBotEnv(env), GatewayIntents.allUnprivileged | GatewayIntents.messageContent, options: GatewayClientOptions(plugins: [logging, cliIntegration, _commands]));
    CommandHub(_commands, modules).registerAll();

    final botUser = await getUser();

    print('Conectado como ${botUser.username}');
  }

  String _getBotEnv(DotEnv env) {
    final token = env['TOKEN_BOT_DISCORD'];
    if (token == null) {
      throw StateError('DISCORD_TOKEN não encontrado nas variáveis de ambiente');
    }

    return token;
  }

  Future<User> getUser() async {
    return await client.user.get();
  }
}
