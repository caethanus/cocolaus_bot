import 'package:dotenv/dotenv.dart';

void main() {
  var env = DotEnv(includePlatformEnvironment: true);

  env.load(['assets/.env']);

  final token = env['TOKEN_BOT_DISCORD'];

  print(token);
}