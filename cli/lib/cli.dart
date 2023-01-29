library cli;

import 'dart:io';

import 'package:cli/server/main.dart';
import 'package:dart_console/dart_console.dart';

import 'console/console.dart';

void start() async {
  final server = await startServer();
  startConsole(server);
}
