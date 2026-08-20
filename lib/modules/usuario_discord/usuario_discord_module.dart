import 'package:cocolaus_bot/modules/usuario_discord/repository/usuario_discord_repository.dart';
import 'package:get_it/get_it.dart';

class UsuarioDiscordModule {

  static void inject(GetIt getIt) {
    
    getIt.registerSingleton<UsuarioDiscordRepository>(UsuarioDiscordRepository(_db, _table));
    
  }
}