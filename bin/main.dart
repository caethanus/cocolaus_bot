import 'package:cocolaus_bot/shared/database/app_database.dart';
import 'package:get_it/get_it.dart';

void main() {
  final database = AppDatabase.create();

  final getIt = GetIt.instance;

  getIt.registerSingleton<AppDatabase>(database);


}