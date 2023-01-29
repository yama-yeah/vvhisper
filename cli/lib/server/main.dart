import 'dart:async';
import 'dart:io';
import 'dart:convert' as convert;

import 'package:cli/bridge.dart';

Future<HttpServer> startServer() async {
  final server =
      await HttpServer.bind(InternetAddress.loopbackIPv4, 8092, shared: true);
  return server;
}

enum MessageType {
  clear,
  stable,
}
