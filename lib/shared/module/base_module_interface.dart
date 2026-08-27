import 'package:get_it/get_it.dart';

abstract class IBaseModule {
  void registerModule();

  void registerDatabase(GetIt getIt);
}