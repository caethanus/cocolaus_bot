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
}
