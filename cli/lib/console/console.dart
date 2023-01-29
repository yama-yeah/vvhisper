import 'dart:io';

import 'package:cli/apis/whisper.dart';
import 'package:cli/bridge.dart';
import 'package:dart_clipboard/dart_clipboard.dart';

import 'package:dart_console/dart_console.dart';
import 'dart:convert' as convert;

import '../server/main.dart';

void startConsole(HttpServer server) async {
  List<String> urls = [];
  server.listen((HttpRequest request) {
    if (request.method == 'POST') {
      request.listen((List<int> buffer) async {
        //print('POST: ');
        final jsonStr = convert.utf8.decode(buffer);
        final json = convert.json.decode(jsonStr) as Map<String, dynamic>;
        print(json);
        if (json['type'] == MessageType.clear.name) {
          urls = [];
        } else if (json['type'] == MessageType.stable.name) {
          print('stable');
          final text = await Whisper()
              .transcribeFromURL(json['url'], WhisperLanguages.english);
          Clipboard.setContents(text);
          print(text);
        }
      });
    }
  });
}

void main(List<String> args) {
  print(MessageType.stable.name);
}
