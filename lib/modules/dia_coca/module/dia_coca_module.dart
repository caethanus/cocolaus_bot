import 'package:cocolaus_bot/modules/dia_coca/dia_coca_command.dart';
import 'package:cocolaus_bot/modules/dia_coca/module/dia_coca_module_interface.dart';
import 'package:cocolaus_bot/modules/dia_coca/repository/dia_coca_repository.dart';
import 'package:cocolaus_bot/modules/dia_coca/repository/dia_coca_repository_interface.dart';
import 'package:cocolaus_bot/modules/dia_coca/service/dia_coca_service.dart';
import 'package:cocolaus_bot/modules/dia_coca/service/dia_coca_service_interface.dart';
import 'package:cocolaus_bot/shared/database/bot_database.dart';
import 'package:cocolaus_bot/shared/module/base_module.dart';
import 'package:get_it/get_it.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class DiaCocaModule extends BaseModule implements IDiaCocaModule {
  final GetIt getIt;

  DiaCocaModule(this.getIt);

  @override
  List<ChatCommand> get commands => [DiaCocaCommand.showCocaDay];

  @override
  void registerModule() {
    getIt.registerLazySingleton<IDiaCocaRepository>(() => DiaCocaRepository(),);

    getIt.registerLazySingleton<IDiaCocaService>(() => DiaCocaService(getIt<IDiaCocaRepository>()),);
  }
}