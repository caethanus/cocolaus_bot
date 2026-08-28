import 'package:cocolaus_bot/modules/cafe/cafe_command.dart';
import 'package:cocolaus_bot/modules/cafe/module/cafe_module_interface.dart';
import 'package:cocolaus_bot/shared/module/base_module.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class CafeModule extends BaseModule implements ICafeModule {
  @override
  List<ChatCommand> get commands => [CafeCommand.coffeTime];

  @override
  void createTable() {
    // TODO: implement createTable
  }

  @override
  void registerModule() {
    // TODO: implement registerModule
  }
}