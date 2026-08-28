import 'package:cocolaus_bot/modules/dia_coca/service/dia_coca_service_interface.dart';
import 'package:cron/cron.dart';
import 'package:get_it/get_it.dart';
import 'package:nyxx/nyxx.dart';

class CronJob {
  static final Cron _cron = Cron();
  final Map<String, ScheduledTask> _jobs = {};

  void _addJob({required String name, required String cronExpression, required Future<void> Function() task}) {
    final schedule = Schedule.parse(cronExpression);
    _jobs[name] = _cron.schedule(schedule, task);
  }

  Future<void> cancelJob(String name) async {
    await _jobs[name]?.cancel();
    _jobs.remove(name);
  }

  Future<void> dispose() async {
    await _cron.close();
    _jobs.clear();
  }

  ///Caetano: esse método será responsável por registrar e executar os jobs conforme forem instanciados, então na main só chama ele e registra dentro
  ///o que precisa ser executado
  void executeJobs(NyxxGateway client) {
    _addJob(
      name: 'iniciar_agendamento_coca',
      cronExpression: '0 9 * * 5',
      task: () async {
        return await GetIt.instance<IDiaCocaService>().avisarTrazerCoca(client: client);
      },
    );
  }
}
