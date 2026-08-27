import 'package:cocolaus_bot/config/bot/bot_config.dart';
import 'package:cocolaus_bot/modules/pessoa/module/pessoa_module.dart';
import 'package:cocolaus_bot/shared/module/base_module.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  final getIt = GetIt.instance;

  List<BaseModule> modules = [PessoaModule(getIt)];

  await BotConfig(modules).init();
}
