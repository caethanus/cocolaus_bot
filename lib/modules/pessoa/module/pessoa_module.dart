import 'package:cocolaus_bot/modules/pessoa/module/pessoa_module_interface.dart';
import 'package:cocolaus_bot/modules/pessoa/pessoa_command.dart';
import 'package:cocolaus_bot/modules/pessoa/repository/pessoa_repository.dart';
import 'package:cocolaus_bot/modules/pessoa/repository/pessoa_repository_interface.dart';
import 'package:cocolaus_bot/modules/pessoa/service/pessoa_service.dart';
import 'package:cocolaus_bot/modules/pessoa/service/pessoa_service_interface.dart';
import 'package:cocolaus_bot/shared/module/base_module.dart';
import 'package:get_it/get_it.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

class PessoaModule extends BaseModule implements IPessoaModule {
  final GetIt getIt;

  PessoaModule(this.getIt);

  @override
  List<ChatCommand> get commands => [PessoaCommand.registerUser, PessoaCommand.takeIt, PessoaCommand.unregisterUser];

  @override
  void registerModule() {
    getIt.registerLazySingleton<IPessoaRepository>(() => PessoaRepository());

    getIt.registerLazySingleton<IPessoaService>(() => PessoaService(getIt<IPessoaRepository>()));

  }
}
