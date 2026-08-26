import 'package:cocolaus_bot/shared/module/base_module_interface.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

abstract class BaseModule implements IBaseModule {
  List<ChatCommand> get commands;
}