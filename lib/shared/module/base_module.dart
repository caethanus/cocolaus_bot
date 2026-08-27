import 'package:cocolaus_bot/shared/database/bot_database.dart';
import 'package:cocolaus_bot/shared/module/base_module_interface.dart';
import 'package:get_it/get_it.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

abstract class BaseModule implements IBaseModule {
  List<ChatCommand> get commands;

  @override
  void registerDatabase(GetIt getIt) {
    getIt.registerLazySingleton<BotDatabase>(() => BotDatabase());
  }

  void createTable();
}