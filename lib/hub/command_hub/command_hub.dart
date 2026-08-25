import 'package:cocolaus_bot/commands/commands.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class CommandHub {
  final CommandsPlugin plugin;
  
  CommandHub(this.plugin);
  
  void registerAll() {
    plugin.addCommand(presentation);
  }
}